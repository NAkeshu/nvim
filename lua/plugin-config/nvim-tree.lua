-- https://github.com/kyazdani42/nvim-tree.lua
-- local nvim_tree = require'nvim-tree'
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("未找到：nvim-tree")
    return
end

local list_keys = require('keybindings').nvimTreeList

nvim_tree.setup({
    -- 禁止内置netrw
    disable_netrw = true,
    -- 不显示git状态图标
    -- git = {
        -- enable = false,
    -- },
    -- project plubgin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = true,
        custom = {
            'node_modules',
        },
    },
    view = {
        width = 34,
        side = 'left',
        hide_root_folder = false,
        mappings = {
            custom_only = true, -- 只用内置快捷键
            list = list_keys,
        },
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开适配大小
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = true,
        },
    },
    -- -- wsl install -g wsl-open
    -- -- https://github.com/4U6U57/wsl-open/
    -- system_open = {
        -- mac
        -- cmd = 'open',
        -- windows
        -- cmd = 'wsl-open',
    -- },
})
