-- remap Esc to jk or kj, also disable search highlight upon entering normal mode
vim.keymap.set("i", "jk", "<Esc>l<Cmd>nohlsearch<CR>", {})
vim.keymap.set("i", "kj", "<Esc>l<Cmd>nohlsearch<CR>", {})
vim.keymap.set("v", "jk", "<Esc><Cmd>nohlsearch<CR>", {})
vim.keymap.set("v", "kj", "<Esc><Cmd>nohlsearch<CR>", {})
vim.keymap.set("n", "jk", "<Cmd>nohlsearch<CR>", {})
vim.keymap.set("n", "kj", "<Cmd>nohlsearch<CR>", {})
vim.cmd([[cnoremap jk <Esc>]])
vim.cmd([[cnoremap kj <Esc>]])

vim.keymap.set("n", "U", "<C-r>", { desc = "U means redo" })
vim.keymap.set({ "n", "v" }, "H", "^", { desc = "H goes to start of line" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "L goes to end of line" })
vim.keymap.set("v", "J", "j", { desc = "nice for visual line mode when I'm still holding Shift" })
vim.keymap.set("v", "K", "k", { desc = "same as above" })
vim.keymap.set("v", "<", "<gv", { desc = "remain in visual mode after using <" })
vim.keymap.set("v", ">", ">gv", { desc = "same as above but for >" })
vim.keymap.set({ "n", "v" }, "<C-j>", "10j", { desc = "Down 10 times" })
vim.keymap.set({ "n", "v" }, "<C-k>", "10k", { desc = "Up 10 times" })
vim.keymap.set("n", "<C-z>", "<nop>", { desc = "Prevent Ctrl+z from suspending Neovim" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move one character forward in insert mode without arrows" })
vim.keymap.set({ "n", "v" }, "<C-r>", "<C-l>", { desc = 'Ctrl+r "refreshes"' })
vim.keymap.set({ "i", "n", "v" }, "<C-b>", "<nop>", { desc = "If I can't have Ctrl+f I can't have Ctrl+b" })
vim.keymap.set({ "i", "n", "v" }, "<C-a>", "<Esc>gg^vG$", { desc = "Ctrl+a selects all" })

-- Enclose selection with characters
local function surround(left, right)
	right = right or left
	return string.format('c%s<C-r>"%s<Esc>', left, right)
end

vim.keymap.set("v", 's"', surround('"'))
vim.keymap.set("v", "s'", surround("'"))
vim.keymap.set("v", "s`", surround("`"))
vim.keymap.set("v", "s(", surround("(", ")"))
vim.keymap.set("v", "s{", surround("{", "}"))
vim.keymap.set("v", "s[", surround("[", "]"))
vim.keymap.set("v", "s<", surround("<", ">"))

-- keymaps for moving lines up and down
vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==", {})
vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==", {})
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", {})
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", {})
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", {})

-- Barbar tab keybinds
vim.keymap.set("n", "<A-N>", "<Cmd>BufferPrevious<CR>", {})
vim.keymap.set("n", "<A-n>", "<Cmd>BufferNext<CR>", {})
vim.keymap.set("n", "<A-d>", "<Cmd>BufferClose<CR>", {})
vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", {})
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", {})
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", {})
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", {})
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", {})
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", {})
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", {})
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", {})
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", {})
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", {})

-- Bells & Whistles
vim.keymap.set({ "n", "v" }, "<C-p>", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Jump to previous diagnostic in this file" })
vim.keymap.set({ "n", "v" }, "<C-l>", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Jump to next diagnostic in this file" })
vim.keymap.set({ "n", "v" }, "gs", "<Cmd>Neotree float git_status<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<C-f>", "<Cmd>Telescope find_files<CR>", { desc = "Searches for files" })
vim.keymap.set({ "i", "n", "v" }, "<C-_>", require("telescope.builtin").live_grep, { desc = "Live Grep" })
vim.keymap.set({ "n", "v" }, "<Leader>p", require("peek").open, { desc = "Markdown preview" })

-- AI Slop Keybinds
vim.keymap.set({ "n", "v" }, "<Leader><Space>", "<Cmd>AvanteToggle<CR>", { desc = "Open Avante chat window" })
vim.keymap.set({ "n", "v" }, "<Leader>d", "<Cmd>AvanteClear<CR>", { desc = "Clear chat history" })
vim.keymap.set({ "i", "n", "v" }, "<C-c>", "<Cmd>AvanteStop<CR>", { desc = "Stop current request" })
