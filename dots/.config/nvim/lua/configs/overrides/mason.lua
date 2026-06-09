--- ============================================================================
--- @file mason.lua
--- @brief mason (lsp) config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
local M = {}

M.override = {
    automatic_installation = true,
    ensure_installed = {
        "prettier",
        "clangd",
        "clang-format",
        "lua-language-server",
        "stylua",
        "python-language-server",
        "markuplint",
        -- web
        -- "css-lsp",
        -- "html-lsp",
        -- "typescript-language-server",
        -- "deno",
    },
}

return M
