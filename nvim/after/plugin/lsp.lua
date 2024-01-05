local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')


    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    nmap('<F3>', vim.lsp.buf.format, 'Format code')
    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "clangd",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "texlab",
        "tsserver"
    },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),

        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})

local clangd = require('lspconfig').clangd
clangd.setup({
    cmd = {
        "clangd",
        "--background-index",
        "--header-insertion=never",
        '--query-driver=/home/ivan/.local/esp32/toolchain-esp32/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc*'
    },
    keys = {
        { "<leader>o", "", desc = "Switch Source/Header (C/C++)" },
    },
    on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>o", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
    end,
    filetypes = { "c", "cpp" },
})

local rust_tools = require('rust-tools')
rust_tools.setup({
    server = {
        on_attach = function(client, bufnr)
            -- vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        end
    }
})

vim.g.haskell_tools = {
    hls = {
        capabilities = lsp_zero.get_capabilities()
    }
}

-- Autocmd that will actually be in charging of starting hls
local hls_augroup = vim.api.nvim_create_augroup('haskell-lsp', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    group = hls_augroup,
    pattern = { 'haskell' },
    callback = function()
        ---
        -- Suggested keymaps from the quick setup section:
        -- https://github.com/mrcjkb/haskell-tools.nvim#quick-setup
        ---

        local ht = require('haskell-tools')
        local bufnr = vim.api.nvim_get_current_buf()
        local def_opts = { noremap = true, silent = true, buffer = bufnr, }
        -- haskell-language-server relies heavily on codeLenses,
        -- so auto-refresh (see advanced configuration) is enabled by default
        vim.keymap.set('n', '<space>ca', vim.lsp.codelens.run, def_opts)
        -- Hoogle search for the type signature of the definition under the cursor
        vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, def_opts)
        -- Evaluate all code snippets
        vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, def_opts)
        -- Toggle a GHCi repl for the current package
        vim.keymap.set('n', '<leader>rr', ht.repl.toggle, def_opts)
        -- Toggle a GHCi repl for the current buffer
        vim.keymap.set('n', '<leader>rf', function()
            ht.repl.toggle(vim.api.nvim_buf_get_name(0))
        end, opts)
        vim.keymap.set('n', '<leader>rq', ht.repl.quit, def_opts)
    end
})
