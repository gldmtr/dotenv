local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local actions = require "telescope.actions"

telescope.setup({
	pickers = {
		colorscheme = {
			enable_preview = true
		},
	},
	defaults = {
		mappings = {
			i = {
				['<C-n>'] = actions.cycle_history_next,
				['<C-p>'] = actions.cycle_history_prev,

				['<C-j>'] = actions.move_selection_next,
				['<C-k>'] = actions.move_selection_previous,
			},
		},
		file_ignore_patterns = {
			'node_modules',
			'dist',
		}
	},
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
