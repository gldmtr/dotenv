local null_ls = require 'null-ls'

local util = require 'null-ls.utils'

null_ls.setup({
	debug = true,
	sources = {
		-- null_ls.builtins.formatting.eslint_d.with({
		--   cwd = function (params)
		--     local find_config = util.root_pattern('.eslintrc.yml', '.eslintrc.js', '.eslintrc.json')
		--     local file_path = vim.fn.expand('%:p:h');
    --
		--     return find_config(file_path)
		--   end,
		-- }),
		-- null_ls.builtins.diagnostics.eslint_d.with({
		--   cwd = function (params)
		--     local find_config = util.root_pattern('.eslintrc.yml', '.eslintrc.js', '.eslintrc.json')
		--     local file_path = vim.fn.expand('%:p:h');
    --
		--     return find_config(file_path)
		--   end,
		-- }),
	},
})
