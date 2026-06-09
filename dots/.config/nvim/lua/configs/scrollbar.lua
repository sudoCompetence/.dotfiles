--- ============================================================================
--- @file scrollbar.lua
--- @brief scrollbar nvim config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
local opts = {
    set_highlights = true,
    marks = {
        Cursor = { text = "", color="#ffffff"},
        GitAdd = { text = "➜", color = "#6dee85" },
        GitChange = { text = "", color = "#7199ff" },
        GitDelete = { text = "✗", color="#ee6d85" },
        Error = { text = { "" }, color = "#ee6d85" },
        Warn = { text = { "" }, color = "#ebbd34" },
        Info = { text = { "" }, color = "grey" },
        Hint = { text = { "" }, color = "#6dee85" },
        Search = { text = { "✗" }, color = "#ebbd34" },
        Misc = { text = { "◌" }, color = "grey" },
    },
}

return opts
