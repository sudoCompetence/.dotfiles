--- ============================================================================
--- @file sidebar.lua
--- @brief sidebar nvim config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')
-- vim.g.maplocalleader = ','
-- vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_viewer = '/mnt/c/Users/admin/AppData/Local/Programs/Okular/bin/okular.exe'
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_log_ignore = {
    'Underfull',
    'Overfull',
    'specifier changed to',
    'Token not allowed in a PDF string'
}
vim.g.vimtex_compiler_latexmk = {
    aux_dir = '.aux/',
    out_dir = '.out/',
    callback = 1,
    continuous = 1,
    executable = 'latexmk',
    hooks = {},
    options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
    },
}
