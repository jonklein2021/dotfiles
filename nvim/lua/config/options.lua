vim.opt.expandtab = false     -- transform tabs to spaces
vim.opt.ignorecase = true     -- ignore case in find commands
vim.opt.smartcase = true      -- ^ except when argument contains a capital letter
vim.opt.timeoutlen = 200      -- force mash of jk/kj to enter normal mode
vim.opt.wrap = false          -- I like my lines to stay in their lanes :)
vim.opt.number = true         -- show line numbers
vim.opt.relativenumber = true -- easier [n]k/j movements
vim.opt.termguicolors = true  -- necessary for color code previews

-- configure clipboard provider
vim.opt.clipboard = 'unnamedplus'
if vim.fn.has('wsl') == 1 then
    vim.api.nvim_create_autocmd('TextYankPost', {
        group = vim.api.nvim_create_augroup('Yank', { clear = true }),
        callback = function()
            local reg = vim.v.event.regname
            if reg == '' then
                reg = '"'
            end
            local text = vim.fn.getreg(reg)
            vim.fn.system('clip.exe', text)
        end,
    })
end

-- diagnostics
vim.diagnostic.config({
    underline = false,
    virtual_text = false,
    update_in_insert = false,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '',
            [vim.diagnostic.severity.INFO] = '',
        },
    },
})
