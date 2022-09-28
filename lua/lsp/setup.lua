local mason = require("mason")
local nvim_lsp = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

mason_lspconfig.setup({
    ensure_installed = {
        "sumneko_lua",
        "tsserver",
        "pyright",
        "rust_analyzer",
        "julials",
    },
})

mason_lspconfig.setup_handlers({
    ["sumneko_lua"] = nvim_lsp['sumneko_lua'].setup(require("lsp.config.lua")),
    ["pyright"] = nvim_lsp['pyright'].setup(require("lsp.config.python")),
    ["rust_analyzer"] = nvim_lsp['rust_analyzer'].setup(require("lsp.config.rust")),
    ['julials'] = nvim_lsp['julials'].setup(require("lsp.config.julia")),
    -- function (sumneko_lua)
    --     nvim_lsp['sumneko_lua'].setup(require('lsp.config.lua'))
    -- end
})
