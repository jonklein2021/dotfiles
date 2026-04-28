return {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false,
    opts = {
        provider = 'copilot',
        behaviour = {
            allow_access_to_git_ignored_files = true,
            auto_apply_diff_after_generation = true,
            auto_approve_tool_permissions = false,
        },
        selection = {
            enabled = true,
            hint_display = "none",
        },
        mappings = {
            submit = {
                normal = "<CR>",
                insert = "<A-CR>",
            },
        }
    },
    copilot = {
        endpoint = 'https://api.githubcopilot.com',
        model = 'claude-haiku-4.5',
        timeout = 30000,        -- Timeout in milliseconds
        context_window = 64000, -- Number of tokens to send to the model for context
    },
    dependencies = {
        'zbirenbaum/copilot.lua',
        'nvim-tree/nvim-web-devicons',
        'stevearc/dressing.nvim',
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
    },
}
