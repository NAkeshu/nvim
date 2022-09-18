local mason = require("mason").setup {}
local mason_lspconfig = require("mason-lspconfig").setup {
    ensure_installed = {
        "sumneko_lua",
        "tsserver",
    }
}

require("mason-lspconfig").setup_handlers {
    ["sumneko_lua"] = require("lspconfig").sumneko_lua.setup(require("lsp.config.lua"))
    -- function (sumneko_lua)
    --     require('lsp.config.lua')
    -- end
}

