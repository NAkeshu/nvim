-- 设置空格键为leader键
vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- 复用opt参数
local map = vim.api.nvim_set_keymap
-- 以下可以使用 map{'mode', 'key', 'func', 'options')
-- 的格式进行按键映射
local opt = {noremap = true, silent = true}

map("n", "Q", ":q<CR>", opt)
map("n", "W", ":w<CR>", opt)
map("n", "R", "<C-r>", opt)

map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)

map("n", "<LEADER><CR>", ":nohlsearch<CR>", opt)

-- placeholder 相关
map("i", "<C-m>", "<+hold+>", opt)
map("i", "<C-f>", "<Esc>/<+hold+><CR><Esc>cf>", opt)


-- vim terminal 相关
-- <leader>= 在右侧窗口启动terminal
-- <leader>+ (S-=) 在下边窗口启动terminal
map("n", "<leader>=", ":sp | terminal<CR>", opt)
map("n", "<leader>+", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
-- terminal和编辑区快速切换
-- map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
-- map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
-- map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
-- map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual mode 前后缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- visual mode 上下移动选中代码
map("v", "<C-j>", ":move '>+1<CR>gv-gv", opt)
map("v", "<C-k>", ":move '<-2<CR>gv-gv", opt)

-- emacs 快捷键: <C-a> <C-e> <C-n> <C-p>
map("i", "<C-a>", "<ESC>I", opt)
map("i", "<C-e>", "<ESC>A", opt)
map("i", "<C-n>", "<ESC>ji", opt)
map("i", "<C-p>", "<ESC>ki", opt)


-- 
-- 插件快捷键
--
local pluginKeys = {}

-- nvim-tree
-- <leader>t 打开关闭
map("n", "<LEADER>t", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
    -- 分屏打开文件
    { key = "v", action = "vsplit" },
    { key = "i", action = "split" },
    -- 显示隐藏文件
    { key = "h", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
    { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
    -- 文件操作
    { key = "r", action = "refresh" },
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "R", action = "rename" },
    { key = "x", action = "cut" },
    { key = "y", action = "copy" },
    { key = "p", action = "paste" },
    { key = "s", action = "system_open" },
}
return pluginKeys
