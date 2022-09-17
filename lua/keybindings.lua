--C-S-F 设置空格键为leader键
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

-- bufferline
-- 左右tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
-- "moll/vim-bbye"
map("n", "<C-c>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<leader>p", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<leader>f", ":Telescope live_grep<CR>", opt)
-- Telescope 列表中插入模式快捷键
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- 历史记录
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        -- 关闭窗口
        ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    }
}

-- LSP 回调函数快捷键
pluginKeys.mapLSP = function(mapbuf)
    -- rename
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    -- code action
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    -- go xx
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implemennation()<CR>", opt)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    -- diagnostic
    mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    mapbuf("n", "<M-C-f>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
    -- 没用到
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

return pluginKeys
