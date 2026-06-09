-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "tokyonight",

    -- Override existing highlight groups
    -- hl_override = {
    --
    --   -- If your theme uses Treesitter highlight links, you can also target:
    --   ["@comment"] = { italic = true },
    --
    --   -- NVChad statusline groups (if you use them)
    --   St_NormalMode     = { bg = "#7A0019", fg = "#FFCC33" }, -- maroon bg, gold text
    --   St_NormalModeSep  = { fg = "#7A0019" },
    --   St_InsertMode     = { bg = "#FFCC33", fg = "#0F0F0F" }, -- gold bg, dark text
    --   St_InsertModeSep  = { fg = "#FFCC33" },
    --   St_VisualMode     = { bg = "#5B0013", fg = "#FFCC33" }, -- darker maroon
    --   St_VisualModeSep  = { fg = "#5B0013" },
    --   St_CommandMode    = { bg = "#E6B800", fg = "#0F0F0F" }, -- muted gold
    --   St_CommandModeSep = { fg = "#E6B800" },
    --   St_ReplaceMode    = { bg = "#3D000D", fg = "#FFCC33" }, -- very dark maroon
    --   St_ReplaceModeSep = { fg = "#3D000D" },
    --   St_TerminalMode   = { bg = "#FFCC33", fg = "#7A0019" }, -- inverted gold/maroon
    --
    --   St_NormalMode     = { bg = "#7199FF", fg = "#FFFFFF" },
    --   St_NormalModeSep  = { fg = "#7199FF" },
    --   St_InsertMode     = { bg = "#ebbd34", fg = "#0F0F0F" },
    --   St_InsertModeSep  = { fg = "#ebbd34" },
    --   St_VisualMode     = { bg = "#ee6d85", fg = "#FFFFFF" },
    --   St_VisualModeSep  = { fg = "#ee6d85" },
    --   St_CommandMode    = { bg = "#ebbd34", fg = "#0F0F0F" },
    --   St_CommandModeSep = { fg = "#ebbd34" },
    --   St_ReplaceMode    = { bg = "#ee6d85", fg = "#FFFFFF" },
    --   St_ReplaceModeSep = { fg = "#ee6d85" },
    --   St_TerminalMode   = { bg = "#7199FF", fg = "#FFFFFF" },
    --   St_TerminalModeSep= { fg = "#7199FF" },   -- St_TerminalModeSep= { fg = "#FFCC33" },
    -- },

    -- Add brand-new highlight groups (only if they don't already exist)
    -- hl_add = {
    --     Visual = { bg = "grey", fg = "#0F0F0F" },
    --     FoldColumn = { bg = "none" },
    --     Comment = { italic = true },
    --
    --     DiffAdd = { fg = "#6dee85" },
    --     DiffAddNr = { fg = "#6dee85" },
    --     DiffChange = { fg = "#7199ff" },
    --     DiffDelete = { fg = "#ee6d85" },
    --     DiffChangeDelete = { fg = "#7199ff" },
    --     GitSignsAdd = { fg = "#ebbd34" },
    --     GitSignsAddNr = { fg = "#ebbd34" },
    --
    --     NvimTreeNormal = { bg = "none" },
    --     NvimTreeNormalNC = { bg = "none" },
    --     NvimTreeLineNr = { fg = "#7199ff", bold = true },
    --     NvimTreeFolderName = { fg = "#7199ff", bold = true },
    --     NvimTreeOpenedFolderName = { fg = "#7199ff", bold = true },
    --     NvimTreeEmptyFolderName = { fg = "grey", bold = true },
    --     NvimTreeFileStaged = { fg = "#7199ff", bold = true },
    --     NvimTreeModifiedFile = { fg = "#7199ff", bold = true },
    --     NvimTreeFileRenamed = { fg = "#ebbd34", bold = true },
    --     NvimTreeGitNew = { fg = "#ebbd34" },
    --     NvimTreeGitStaged = { fg = "#7199ff" },
    --     NvimTreeGitRenamed = { fg = "#ebbd34" },
    --
    --     -- theme base
    --     DashboardColor = { fg = "#ebbd34" },
    --     DashboardHeader = { fg = "#ee6d85" },
    --     DashboardFooter = { fg = "#ee6d85" },
    --     DashboardFiles = { fg = "#ffffff" },
    --     DashboardProjectTitle = { fg = "#ee6d85" },
    --     DashboardProjectTitleIcon = { fg = "#ee6d85" },
    --     DashboardProjectIcon = { fg = "#7199FF" },
    --     DashboardMruTitle = { fg = "#ee6d85" },
    --     DashboardMruIcon = { fg = "#ee6d85" },
    --     DashboardShotCutTitle = { fg = "#FFFFFF" },
    --     DashboardShotCutIcon = { fg = "#7199FF" },
    -- },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
    tabufline = {
        lazyload = false
    },

    statusline = {
        enabled = true,
        theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
        -- default/round/block/arrow separators work only for default statusline theme
        -- round and block will work for minimal theme only
        separator_style = "round",
        -- order = nil,
        -- modules = nil,
    },
}

return M
