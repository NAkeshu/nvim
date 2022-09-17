local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("未找到：bufferline")
    return
end

-- bufferline配置
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
    options = {
        -- 使用moll/vim-bbye的:Bdelete命令来关闭tab
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        -- 侧边栏配置
        -- 左侧让出nvim-tree的位置，显示文字File explorer
        offsets = {
            {
                filetype = "NvimTree",
                test = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },
        -- 使用nvim内置LSP
        diagnostics = "nvim_lsp",
        -- 显示nvim内置报错图标
        -- @diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end,
    },
})
