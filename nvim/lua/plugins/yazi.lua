return {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
        {
            "<C-n>",
            mode = { "n", "v" },
            "<Cmd>Yazi<cr>",
            desc = "Open yazi at the current file",
        },
    },
    opts = {
        -- open directories in yazi instead of netrw
        open_for_directories = true,
        keymaps = {
            show_help = "<F1>",
        },
    },
    init = function()
        -- mark netrw as loaded so it's not loaded at all.
        --
        -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
        vim.g.loaded_netrwPlugin = 1
    end,
}
