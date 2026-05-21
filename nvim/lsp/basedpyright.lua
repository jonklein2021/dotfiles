return {
    cmd = { 'basedpyright-langserver', '--stdio' },
    root_markers = { 'pyproject.toml', 'requirements.txt', '.git' },
    filetypes = { 'python' },
    settings = {
        basedpyright = {
            analysis = {
                diagnosticMode = 'openFilesOnly',
                typeCheckingMode = 'basic',
            },
        },
    },
}
