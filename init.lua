-- 基础配置
require('basic')
-- Packer 插件管理
require('plugins')
-- 键位绑定
require('keybindings')
-- 主题设置
require('colorscheme')
-- 插件配置
require('plugin-config.nvim-tree')
require('plugin-config.bufferline')
require('plugin-config.lualine')
require('plugin-config.telescope')
require('plugin-config.dashboard')
require('plugin-config.project')
require('plugin-config.nvim-treesitter')
-- 内置LSP
require('lsp.setup')
require('lsp.cmp')

