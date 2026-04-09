return {
    -- Adds visual icons for completion menus
    {
        [1] = 'onsails/lspkind.nvim',
        event = 'LspAttach',
    },
    -- Shows status of language servers
    {
        [1] = 'j-hui/fidget.nvim',
        event = 'LspAttach',
        version = '^1.2.0',
        opts = {
            progress = {
                ignore = {
                    'null-ls',
                    'markdown_oxide',
                },
            },
        },
    },
}
