local m = require("mason")
local nvim_lsp = require("lspconfig")
local m_lspconfig = require("mason-lspconfig")

m.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local servers = {
    sumneko_lua = nvim_lsp['sumneko_lua'].setup(require("lsp.config.lua")),
    pyright = nvim_lsp['pyright'].setup(require("lsp.config.python")),
    rust_analyzer = nvim_lsp['rust_analyzer'].setup(require("lsp.config.rust")),
    julials = nvim_lsp['julials'].setup(require("lsp.config.julia")),
}

local server_list = {
   "sumneko_lua",
   "pyright",
   "rust_analyzer",
   "julials",
}

m_lspconfig.setup({
    ensure_installed = server_list,
})

m_lspconfig.setup_handlers(servers)

