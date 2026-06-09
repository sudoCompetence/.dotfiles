-- Define your main modifier (usually SUPER = Windows key)
local mainMod = "SUPER"

hl.unbind("SUPER + A")
hl.unbind("SUPER + B")
hl.unbind("SUPER + C")
hl.unbind("SUPER + W")
hl.unbind("SUPER + O")
hl.unbind("SUPER + H")
hl.unbind("SUPER + J")
hl.unbind("SUPER + K")
hl.unbind("SUPER + L")
hl.unbind("SUPER + N")
hl.unbind("SUPER + Q")
hl.unbind("SUPER + SHIFT + H")
hl.unbind("SUPER + SHIFT + J")
hl.unbind("SUPER + SHIFT + K")
hl.unbind("SUPER + SHIFT + L")
hl.unbind("SUPER + SHIFT + L")
hl.unbind("SUPER + SHIFT + S")
hl.unbind("CONTROL + ALT + L")
hl.unbind("CONTROL + ALT + T")
hl.unbind("CONTROL + ALT + S")
hl.unbind("SUPER + Semicolon")
hl.unbind("SUPER + Apostrophe")
hl.unbind("CTRL + SUPER + SHIFT + ALT + W")
for i = 1, 10 do
    hl.unbind("SUPER + ALT + " .. (i % 10), function()
        hl.dispatch(hl.dsp.window.move({ workspace = workspace_in_group(i), follow = false }))
    end)
end
--# #/# bind = SUPER+SHIFT, Scroll ↑/↓,, -- Send to workspace left/right
for i = 1, 4 do
    local key = { "SUPER + SHIFT + mouse_", "SUPER + ALT + mouse_" }
    local keycombos = { key[1] .. "down", key[1] .. "up", key[2] .. "down", key[2] .. "up" }
    local prefix = { "r-", "r+", "r-", "r+" }
    hl.unbind(keycombos[i], hl.dsp.window.move({ workspace = prefix[i] .. "1" }))
end
--#/# bind = SUPER+SHIFT, Page_↑/↓,, -- Send to workspace left/right
for i = 1, 2 do
    local keydirs = { "Up", "Down" }
    local prefix = { "r-", "r+" }
    local descdir = { "left", "right" }
    hl.unbind("SUPER + SHIFT + Page_" .. keydirs[i], hl.dsp.window.move({ workspace = prefix[i] .. "1" }))
end

-- Sidebars
hl.bind("SUPER + Semicolon", hl.dsp.global("quickshell:sidebarLeftToggle"), { description = "Shell: Toggle left sidebar" })
hl.bind("SUPER + Apostrophe", hl.dsp.global("quickshell:sidebarRightToggle"), { description = "Shell: Toggle right sidebar" })

-- Move focus with mainMod + (vim bindings)
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))

-- Toggle split direction (for Dwindle layout)
hl.bind(mainMod .. " + SHIFT + W",       hl.dsp.layout("togglesplit"))   -- toggle split direction
hl.bind(mainMod .. " + W", hl.dsp.layout("swapsplit"))   -- swap split (alternative)

-- Resize windows
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -344, y = 0,   relative = true }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0,   y = 144,  relative = true }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0,   y = -144, relative = true }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 344,  y = 0,   relative = true }))

-- -- Move active window with mainMod + CONTROL + vim keys
hl.bind(mainMod .. " + CONTROL + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + CONTROL + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + CONTROL + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + CONTROL + L", hl.dsp.window.move({ direction = "r" }))
-- Move active window to workspace + FOLLOW (switches to that workspace)
for i = 1, 9 do
    hl.bind(mainMod .. " + SHIFT + " .. i, function()
        hl.dispatch(hl.dsp.window.move({ workspace = i }))
        hl.dispatch(hl.dsp.focus({ workspace = i }))
    end)
end
-- Move ALL windows to target workspace + FOLLOW
for i = 1, 10 do
    local ws = i  -- 1 to 10
    local key = (i % 10)  -- 1→1, ..., 9→9, 10→0

    hl.bind("SUPER + ALT + " .. key, function()
        local current_ws = hl.get_active_workspace().id

        -- Get all windows on current workspace
        local windows = hl.get_windows({ workspace = current_ws })

        -- Move every window
        for _, win in ipairs(windows) do
            hl.dispatch(hl.dsp.window.move({
                window = win.address,   -- important: use address
                workspace = ws
            }))
        end

        -- Follow (switch to the new workspace)
        hl.dispatch(hl.dsp.focus({ workspace = ws }))
    end, { description = "Window: Move all windows to workspace " .. i })
end

-- Quit
hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Window: Quit/Close" })

-- Lock, and sleep
hl.bind("CONTROL + ALT + L", hl.dsp.exec_cmd("loginctl lock-session"), { description = "Session: Lock" })
hl.bind("CONTROL + ALT + S", hl.dsp.exec_cmd("systemctl suspend || loginctl suspend"),
    { locked = true, description = "Session: Sleep" }) -- Sleep

-- Apps and packages
hl.bind("CONTROL + ALT + A", hl.dsp.global("quickshell:sidebarLeftToggle"), { description = "Shell: Toggle left sidebar" })
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser), { description = "App: Browser" })
hl.bind("SUPER + A", hl.dsp.exec_cmd(anki), { description = "App: Anki" })
hl.bind("SUPER + O", hl.dsp.exec_cmd(obsidian), { description = "App: Obsidian" })
hl.bind("SUPER + Z", hl.dsp.exec_cmd(zotero), { description = "App: Zotero" })
hl.bind("SUPER + N", hl.dsp.exec_cmd(notion), { description = "App: Notion" })
hl.bind("SUPER + C", hl.dsp.exec_cmd(notionCalendar), { description = "App: Notion Calendar" })
