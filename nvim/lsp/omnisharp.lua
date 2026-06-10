return {
    cmd = { 'OmniSharp', '--languageserver' },
    root_markers = { '*.csproj', { '.git', '.gitignore' } },
    filetypes = { 'cs' },
    single_file_support = true,
    settings = {
        dotnet = {
            formatting = {
                organizeImportsOnFormat = true,
            },
        },
    },
}
