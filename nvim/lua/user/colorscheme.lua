-- let g:oceanic_next_terminal_bold = 1
-- let g:oceanic_next_terminal_italic = 1
-- colorscheme OceanicNext

-- require('tokyonight').setup({
--   style = 'storm',
--   transparent = false,
--   terminal_colors = true,
-- })
-- vim.cmd 'colorscheme tokyonight'

-- vim.o.background = 'dark'
--
local colors = require('vscode.colors')

require('vscode').setup({
	-- Enable transparent background
	transparent = true,

	-- Enable italic comment
	italic_comments = true,

	-- Disable nvim-tree background color
	disable_nvimtree_bg = true,

	-- Override colors (see ./lua/vscode/colors.lua)
	color_overrides = {
		vscLineNumber = '#FFFFFF',
	},

	-- Override highlight groups (see ./lua/vscode/theme.lua)
	group_overrides = {
		-- this supports the same val table as vim.api.nvim_set_hl
		-- use colors from this colorscheme by requiring vscode.colors!
		Cursor = {
			fg = colors.vscDarkBlue,
			bg = colors.vscLightGreen,
			bold = true,
		},
	}
})
--
-- require('lualine').get_config().options.theme = 'vscode'
