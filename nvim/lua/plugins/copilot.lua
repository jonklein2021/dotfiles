return {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    config = function()
        require("copilot").setup({
            suggestion = {
                enabled = true,
                auto_trigger = false,
            },
            panel = {
                enabled = true,
            },
            server = {
                type = "binary",
            },
        })
    end
}
