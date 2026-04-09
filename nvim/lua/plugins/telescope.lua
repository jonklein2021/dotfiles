return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },
    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {
                    'node_modules',
                },
                mappings = {
                    n = {
                        ['q'] = require('telescope.actions').close,
                    },
                },
            },
            mappings = {
                n = {
                    ['q'] = require('telescope.actions').delete_buffer,
                },
            },
        })
    end,
}
