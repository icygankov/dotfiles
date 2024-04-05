vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_syntax_enabled = 1

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = {"de_de", "en_us"}
  end,
})

