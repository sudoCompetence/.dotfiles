--- ============================================================================
--- @file treesitter.lua
--- @brief treesitter nvim config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
local M = {}

M.override = {
    auto_install = true,
    ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "c",
        "cpp",
        "python",
        "java",
        -- "go",
        -- web
        -- "html",
        -- "css",
        -- "javascript",
        -- "typescript",
    },
    indent = {
        enable = true,
        -- disable = { "python", "py" },
    },
    highlight = {
        enable = true, -- enable syntax highlighting
        -- disable = { "python" },
    },
}

return M
