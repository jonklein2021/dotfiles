return {
    {
        'nvim-mini/mini.snippets',
        dependencies = 'rafamadriz/friendly-snippets',
        event = 'InsertEnter',
        version = false,
        config = function()
            local gen_loader = require('mini.snippets').gen_loader
            require('mini.snippets').setup({
                snippets = {
                    -- Load custom file with global snippets first
                    gen_loader.from_file('~/.local/share/nvim/lazy/friendly-snippets/snippets/global.json'),

                    -- Load snippets based on current language by reading files from
                    -- 'snippets/' subdirectories from 'runtimepath' directories.
                    gen_loader.from_lang(),
                },
            })
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        main = 'cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'brenoprata10/nvim-highlight-colors',
            'abeldekat/cmp-mini-snippets',
        },
        event = 'InsertEnter',
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                        insert({ body = args.body })
                        cmp.resubscribe({ 'TextChangedI', 'TextChangedP' })
                        require('cmp.config').set_onetime({ sources = {} })
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<Down>'] = cmp.mapping.select_next_item(),
                    ['<Up>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'mini_snippets' },
                }),
                formatting = {
                    format = require('nvim-highlight-colors').format,
                },
            })
        end,
    },
}
