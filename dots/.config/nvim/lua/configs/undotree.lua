--- ============================================================================
--- @file undotree.lua
--- @brief undotree config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.loop.os_homedir() .. "/.config/nvim/lua/.undo"
vim.g.undotree_WindowLayout = 3
