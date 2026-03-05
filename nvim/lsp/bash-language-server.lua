return {
    cmd = { 'bash-language-server', 'start' },
    root_markers = { ".git" },
    filetypes = { "bash", "sh", "zsh" },
    single_file_support = true,

    -- https://github.com/bash-lsp/bash-language-server/blob/main/server/src/config.ts
    settings = {
        bashIde = {
            -- shfmt = { spaceRedirects = true },
            includeAllWorkspaceSymbols = true,
            shellcheckArguments = "--shell=bash",
        },
    },
}

