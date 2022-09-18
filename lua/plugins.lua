local packer = require("packer")
packer.startup(function(use)
    -- Packer 可以管理自己本身
    use("wbthomason/packer.nvim")

    -- 其他插件列表

    -- colorschemes
    ---- tokyonight
    use("folke/tokyonight.nvim")
    ---- gruvbox
    use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
    ---- nord
    use("shaunsingh/nord.nvim")
    ---- onedark
    use("ful1e5/onedark.nvim")

    -- nvim-tree
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- bufferline
    use({ "akinsho/bufferline.nvim", requires = { "hyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
    ---- telescope extensions
    use("LinArcX/telescope-env.nvim")
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    ---- project
    use("ahmedkhalf/project.nvim")
    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- auto-pairs
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })

    -- LSP
    -- use { "williamboman/nvim-lsp-installer" }
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    ---- Lspconfig
    use({ "neovim/nvim-lspconfig" })

    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    ---- snippet 引擎
    use("hrsh7th/vim-vsnip")
    ---- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    ---- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")

    -- ui
    use("onsails/lspkind-nvim")
    -- lspsaga
    use("tami5/lspsaga.nvim")

    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
    
    -- Rust增强
    use("simrat39/rust-tools.nvim")

    -- 代码格式化
    -- use("mhartington/formatter.nvim")
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
end)

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
