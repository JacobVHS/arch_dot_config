vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "/home/jacob/git/ansible/*",
  callback = function()
    vim.bo.filetype = "yaml.ansible"
  end,
})
