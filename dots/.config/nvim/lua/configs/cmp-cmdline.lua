--- ============================================================================
--- @file cmp-cmdline.lua
--- @brief cmpcmdline nvim config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
local cmp = require("cmp")

cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = "buffer" } },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    matching = { disallow_symbol_nonprefix_matching = false },
})
