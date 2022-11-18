local polish = function ()
  local opts = { noremap = true, silent = true }
  local map = vim.api.nvim_set_keymap

  map('n', '<C-e>', ':Neotree focus<CR>', opts)
  map('n', '<C-\\>', '<cmd>ToggleTerm direction=float<cr>', opts)
  map('t', '<C-\\>', '<cmd>ToggleTerm direction=float<cr>', opts)

  map('n', '<leader>fg', '<cmd>lua require(\'telescope\').extensions.live_grep_args.live_grep_args()<CR>', opts)

  vim.api.nvim_create_autocmd({'BufWritePre'}, {
    pattern = '*',
    command = [[:%s/\s\+$//e]],
  })
end

return polish
