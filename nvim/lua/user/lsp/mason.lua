local servers = {
	'tsserver',
	'yamlls'
}
local null_servers = { 'eslint_d' }

local lspconfig = require 'lspconfig'

require('mason').setup({
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
})

require('mason-lspconfig').setup({
	ensure_installed = servers,
	automatic_installation = true,
})

require('mason-null-ls').setup({
	ensure_installed = null_servers,
	automatic_installation = true,
})

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require('user.lsp.handlers').on_attach,
		capabilities = require('user.lsp.handlers').capabilities,
	}

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
