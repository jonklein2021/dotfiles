return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_by_name = {
                        ".github",
                        ".gitignore",
                        "package-lock.json",
                    },
                    never_show = { ".git", ".vscode" },
                },
            },
            diagnostics = {
                enable = false,
                show_on_dirs = false,
            },
            window = {
                mappings = {
                    ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = false } },
                    ["l"] = "focus_preview",
                    ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
                    ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
                }
            }
        })
        vim.keymap.set("n", "<C-n>", "<cmd>Neotree filesystem reveal left<CR>", {})
        vim.keymap.set({ 'v', 'i', 'n' }, '<C-f>', '<cmd>Telescope find_files<CR>', {})
    end
}
