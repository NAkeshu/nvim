local packer = require("packer")
packer.startup(
    function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'

    -- 其他插件列表

    -- colorschemes
    ---- tokyonight
    use "folke/tokyonight.nvim"
    ---- gruvbox
    use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
    ---- nord
    use("shaunsingh/nord.nvim")
    ---- onedark
    use("ful1e5/onedark.nvim")

    -- nvim-tree
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

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

