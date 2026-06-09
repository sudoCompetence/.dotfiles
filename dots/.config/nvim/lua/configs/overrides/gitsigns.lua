--- ============================================================================
--- @file gitsigns.lua
--- @brief gitsigns config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
local M = {}

M.override = {
    signs = {
        add = { hl = "DiffAdd", text = "➜", numhl = "GitSignsAddNr" },
        untracked = { hl = "GitSignsAdd", text = "☢", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "DiffChange", text = "", numhl = "GitSignsChangeNr" },
        delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
        topdelete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
        changedelete = { hl = "DiffChangeDelete", text = "", numhl = "GitSignsChangeNr" },
    },
}

return M
