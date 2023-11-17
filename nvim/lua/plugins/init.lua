return {
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "catppuccin/nvim",                  name = "catppuccin", priority = 1000 },
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim',                opts = {} },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'rafamadriz/friendly-snippets' },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { 'simrat39/rust-tools.nvim' },
    'nvim-lualine/lualine.nvim',
    { 'stevearc/dressing.nvim', opts = {}, },
    { 'lervag/vimtex' },
    { 'tpope/vim-fugitive' },
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {}, lazy = false, },
     'christoomey/vim-tmux-navigator'
}
