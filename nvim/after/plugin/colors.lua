-- require("catppuccin").setup({

--   background = {     -- :h background
--     light = "latte",
--     dark = "mocha",
--   },
--   transparent_background = false, -- disables setting the background color.
--   show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
--   term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
--   dim_inactive = {
--     enabled = false,              -- dims the background color of inactive window
--     shade = "dark",
--     percentage = 0.15,            -- percentage of the shade to apply to the inactive window
--   },
--   no_italic = false,              -- Force no italic
--   no_bold = false,                -- Force no bold
--   no_underline = false,           -- Force no underline
--   styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
--     comments = { "italic" },      -- Change the style of comments
--     conditionals = { "italic" },
--     loops = {},
--     functions = {},
--     keywords = {},
--     strings = {},
--     variables = {},
--     numbers = {},
--     booleans = {},
--     properties = {},
--     types = {},
--     operators = {},
--   },
--   color_overrides = {},
--   custom_highlights = {},
--   integrations = {
--     cmp = true,
--     gitsigns = true,
--     nvimtree = true,
--     treesitter = true,
--     notify = false,
--     mini = {
--       enabled = true,
--       indentscope_color = "",
--     },
--     -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--   },
-- })

-- setup must be called before loading
-- vim.opt.termguicolors = true
-- vim.o.background = 'dark'
--
-- -- default config
-- require('solarized').setup({
--   transparent = false,     -- enable transparent background
--   palette = 'solarized',   -- or selenized
--   styles = {
--     comments = { italic = true },
--     functions = {},
--     variables = {},
--     numbers = {},
--     constants = {},
--     parameters = {},
--     keywords = {},
--     types = { italic = true },
--   },
--   enables = {
--     bufferline = true,
--     cmp = true,
--     diagnostic = true,
--     dashboard = true,
--     editor = true,
--     gitsign = true,
--     hop = true,
--     indentblankline = true,
--     lsp = true,
--     lspsaga = true,
--     navic = true,
--     neogit = true,
--     neotree = true,
--     notify = true,
--     noice = true,
--     semantic = true,
--     syntax = true,
--     telescope = true,
--     tree = true,
--     treesitter = true,
--     todo = true,
--     whichkey = true,
--     mini = true,
--   },
--   highlights = {},
--   colors = {},
--   theme = 'default',   -- or 'neo'
--   autocmd = true,
-- })
--
-- vim.cmd.colorscheme "solarized"

-- just highlight current line number
-- vim.cmd.highlight('CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE')
-- vim.cmd.set('cursorline')

vim.o.background = 'dark' -- or 'light'
vim.g.solarized_italics = 1
vim.g.solarized_extra_hi_groups = 1
vim.g.solarized_visibility = "flat"
vim.g.solarized_statusline = "flat"

vim.cmd.colorscheme 'solarized8_flat'

vim.opt.termguicolors = true
