--- ============================================================================
--- @file lspconfig.lua
--- @brief lsp config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
---
--  h vim.lsp.config
--- ============================================================================
-- NVChad sets up sane defaults (diagnostics, keymaps, capabilities, etc.)
require("nvchad.configs.lspconfig").defaults()

-- Enable these servers (names must be nvim-lspconfig server names)
local servers = { "lua_ls", "clangd", "pylsp", "jdtls", "texlab" }

-- clangd flags
-- vim.lsp.config("clangd", {
--     cmd = { "clangd", "--offset-encoding=utf-16" },
-- })

-- enable servers
vim.lsp.enable(servers)
