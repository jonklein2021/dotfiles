return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = { provider = "copilot" },
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
    providers = {
        copilot = {
            endpoint = "https://api.githubcopilot.com",
            model = "claude-haiku-4.5",
            timeout = 30000,        -- Timeout in milliseconds
            context_window = 64000, -- Number of tokens to send to the model for context
        }
    },
    behaviour = {
        auto_apply_diff_after_generation = true,
        allow_access_to_git_ignored_files = true,
    }
}
