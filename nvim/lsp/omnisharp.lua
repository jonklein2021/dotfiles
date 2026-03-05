return {
    cmd = { "OmniSharp", "--languageserver" },
    root_markers = { "package.json", { ".git", ".gitignore" } },
    filetypes = { "cs" },
    single_file_support = true,
    settings = {
        dotnet = {
            formatting = {
                organizeImportsOnFormat = true,
            }
        }
    }
}
