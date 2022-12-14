vim.g.splitjoin_quiet = 1

local plugins = {
  ['kylechui/nvim-surround'] = {
    config = function ()
      require('nvim-surround').setup({})
    end
  },
  'AndrewRadev/splitjoin.vim',
  ['nvim-telescope/telescope-live-grep-args.nvim'] = {
    config = function()
      require('telescope').load_extension('live_grep_args')
    end
  },
  'romainl/vim-cool',
}

return plugins
