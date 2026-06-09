--- ============================================================================
--- @file mappings.lua
--- @brief key mappings (NVChad v2+ compatible)
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
--    .-----.  .-'),-----. ,------. (,------.
--   '  .--./ ( OO'  .-.  '|   /`. ' |  .---'
--   |  |('-. /   |  | |  ||  /  | | |  |
--  /_) |OO  )\_) |  |\|  ||  |_.' |(|  '--.
--  ||  |`-'|   \ |  | |  ||  .  '.' |  .--'
-- (_'  '--'\    `'  '-'  '|  |\  \  |  `---.
--    `-----'      `-----' `--' '--' `------'
require "nvchad.mappings"

local map = vim.keymap.set
local del = vim.keymap.del

--  _(`-')    _     (`-').->(`-')  _<-.(`-')         (`-')  __(`-')
-- ( (OO ).->(_)    ( OO)_  (OO ).-/ __( OO)   <-.   ( OO).-( (OO ).->
--  \    .'_ ,-(`-'(_)--\_) / ,---. '-'---.\ ,--. ) (,------.\    .'_
--  '`'-..__)| ( OO/    _ / | \ /`.\| .-. (/ |  (`-')|  .---''`'-..__)
--  |  |  ' ||  |  \_..`--. '-'|_.' | '-' `.)|  |OO (|  '--. |  |  ' |
--  |  |  / (|  |_/.-._)   (|  .-.  | /`'.  (|  '__ ||  .--' |  |  / :
--  |  '-'  /|  |'-\       /|  | |  | '--'  /|     |'|  `---.|  '-'  /
--  `------' `--'   `-----' `--' `--`------' `-----' `------'`------'
pcall(del, "n", "Q")
pcall(del, "n", "<leader>n")  -- Turn off line number toggle
pcall(del, "n", "<leader>v")  -- terminal (vertical)
pcall(del, "n", "<leader>h")  -- terminal (horizontal)
pcall(del, "n", "<A-k>")      -- terminal (horizontal)
pcall(del, "n", "<leader>fm") -- find general format file

--           (`-')  <-. (`-')_ (`-')  _  (`-') (`-')  _
--     .->   ( OO).-/  \( OO) )( OO).-<-.(OO ) (OO ).-/   <-.
--  ,---(`-'(,------,--./ ,--/(,------,------,)/ ,---.  ,--. )
-- '  .-(OO )|  .---|   \ |  | |  .---|   /`. '| \ /`.\ |  (`-')
-- |  | .-, (|  '--.|  . '|  |(|  '--.|  |_.' |'-'|_.' ||  |OO )
-- |  | '.(_/|  .--'|  |\    | |  .--'|  .   .(|  .-.  (|  '__ |
-- |  '-'  | |  `---|  | \   | |  `---|  |\  \ |  | |  ||     |'
--  `-----'  `------`--'  `--' `------`--' '--'`--' `--'`-----'
map("n", ";", ":", { desc = "enter command mode", nowait = true })
map("n", "qq", "<cmd>q<CR>", { desc = "quit window" })

map("n", "<leader>st", "<cmd>Dashboard<CR>", { desc = "open dashboard", nowait = true })
map("n", "<leader>fn", "<cmd>Telescope notify<CR>", { desc = "notifications" })
map("n", "<leader>ct", "<cmd>Telescope themes<CR>", { desc = "nvchad themes" })
map("n", "<leader>cs", "<cmd>NvCheatsheet<CR>", { desc = "help mappings" })

-- resize nvim pane
map("n", "=", "<cmd>vertical resize +2<CR>", { desc = "vertical pane size increase", nowait = true })
map("n", "-", "<cmd>vertical resize -2<CR>", { desc = "vertical pane size decrease", nowait = true })
map("n", "+", "<cmd>horizontal resize +2<CR>", { desc = "horizontal pane size increase", nowait = true })
map("n", "_", "<cmd>horizontal resize -2<CR>", { desc = "horizontal pane size decrease", nowait = true })

--  “line edge” motions
map("n", "ga", "$", { desc = "move to end of line", nowait = true })
map("n", "gi", "^", { desc = "move to beginning of line", nowait = true })

-- search motions
map("n", "n", "nzzzv", { desc = "next search term (aligned)", nowait = true })
map("n", "N", "Nzzzv", { desc = "next search term (aligned)", nowait = true })

-- copy/paste motions
map("x", "<leader>p", "\"_dP", { desc = "paste with buffer overwrite", nowait = true })
map("n", "<leader>y", "\"+y", { desc = "paste to system clipboard", nowait = true })
map("n", "<leader>Y", "\"+Y", { desc = "paste to system clipboard", nowait = true })
map("v", "<leader>y", "\"+y", { desc = "paste to system clipboard", nowait = true })
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace word

-- tmux navigation (requires vim-tmux-navigator or similar)
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "navigate left", nowait = true })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "navigate down", nowait = true })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "navigate up", nowait = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "navigate right", nowait = true })
-- tmux sessionizer
map("n", "<C-f>", "<cmd><CR>", { desc = "navigate right", nowait = true })

-- code runner (requires RunFile/RunCode user commands)
map("n", "<C-e>", "<cmd>RunFile<CR>", { desc = "CodeRunner run file", nowait = true })
map("n", "<A-e>", "<cmd>RunCode<CR>", { desc = "CodeRunner run code", nowait = true })

-- lsp
map("n", "<C-k>", vim.lsp.buf.hover, { desc = "LSP Hover" })
-- map("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP Signature Help" })

--            _    (`-')
--     .->   (_)   ( OO).->
--  ,---(`-'),-(`-'/    '._
-- '  .-(OO )| ( OO|'--...__)
-- |  | .-, \|  |  `--.  .--'
-- |  | '.(_(|  |_/   |  |
-- |  '-'  | |  |'->  |  |
--  `-----'  `--'     `--'
-- fugitive
map("n", "<leader>gs", "<cmd>Git<CR>", { desc = "git status (fugitive)" })

-- lazygit
map("n", "<leader>gl", "<cmd>LazyGit<CR>", { desc = "launch lazygit" })

-- telescrope
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "git telescope status" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "git telescope branches" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "git telescope commits" })
map("n", "<leader>gh", "<cmd>Telescope git_stash<CR>", { desc = "git telescope stash" })

-- Undotree
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "toggle undotree", nowait = true })

-- (`-')    (`-')  _<-.(`-')                             _    <-. (`-')_ (`-')  _
-- ( OO).-> (OO ).-/ __( OO)     .->     <-.      <-.   (_)      \( OO) )( OO).-/
-- /    '._ / ,---. '-'---.\,--.(,--. (`-')-----,--. )  ,-(`-',--./ ,--/(,------.
-- |'--...__| \ /`.\| .-. (/|  | |(`-'(OO|(_\---|  (`-')| ( OO|   \ |  | |  .---'
-- `--.  .--'-'|_.' | '-' `.|  | |(OO )/ |  '--.|  |OO )|  |  |  . '|  |(|  '--.
--    |  | (|  .-.  | /`'.  |  | | |  \\_)  .--(|  '__ (|  |_/|  |\    | |  .--'
--    |  |  |  | |  | '--'  \  '-'(_ .' `|  |_) |     |'|  |'-|  | \   | |  `---.
--    `--'  `--' `--`------' `-----'     `--'   `-----' `--'  `--'  `--' `------'
map("n", "<leader>q", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "close buffer" })
map("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "new tab (window)" })
map("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "next tab (window)" })
map("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "prev tab (window)" })
map("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "close tab (window)" })

-- <-. (`-')_     (`-') _    <-. (`-') (`-')       (`-') (`-')  _(`-')  _
--    \( OO) )   _(OO )(_)      \(OO )_( OO).-> <-.(OO ) ( OO).-/( OO).-/
-- ,--./ ,--,--.(_/,-.\,-(`-',--./  ,-./    '._ ,------,(,------(,------.
-- |   \ |  \   \ / (_/| ( OO|   `.'   |'--...__|   /`. '|  .---'|  .---'
-- |  . '|  |\   /   / |  |  |  |'.'|  `--.  .--|  |_.' (|  '--.(|  '--.
-- |  |\    _ \     /_(|  |_/|  |   |  |  |  |  |  .   .'|  .--' |  .--'
-- |  | \   \-'\   /   |  |'-|  |   |  |  |  |  |  |\  \ |  `---.|  `---.
-- `--'  `--'   `-'    `--'  `--'   `--'  `--'  `--' '--'`------'`------'
map("n", "<leader>ft", "<cmd>NvimTreeFocus<CR>", { desc = "focus nvim tree" })
map("n", "<leader>fe", "<cmd>NvimTreeToggle<CR>", { desc = "toggle nvim tree" })

-- (`-')     (`-')  _  (`-')<-. (`-')   _    <-. (`-')_(`-')  _
-- ( OO).->  ( OO).-<-.(OO )   \(OO )_ (_)      \( OO) (OO ).-/   <-.
-- /    '._ (,------,------,,--./  ,-.),-(`-',--./ ,--// ,---.  ,--. )
-- |'--...__)|  .---|   /`. |   `.'   || ( OO|   \ |  || \ /`.\ |  (`-')
-- `--.  .--(|  '--.|  |_.' |  |'.'|  ||  |  |  . '|  |'-'|_.' ||  |OO )
--    |  |   |  .--'|  .   .|  |   |  (|  |_/|  |\    (|  .-.  (|  '__ |
--    |  |   |  `---|  |\  \|  |   |  ||  |'-|  | \   ||  | |  ||     |'
--    `--'   `------`--' '--`--'   `--'`--'  `--'  `--'`--' `--'`-----'
map("n", "<C-t>", "<cmd>ToggleTerm<CR>", { desc = "toggle terminal" })
map("t", "<C-t>", "<cmd>ToggleTerm<CR>", { desc = "toggle terminal" })

-- Exit terminal mode + move (your original sequence)
map("t", "<C-k>", "<C-\\><C-n><C-w>k<C-w>l", { desc = "exit terminal mode" })

--  _ .-') _     ('-.      _ (`-.
-- ( (  OO) )   ( OO ).-. ( (OO  )
--  \     .'_   / . --. /_.`     \
--  ,`'--..._)  | \-.  \(__...--''
--  |  |  \  '.-'-'  |  ||  /  | |
--  |  |   ' | \| |_.'  ||  |_.' |
--  |  |   / :  |  .-.  ||  .___.'
--  |  '--'  /  |  | |  ||  |
--  `-------'   `--' `--'`--'
map("n", "<leader>b", function() require("dap").toggle_breakpoint() end, { desc = "DAP: Toggle Breakpoint" })
map("n", "<leader>db", function() require("dap").continue() end, { desc = "DAP: Continue" })
map("n", "<leader>dc", function() require("dap").continue() end, { desc = "DAP: Continue" })
map("n", "<leader>dbq", function() require("dap").terminate() end, { desc = "DAP: Quit Debugging" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "DAP: Step Into" })
map("n", "<leader>do", function() require("dap").step_over() end, { desc = "DAP: Step Over" })

--                     (`-')             _    <-. (`-')_ (`-')  _
--      .->       .->  ( OO).->   <-.   (_)      \( OO) )( OO).-/
-- (`-')----.,--.(,--. /    '._ ,--. )  ,-(`-',--./ ,--/(,------.
-- ( OO).-.  |  | |(`-'|'--...__|  (`-')| ( OO|   \ |  | |  .---'
-- ( _) | |  |  | |(OO `--.  .--|  |OO )|  |  |  . '|  |(|  '--.
--  \|  |)|  |  | | |  \  |  | (|  '__ (|  |_/|  |\    | |  .--'
--   '  '-'  \  '-'(_ .'  |  |  |     |'|  |'-|  | \   | |  `---.
--    `-----' `-----'     `--'  `-----' `--'  `--'  `--' `------'
map("n", "<leader>se", "<cmd>Outline<CR>", { desc = "toggle outline" })

--  (`-').-> _    _(`-')   (`-')  <-.(`-') (`-')  _   (`-')
--  ( OO)_  (_)  ( (OO ).->( OO).-/__( OO) (OO ).-/<-.(OO )
-- (_)--\_) ,-(`-'\    .'_(,------'-'---.\ / ,---. ,------,)
-- /    _ / | ( OO'`'-..__)|  .---| .-. (/ | \ /`.\|   /`. '
-- \_..`--. |  |  |  |  ' (|  '--.| '-' `.)'-'|_.' |  |_.' |
-- .-._)   (|  |_/|  |  / :|  .--'| /`'.  (|  .-.  |  .   .'
-- \       /|  |'-|  '-'  /|  `---| '--'  /|  | |  |  |\  \
--  `-----' `--'  `------' `------`------' `--' `--`--' '--'
-- map("n", "<leader>bt", "<cmd>SidebarNvimFocus<CR>", { desc = "focus sidebar" })
map("n", "<leader>sb", "<cmd>SidebarNvimToggle<CR>", { desc = "toggle sidebar" })

-- <-.(`-')                    <-.(`-')<-. (`-')  (`-')  _   (`-')<-.(`-') (`-').->
--  __( OO)     .->       .->   __( OO)   \(OO )_ (OO ).-/<-.(OO ) __( OO) ( OO)_
-- '-'---.\(`-')----.(`-')----.'-'. ,--,--./  ,-.)/ ,---. ,------,'-'. ,--(_)--\_)
-- | .-. (/( OO).-.  ( OO).-.  |  .'   |   `.'   || \ /`.\|   /`. |  .'   /    _ /
-- | '-' `.( _) | |  ( _) | |  |      /|  |'.'|  |'-'|_.' |  |_.' |      /\_..`--.
-- | /`'.  |\|  |)|  |\|  |)|  |  .   '|  |   |  (|  .-.  |  .   .|  .   '.-._)   \
-- | '--'  / '  '-'  ' '  '-'  |  |\   |  |   |  ||  | |  |  |\  \|  |\   \       /
-- `------'   `-----'   `-----'`--' '--`--'   `--'`--' `--`--' '--`--' '--'`-----'
map("n", "<leader>fm", function() require("telescope").extensions.vim_bookmarks.all() end, { desc = "show all marks" })
map("n", "<leader>mf", function() require("telescope").extensions.vim_bookmarks.current_file() end,
    { desc = "show current file marks" })

map("n", "<leader>ma", "<cmd>BookmarkToggle<CR>", { desc = "toggle mark" })
map("n", "<leader>me", "<cmd>BookmarkAnnotate<CR>", { desc = "annotate mark" })
map("n", "<leader>mn", "<cmd>BookmarkNext<CR>", { desc = "goto next mark" })
map("n", "<leader>mp", "<cmd>BookmarkPrev<CR>", { desc = "goto prev mark" })
map("n", "<leader>mca", "<cmd>BookmarkClearAll<CR>", { desc = "clear all marks" })

--  ,--. ,--.      ,------. .-'),-----.
--  |  | |  |   ('-| _.---'( OO'  .-.  '
--  |  | | .-') (OO|(_\    /   |  | |  |
--  |  |_|( OO )/  |  '--. \_) |  |\|  |
--  |  | | `-' /\_)|  .--'   \ |  | |  |
-- ('  '-'(_.-'   \|  |_)     `'  '-'  '
--   `-----'       `--'         `-----'
map("n", "<leader>sf", "za", { desc = "scope fold (toggle)" })
map("n", "<leader>so", "zO", { desc = "open fold recursively" })
map("n", "<leader>sa", function() require("ufo").openAllFolds() end, { desc = "open all folds" })
map("n", "<leader>sc", function() require("ufo").closeAllFolds() end, { desc = "close all folds" })

--  (`-').->(`-')  _   (`-') _  (`-')                   <-. (`-')_
--  (OO )__ (OO ).-/<-.(OO ) \-.(OO )    .->       .->     \( OO) )
-- ,--. ,'-'/ ,---. ,------,)_.'    (`-')----.(`-')----.,--./ ,--/
-- |  | |  || \ /`.\|   /`. (_...--'( OO).-.  ( OO).-.  |   \ |  |
-- |  `-'  |'-'|_.' |  |_.' |  |_.' ( _) | |  ( _) | |  |  . '|  |)
-- |  .-.  (|  .-.  |  .   .|  .___.'\|  |)|  |\|  |)|  |  |\    |
-- |  | |  ||  | |  |  |\  \|  |      '  '-'  ' '  '-'  |  | \   |
-- `--' `--'`--' `--`--' '--`--'       `-----'   `-----'`--'  `--'
map("n", "<leader>ht", "<cmd>Telescope harpoon marks<CR>", { desc = "find harpoon marks" })
map("n", "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "toggle harpoon menu" })
map("n", "<leader>ha", function() require("harpoon.mark").add_file() end, { desc = "harpoon file" })

map("n", "<leader>hf", function() require("harpoon.ui").nav_file(1) end, { desc = "harpoon 1" })
map("n", "<leader>hd", function() require("harpoon.ui").nav_file(2) end, { desc = "harpoon 2" })
map("n", "<leader>hs", function() require("harpoon.ui").nav_file(3) end, { desc = "harpoon 3" })
map("n", "<leader>hr", function() require("harpoon.ui").nav_file(4) end, { desc = "harpoon 4" })
map("n", "<leader>he", function() require("harpoon.ui").nav_file(5) end, { desc = "harpoon 5" })
map("n", "<leader>hw", function() require("harpoon.ui").nav_file(6) end, { desc = "harpoon 6" })

--  ('-. .-.                _ (`-.
-- ( OO )  /               ( (OO  )
-- ,--. ,--. .-'),-----.  _.`     \
-- |  | |  |( OO'  .-.  '(__...--''
-- |   .|  |/   |  | |  | |  /  | |
-- |       |\_) |  |\|  | |  |_.' |
-- |  .-.  |  \ |  | |  | |  .___.'
-- |  | |  |   `'  '-'  ' |  |
-- `--' `--'     `-----'  `--'
map("n", "fw", "<cmd>HopWord<CR>", { desc = "hop word" })
map("n", "fj", "<cmd>HopWordAC<CR>", { desc = "hop word after cursor" })
map("n", "fk", "<cmd>HopWordBC<CR>", { desc = "hop word before cursor" })
map("n", "fl", "<cmd>HopWordCurrentLine<CR>", { desc = "hop word current line" })
map("n", "fh", "<cmd>HopLineStart<CR>", { desc = "hop line start" })
map("n", "fp", "<cmd>HopPattern<CR>", { desc = "hop pattern" })

--       (`-.           _   .-')     .-') _     ('-.  ) (`-.
--     _(OO  )_        ( '.( OO )_  (  OO) )  _(  OO)  ( OO ).
-- ,--(_/   ,. \ ,-.-') ,--.   ,--.)/     '._(,------.(_/.  \_)-.
-- \   \   /(__/ |  |OO)|   `.'   | |'--...__)|  .---' \  `.'  /
--  \   \ /   /  |  |  \|         | '--.  .--'|  |      \     /\
--   \   '   /,  |  |(_/|  |'.'|  |    |  |  (|  '--.    \   \ |
--    \     /__),|  |_.'|  |   |  |    |  |   |  .--'   .'    \_)
--     \   /   (_|  |   |  |   |  |    |  |   |  `---. /  .'.  \
--      `-'      `--'   `--'   `--'    `--'   `------''--'   '--'
map("n", "<leader>lc", "<cmd>VimtexCompile<CR>", { desc = "VimTeX compile" })
map("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "VimTeX view" })
map("n", "<leader>lq", "<cmd>VimtexStop<CR>", { desc = "VimTeX stop" })

--   (`\ .-') /`   ('-. .-. .-')
--    `.( OO ),' _(  OO)\  ( OO )
-- ,--./  .--.  (,------.;-----.\
-- |      |  |   |  .---'| .-.  |
-- |  |   |  |,  |  |    | '-' /_)
-- |  |.'.|  |_)(|  '--. | .-. `.
-- |         |   |  .--' | |  \  |
-- |   ,'.   |   |  `---.| '--'  /
-- '--'   '--'   `------'`------'
map("n", "<leader>wp", "<cmd>BrowserPreview<CR>", { desc = "web preview" })
