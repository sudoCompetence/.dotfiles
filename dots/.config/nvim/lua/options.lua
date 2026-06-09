--- ============================================================================
--- @file options.lua
--- @brief nvchad options config
---
---
--- @author sudoCompetence
--- @date 2026-02-10
--- ============================================================================
require "nvchad.options"

local opt = vim.opt

-- neovim update time
opt.updatetime = 50

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python" },
    command = "setlocal indentexpr= autoindent",
})

-- indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = false
opt.cindent = false
opt.smartindent = true

-- search
opt.hlsearch = false
opt.incsearch = true

-- columns
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.colorcolumn = "80"

opt.cursorlineopt = 'both' -- to enable cursorline!
