--- ============================================================================
--- @file sidebar.lua
--- @brief sidebar nvim config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
local opts = {
    bindings = nil,
    sections = { "datetime", "git", "diagnostics", "todos" },
    disable_default_keybindings = 0,
    open = false,
    side = "left",
    initial_width = 35,
    hide_statusline = false,
    update_interval = 1000,
    section_separator = { "", "-----", "" },
    section_title_separator = { "" },

    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },

    git = {
        icon = "",
    },

    todos = {
        icon = "",
        ignored_paths = { '~' },  -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
        initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
    },

    buffers = {
        icon = "",
        ignored_buffers = {},      -- ignore buffers by regex
        sorting = "id",            -- alternatively set it to "name" to sort by buffer name instead of buf id
        show_numbers = true,       -- whether to also show the buffer numbers
        ignore_not_loaded = false, -- whether to ignore not loaded buffers
        ignore_terminal = true,    -- whether to show terminal buffers in the list
    },

    files = {
        icon = "",
        show_hidden = false,
        ignored_paths = { "%.git$" }
    }

    -- containers = {
    --     attach_shell = "/bin/sh", show_all = true, interval = 5000,
    -- },
}

return opts
