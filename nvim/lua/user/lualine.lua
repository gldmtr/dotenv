require('lualine').setup({
	sections = {
		lualine_c = { 'filename' },
	},
	options = {
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
	},
})

require('fidget').setup({})
