local status, telescope = pcall(require, "telescope")
if not status then
    vim.notify("未找到：telescope")
    return
end

telescope.setup({
    defaults = {
        -- 打开弹窗后眷属的初始模式，默认认为insert，也可以是normal
        initial_mode = "insert",
        -- 窗口内快捷键
        mappings = require("keybindings").telescopeList,
    },
    pickers = {
        -- 窗口内快捷键
        find_files = {
            -- 查找文件换皮肤，支持的参数有：dropbown,cursor,ivy
            -- theme = "dropdown",
        },
    },
    extensions = {
        -- 扩展插件配置
    },
})

-- telescope extensions
pcall(telescope.load_extension, "env")

