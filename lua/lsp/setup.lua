local mason = require("mason").setup({})
local mason_lspconfig = require("mason-lspconfig").setup({
	ensure_installed = {
		"sumneko_lua",
		"tsserver",
		"pyright",
		"rust_analyzer",
	},
})

require("mason-lspconfig").setup_handlers({
	["sumneko_lua"] = require("lspconfig").sumneko_lua.setup(require("lsp.config.lua")),
	["pyright"] = require("lspconfig").pyright.setup(require("lsp.config.python")),
	["rust_analyzer"] = require("lspconfig").rust_analyzer.setup(require("lsp.config.rust")),
	-- function (sumneko_lua)
	--     require('lsp.config.lua')
	-- end
})
