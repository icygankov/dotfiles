return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },
    { "catppuccin/nvim",           name = "catppuccin", priority = 1000 },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'j-hui/fidget.nvim',         opts = {} },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    { 'saadparwaiz1/cmp_luasnip' },
    'folke/neodev.nvim',
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { 'simrat39/rust-tools.nvim' },
    { 'nvim-lualine/lualine.nvim',        opts = {}, },
    { 'stevearc/dressing.nvim',           opts = {}, },
    { 'lervag/vimtex' },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-sleuth' },
    { 'numToStr/Comment.nvim',            opts = {}, lazy = false, },
    'christoomey/vim-tmux-navigator',
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    { 'mhartington/formatter.nvim',          opts = {} },
    {
        'mrcjkb/haskell-tools.nvim',
        version = '^3', -- Recommended
        ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    },
}
