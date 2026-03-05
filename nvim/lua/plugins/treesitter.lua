return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "c",
                "cpp",
                "c_sharp",
                "java",
                "python",
                "go",
                "rust",
                "lua",
                "javascript",
                "html",
                "css",
                "bash",
                "cmake",
                "make",
                "sql",
            },
            hightlight = { enable = true },
            indent = { enable = true },
        })
    end
}

