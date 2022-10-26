require('lualine').setup({
	sections = {
		lualine_c = { 'filename', 'coc#status', 'b:coc_current_function' },
	},
	options = {
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
	},
})
