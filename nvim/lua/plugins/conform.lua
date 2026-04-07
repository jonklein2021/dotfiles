return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require('conform').setup({
            formatters_by_ft = {
                -- languages with specialty formatters
                bash = { 'shfmt' },
                c = { 'clang-format' },
                cpp = { 'clang-format' },
                c_sharp = { 'csharpier' },
                html = { 'html_beautify' },
                css = { 'css_beautify' },
                lua = { 'stylua' },
                python = { 'black' },
                sql = { 'sqlfmt' },

                -- use prettier for JS/TS
                javascript = { 'prettierd', 'prettier', stop_after_first = true },
                javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
                typescript = { 'prettierd', 'prettier', stop_after_first = true },
                typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },

                -- prefer LSP formatting for these config filetypes
                json = { 'jq', lsp_format = 'prefer' },
                toml = { 'tombi', lsp_format = 'prefer' },
                yaml = { 'yq', lsp_format = 'prefer' },
            },

            format_on_save = function(bufnr)
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return {
                    timeout_ms = 500,
                    lsp_format = 'fallback',
                }
            end,
        })
    end,
}
