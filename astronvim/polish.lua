local polish = function () 
  local opts = { noremap = true, silent = true }
  local map = vim.api.nvim_set_keymap
  
  map('n', '<C-e>', ':Neotree focus<CR>', opts)
end

return polish
