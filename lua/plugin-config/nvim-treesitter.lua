local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("未找到：nvim-treesitter")
    return
end

treesitter.setup({
    -- 安装language parser
    -- :TSInstallInfo 命令查看支持的语言
    ensure_installed = {
        "json",
        "html",
        "css",
        "vim",
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "cpp",
        "python",
        "rust",
        "julia",
        "java",
        "commonlisp",
        "c_sharp",
        "toml",
        "gitignore",
        "bash",
        "sql",
        "latex",
        "markdown",
        "markdown_inline",
    },
    -- 启用代码高亮
    highlight = {
        enable = true,
        additional_vim_regex_highlight = false,
    },
    -- 启用增量选择模块
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
        },
    },
    -- 启用代码缩进模块（=）
    indent = {
        enable = true,
    },
})

-- 开启Folding模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99

-- 第三方模块：https://github.com/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins

