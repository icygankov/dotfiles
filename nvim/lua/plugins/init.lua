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
    { "catppuccin/nvim",          name = "catppuccin", priority = 1000 },
    -- {
    --     'maxmx03/solarized.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.o.background = 'dark' -- or 'light'
    --
    --         vim.cmd.colorscheme 'solarized'
    --     end,
    -- },
    { 'lifepillar/vim-solarized8', lazy=false, branch = "neovim" },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim',       opts = {} },
            'folke/neodev.nvim',
        },
    },
    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
    },

    'folke/neodev.nvim',
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { 'nvim-lualine/lualine.nvim',           opts = {}, },
    { 'stevearc/dressing.nvim',              opts = {}, },
    { 'lervag/vimtex' },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-sleuth' },
    { 'numToStr/Comment.nvim',               opts = {},    lazy = false, },
    { 'folke/which-key.nvim',                opts = {} },
    { 'christoomey/vim-tmux-navigator' },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    'mbbill/undotree',
    'nvimtools/none-ls.nvim',
    'onsails/lspkind.nvim',
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'akinsho/toggleterm.nvim' }
}
