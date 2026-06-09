--- ============================================================================
--- @file dashboard.lua
--- @brief dashboard nvim config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
local db = require("dashboard")

db.setup({
    theme = "hyper",
    config = {
        week_header = {
            enable = true,
        },

        shortcut = {
            { desc = "[  sudoCompetence]" },

            {
                desc = " home",
                group = "DashboardColor",
                action = "cd ~/Repositories/",
                -- NOTE: dashboard-nvim uses `action` for key execution.
                -- If you want multiple actions, use a Lua function instead (see below).
                key = "h",
            },

            {
                desc = " config",
                group = "DashboardColor",
                action = "cd ~/.config/nvim/lua/",
                key = "c",
            },

            {
                icon = " ",
                desc = "files",
                group = "DashboardFiles",
                action = "Telescope find_files",
                key = "f",
            },

            {
                desc = " Update",
                group = "DashboardFooter",
                action = "Lazy update",
                key = "u",
            },
        },

        footer = {
            "",
            "",
            "",
            "",
            "  “He who has a why to live for can bear almost any how.”  ",
            -- "  “There is no faith and no courage and no sacrifice in doing what is expedient. ",
            -- "  “Therefore, do what is meaningful, not what is expedient.",
            "",
            -- "℣ “Dr. Jordan B. Peterson",
            "℣ “Friedrich Nietzsche",
            "",
            "",
            "⚡Powered by eovim",

        },
    },
})
