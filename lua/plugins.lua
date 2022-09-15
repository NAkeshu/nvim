local packer = require("packer")
packer.startup(
    function(use)
        -- Packer 可以管理自己本身
use 'wbthomason/packer.nvim'

-- 其他插件列表
    end
)

-- 修改 lua/plugins.lua 文件自动加载并调用 :PackerSync
pcall(
    vim.cmd,
    [[
        augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
        augroup end
    ]]
)

