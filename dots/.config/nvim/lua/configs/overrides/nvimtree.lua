--- ============================================================================
--- @file nvimtree.lua
--- @brief nvimtree config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
local M = {}

M.override = {
    auto_reload_on_write = true,
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = true,

    renderer = {
        highlight_git = true,
        icons = {
            git_placement = "after",
            modified_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
                modified = true,
            },
            glyphs = {
                git = {
                    staged = "✓",
                    unstaged = "⚙",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "☢",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },

    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },

    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = { ".aux", ".out", ".git" },
    },

    git = {
        enable = true,
        ignore = true,
    },

    experimental = {
        git = {
            async = true,
        },
    },
}

return M
