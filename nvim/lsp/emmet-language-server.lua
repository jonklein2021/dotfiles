return {
    cmd = { 'emmet-language-server', '--stdio' },
    root_markers = { { 'package.json', 'package-lock.json' }, '.git' },
    filetypes = {
        'html',
        'typescript',
        'typescriptreact',
        'javascript',
        'javascriptreact',
        'eruby',
        'less',
        'sass',
        'scss',
        'css',
        'pug',
    },
    single_file_support = true,
}
