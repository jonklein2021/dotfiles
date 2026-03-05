return {
    cmd = { "vtsls", "--stdio" },
    root_markers = { "tsconfig.json", "eslint.config.js", "package.json", { ".git", ".gitignore" } },
    filetypes = {
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
    }
}
