local opts = {
    settings = {
        -- 这里需要自定义
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    },

    flags = {
        debounce_text_changes = 150,
    },
    on_attach = function(client, bufnr)
        -- on_attach 是一个回调函数，
        -- 当语言服务成功绑定到一个 buffer 上时会调用这个函数，
        -- 所以通常我们会在这个函数里做一些比如快捷键绑定、自动命令，
        -- 或者设置 buffer 的某些特性等操作。

        -- 禁用格式化功能，交给专门插件插件处理
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- 绑定快捷键
        require('keybindings').mapLSP(buf_set_keymap)
        -- 保存时自动格式化
        -- vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end,
}

-- 查看目录等信息
return opts

