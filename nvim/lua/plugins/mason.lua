return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "html-lsp",
        "clangd",
      },
    },
  },
}
