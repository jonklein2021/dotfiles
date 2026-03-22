return {
    cmd = { 'vscode-css-language-server', '--stdio' },
    root_markers = { { 'package.json', 'package-lock.json' }, '.git' },
    filetypes = { 'css', 'scss' },
    single_file_support = true
}
