--- ============================================================================
--- @file comments.lua
--- @brief comments nvim config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
-- --- TODO / TASK / CHECKBOX ---
-- 󰄱 󰄲 󰗡 󰜺 󱓼  󰸞 󰸟 󰸠
-- --- NOTE / INFO / TIP ---
-- 󰋼 󰌶 󰍨 󰎞 󰞋 󰙎 󰛨  
-- --- OPTIM / PERF / SPEED ---
-- 󰓅 󰾆 󰄿 󱎫 󰡴 󱗼 󰑮 󰒓
-- --- WORKING / IN-PROGRESS / ACTIVE ---
-- 󰑕 󰔟 󱦟 󰦖 󰕧 󰧟 󰐊 󰐋
-- --- DEBUG / BUG / FIX ---
-- 󰃤 󰆦 󰈸 󰨰 󱐋 󰅙 󰣪
-- --- TEST / LAB / EXPERIMENT ---
-- 󰙨 󰂓 󱋣 󰛦 󰦙 󰟐
-- --- WARN / CAUTION / DANGER ---
-- 󰀪 󰳦 󱈸 󱇎 󰉀 󱅧  
-- --- BEGIN / END / BOUNDARY MARKERS ---
-- 󰐊 󰐋 󰜴 󰜴 󱞩 󱞪 󰒭 󰒮
-- --- SUS / QUESTIONABLE / ??? ---
-- 󰒃 󰋗 󰈻 󱈄 󰙥 󰦔 󰧠

-- --- Header-style glyph family (nice “levels” look) ---
-- Part: 󰎤   Chapter: 󰎧   Section: 󰎪   Subsection: 󰎭   Subsubsection: 󰎱
-- --- Bookmark / document family ---
-- Part: 󰈙   Chapter: 󰈚   Section: 󰈛   Subsection: 󰈜   Subsubsection: 󰈝
-- --- List / outline family ---
-- Part: 󰉹   Chapter: 󰉺   Section: 󰉻   Subsection: 󰉼   Subsubsection: 󰉽
-- --- Section sign / typography-ish options ---
-- §  ¶  󰊄  󰊅  󰊆  󰊇

local opts = {
    signs = true,      -- show icons in the signs column
    sign_priority = 8, -- sign priority
    keywords = {
        -- General
        TODO = { icon = " ", color = "#6dee85" },
        -- TODO = { icon = " ", color = "#6dee85" },
        NOTE = { icon = "󰍨 ", color = "hint", alt = { "INFO" } },
        OPTIM = { icon = "󰓅 ", alt = { "PERF", "PERFORMANCE", "OPTIMIZE" } },
        WORKING = { icon = " ", color = "#ee6d85", alt = { "CURRENT", "CURRENTLY" } },
        DEBUG = { icon = " ", color = "#ee6d85", alt = { "FIX", "FIXME", "BUG", "FIXIT", "ISSUE" }, },
        TEST = { icon = "󰂓 ", color = "#6dee85", alt = { "TESTING" } },
        WARN = { icon = " ", color = "#ebbd34", alt = { "WARNING" } },
        BEGIN = { icon = "󰒭 ", color = "#6dee85", alt = { "WARNING" } },
        END = { icon = "󰒮 ", color = "#ebbd34", alt = { "WARNING" } },
        SUS = { icon = "󱅧 ", color = "#ee6d85", alt = { "SUS" } },
        -- LaTex
        Part = { icon = "󰎤 ", color = "#5F8787" },
        Chapter = { icon = "󰎧 ", color = "#7199FF" },
        Section = { icon = "󰎪 ", color = "#6dee85" },
        Subsection = { icon = "󰎭 ", color = "#ebbd34" },
        Subsubsection = { icon = "󰎱 ", color = "#E05F51" },
    }
}

return opts
