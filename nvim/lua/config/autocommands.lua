-- Highlight yanked text
local highlightYank = vim.api.nvim_create_augroup("highlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 300 })
    end,
    group = highlightYank,
})

-- Set up 4-space default for all filetypes
local spacing = vim.api.nvim_create_augroup("CustomTabWidth", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = spacing,
    pattern = "*",
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end,
})

-- Set up 2-space exceptions for certain filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = spacing,
    pattern = { "html", "css", "yaml", "json", "javascript", "javascriptreact", "typescript" },
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

-- Format code on save
local formatCode = vim.api.nvim_create_augroup("formatCode", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format()
    end,
    group = formatCode,
})

-- Opens non-text files in the default program instead of in Neovim
local openFile = vim.api.nvim_create_augroup("openFile", {})
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = {
        "*.epub",
        "*.jpeg",
        "*.jpg",
        "*.pdf",
        "*.png",
    },
    callback = function()
        vim.fn.jobstart('xdg-open "' .. vim.fn.expand("%") .. '"', {
            detach = true,
        })
        vim.api.nvim_buf_delete(0, {})
    end,
    group = openFile,
})

-- LSP-related autocommands below

local rename_variable = function()
    local new_name = vim.fn.input({ prompt = "New name: " })
    if #new_name == 0 then
        return
    end
    vim.lsp.buf.rename(new_name)
end

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
        -- Keymaps
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true, buffer = true })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, buffer = true })
        vim.keymap.set(
            "n",
            "gi",
            vim.lsp.buf.implementation,
            { noremap = true, silent = true, buffer = true }
        )
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true, buffer = true })
        vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, { noremap = true, buffer = true })
        vim.keymap.set("n", "<Leader>r", rename_variable, { noremap = true, buffer = true })
        vim.keymap.set("n", "<Leader>c", vim.lsp.buf.code_action, { noremap = true, buffer = true })

        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        -- Hover
        if client:supports_method("textDocument/hover") then
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, buffer = true })
        end

        -- Inlay Hints
        if client:supports_method("textDocument/inlayHints") then
            vim.keymap.set("n", "<Leader>i", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
            end, { buffer = true })
        end

        -- Refreshes code lenses
        if client:supports_method("textDocument/codeLens") then
            vim.lsp.codelens.refresh()
            local refreshCodelens = vim.api.nvim_create_augroup("refreshCodelens", {})
            vim.api.nvim_create_autocmd({
                "LspAttach",
                "InsertLeave",
                "TextChanged",
            }, {
                buffer = 0,
                callback = vim.lsp.codelens.refresh,
                group = refreshCodelens,
            })
        end
    end,
})
