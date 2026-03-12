return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = { provider = "copilot" },
    dependencies = {
        "yetone/avante.nvim",
        dependencies = {
            "zbirenbaum/copilot.lua",
            "nvim-tree/nvim-web-devicons",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            {
                "MeanderingProgrammer/render-markdown.nvim",
                opts = { file_types = { "markdown", "Avante" } },
                ft = { "markdown", "Avante" },
            },
        },
        build = "make",
        opts = { provider = "copilot" },
    },
}
