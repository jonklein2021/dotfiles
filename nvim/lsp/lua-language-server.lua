return {
    cmd = { "lua-language-server" },
    root_markers = { ".luarc.json", "lazy-lock.json", ".git" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
            },
            diagnostics = {
                globals = { "before_each", "describe", "it", "require", "vim" },
            },
            hint = {
                enable = true,
            },
        },
    },
}
