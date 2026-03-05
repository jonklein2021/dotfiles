-- Set `mapleader` and `maplocalleader` before lazy.nvim is set up
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim
require("lazy").setup({
	performance = {
		rtp = {
			-- Bloatware
			disabled_plugins = {
				"gzip",
				"matchit",
				"netrwPlugin",
				"spellfile",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- automatically check for updates
	checker = { enabled = true },
})

-- Set up autocommands, options, and keybinds
require("config.autocommands")
require("config.options")
require("config.keymaps")

-- Enable language servers
vim.lsp.enable({
	'bash-language-server',
	'clangd',
	'lua-language-server',
	'omnisharp',
	'pyright',
	'vscode-json-language-server',
	'vtsls'
})
