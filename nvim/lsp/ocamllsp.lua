return {
    cmd = { 'ocamllsp', '--stdio' },
    filetypes = {
        'ocaml',
        'dune',
    },
    root_markers = {
        { 'dune-project', 'dune-workspace' },
        { '*.opam', 'esy.json', 'package.json' },
        '.git',
    },
    settings = {},
}
