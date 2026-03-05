return {
	"romgrk/barbar.nvim",
	config = function()
		require("lazy").setup({
			{
				dependencies = {
					"lewis6991/gitsigns.nvim",
					"nvim-tree/nvim-web-devicons",
				},
				init = function()
					vim.g.barbar_auto_setup = false
				end,
				opts = {
					sidebar_filetypes = {
						NvimTree = true,
						["neo-tree"] = { event = "BufWipeout" },
					},
				},
				version = "^1.0.0",
			},
		})
	end,
}
