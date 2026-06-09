--- ============================================================================
--- @file cmp.lua
--- @brief cmp nvim config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================

-- Load nvim-cmp completion engine
-- This module orchestrates completion UI, sources, and keymaps
local cmp = require("cmp")


-- ============================================================================
-- UI helpers
-- ============================================================================

-- Construct a custom border definition for cmp windows
--
-- @param hl_name string
--   Highlight group applied to all border characters.
--   Examples: "CmpBorder", "CmpDocBorder"
--
-- @return table
--   Border specification in the order expected by nvim-cmp:
--   top-left, top, top-right, right, bottom-right, bottom, bottom-left, left
--
-- This mirrors the classic NVChad / pre-2.5 border aesthetic.
local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end


-- ============================================================================
-- Core cmp setup
-- ============================================================================

cmp.setup({

    -- Completion behavior
    --
    -- "menu"     : show completion menu
    -- "menuone"  : show menu even if only one candidate exists
    completion = {
        completeopt = "menu,menuone",
    },


    -- =========================================================================
    -- Completion windows (UI)
    -- =========================================================================
    --
    -- Controls the appearance of:
    --   - the completion popup menu
    --   - the documentation window
    --
    window = {

        -- Completion menu window
        completion = {
            -- Custom border using the helper above
            border = border("CmpBorder"),

            -- Window highlight mapping:
            --   Normal        → popup background
            --   CursorLine    → selected item
            --   Search        → matched text
            winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",

            -- Disable scrollbar for a cleaner, minimal UI
            scrollbar = false,
        },

        -- Documentation preview window
        documentation = {
            border = border("CmpDocBorder"),
            winhighlight = "Normal:CmpDoc",
        },
    },


    -- =========================================================================
    -- Snippet expansion
    -- =========================================================================
    --
    -- Required whenever snippet sources are enabled.
    -- This delegates snippet expansion to LuaSnip.
    --
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },


    -- =========================================================================
    -- Key mappings (active when completion menu is visible)
    -- =========================================================================
    --
    -- These mappings apply in insert/select mode and only
    -- affect behavior while cmp is active.
    --
    mapping = {
        -- Navigate completion items
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),

        -- Scroll documentation window
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        -- Trigger completion manually
        ["<C-Space>"] = cmp.mapping.complete(),

        -- Close completion menu
        ["<C-c>"] = cmp.mapping.close(),

        -- Confirm selection
        --
        -- Insert behavior:
        --   - inserts completion text
        --   - replaces word under cursor
        -- select = true:
        --   - confirms the currently highlighted item
        --   - even if the user hasn’t explicitly selected one
        ["<C-l>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),

        -- Tab behavior (priority order):
        --   1. If cmp menu visible → select next item
        --   2. Else if LuaSnip can expand/jump → do so
        --   3. Else → fallback to literal <Tab>
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(
                    vim.api.nvim_replace_termcodes(
                        "<Plug>luasnip-expand-or-jump",
                        true, true, true
                    ),
                    ""
                )
            else
                fallback()
            end
        end, { "i", "s" }),

        -- Shift-Tab behavior (reverse of Tab):
        --   1. If cmp menu visible → select previous item
        --   2. Else if LuaSnip can jump backward → do so
        --   3. Else → fallback
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(
                    vim.api.nvim_replace_termcodes(
                        "<Plug>luasnip-jump-prev",
                        true, true, true
                    ),
                    ""
                )
            else
                fallback()
            end
        end, { "i", "s" }),
    },


    -- =========================================================================
    -- Completion sources
    -- =========================================================================
    --
    -- Order matters:
    --   sources are queried top-to-bottom
    --
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- Language Server Protocol completions
        { name = "luasnip" },  -- Snippet completions
        { name = "path" },     -- Filesystem paths
        { name = "buffer" },   -- Words from current buffer
    }),
})
local cmp = require("cmp")

-- border
local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

cmp.setup({
    completion = { completeopt = "menu,menuone" },

    -- Restore “old borders” look
    window = {
        completion = {
            border = border("CmpBorder"),
            winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
            scrollbar = false,
        },
        documentation = {
            border = border("CmpDocBorder"),
            winhighlight = "Normal:CmpDoc",
        },
    },

    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-l>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(
                    vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                    ""
                )
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(
                    vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
                    ""
                )
            else
                fallback()
            end
        end, { "i", "s" }),
    },

    sources = cmp.config.sources(
        {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path" },
            { name = "buffer" },
        }
    ),
})
