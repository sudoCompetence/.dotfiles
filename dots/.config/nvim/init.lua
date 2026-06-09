--- ============================================================================
--- @file init.lua
--- @brief neovim initialization file
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
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

--                          .-')    .-') _                _   .-')    
--                         ( OO ). (  OO) )              ( '.( OO )_  
--    .-----. ,--. ,--.   (_)---\_)/     '._  .-'),-----. ,--.   ,--.)
--   '  .--./ |  | |  |   /    _ | |'--...__)( OO'  .-.  '|   `.'   | 
--   |  |('-. |  | | .-') \  :` `. '--.  .--'/   |  | |  ||         | 
--  /_) |OO  )|  |_|( OO ) '..`''.)   |  |   \_) |  |\|  ||  |'.'|  | 
--  ||  |`-'| |  | | `-' /.-._)   \   |  |     \ |  | |  ||  |   |  | 
-- (_'  '--'\('  '-'(_.-' \       /   |  |      `'  '-'  '|  |   |  | 
--    `-----'  `-----'     `-----'    `--'        `-----' `--'   `--' 
-- ============================================================================
-- Custom Neovim initialization onfiguration
-- ============================================================================

-- Shorthand for vim options (vim.opt uses typed option API)
local opt = vim.opt

-- Autocommand group for filetype-specific UI tweaks
-- Using a named augroup allows clean redefinition on reload
local _ft = vim.api.nvim_create_augroup("FileTypeSettings", { clear = true })


-- ============================================================================
-- Base / Core behavior
-- ============================================================================

-- Enable 24-bit RGB color in the terminal (required for modern color schemes)
opt.termguicolors = true

-- Treat '@' and '-' as valid filename characters
-- Prevents path-breaking in things like Rust crates, C headers, etc.
opt.isfname:append("@-@")

-- Disable swap files (avoids *.swp clutter and issues with temp dirs)
opt.swapfile = false

-- Disable backup files (~)
-- Assumes version control (git) is the source of truth
opt.backup = false


-- ============================================================================
-- Line rendering / whitespace visibility
-- ============================================================================

-- Show whitespace characters (useful for indentation-sensitive languages)
opt.list = true

-- Render spaces as middle dots (visualizes accidental spacing)
opt.listchars:append "space:⋅"

-- Render end-of-line explicitly (helps detect trailing lines / wrapping)
opt.listchars:append "eol:↴"

-- Disable line wrapping
-- Forces horizontal scrolling instead of soft wrap
opt.wrap = false


-- ============================================================================
-- Indentation / tabs
-- ============================================================================

-- Number of spaces that a <Tab> counts for
opt.tabstop = 4

-- Number of spaces used when pressing <Tab> in insert mode
opt.softtabstop = 4

-- Number of spaces used for autoindent and >> / <<
opt.shiftwidth = 4

-- Convert tabs to spaces
-- Ensures consistent formatting across editors
opt.expandtab = true

-- Enable smart indentation (basic language-aware indentation)
opt.smartindent = true


-- ============================================================================
-- Line numbers / gutters
-- ============================================================================

-- Enable absolute line numbers
opt.nu = true

-- Enable relative line numbers (for motion efficiency)
opt.relativenumber = true

-- Minimum width of the line number column
-- Prevents UI shifting when line count grows
opt.numberwidth = 4

-- Keep at least N lines visible above/below cursor
-- Improves context when navigating vertically
opt.scrolloff = 9

-- Always show sign column (LSP, git, diagnostics)
-- Prevents text shifting when signs appear
opt.signcolumn = "yes"


-- ============================================================================
-- Folding UI
-- ============================================================================

-- Customize characters used for folds and end-of-buffer
-- Removes ~ at EOF and uses directional fold symbols
vim.o.fillchars = [[eob: ,fold: ,foldopen:↳,foldsep: ,foldclose:↠]]

-- Width of the fold column (left gutter)
-- Wide enough to show nested folds clearly
vim.o.foldcolumn = "6"   -- '0' also acceptable if space constrained

-- Folding behavior:
-- Large values keep folds open by default
-- Required for ufo.nvim or similar fold providers
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true


-- ============================================================================
-- Search behavior
-- ============================================================================

-- Highlight all search matches
opt.hlsearch = true

-- Incremental search (updates matches as you type)
opt.incsearch = true


-- ============================================================================
-- Filetype-specific UI: Outline buffer
-- ============================================================================

-- Adjust UI for Outline plugin buffer
-- Goal: cleaner, minimal view without unnecessary gutters
vim.api.nvim_create_autocmd("FileType", {
    pattern = "Outline",
    group = _ft,
    callback = function()
        vim.wo.signcolumn = "no"  -- hide sign column
        vim.wo.foldcolumn = "1"   -- minimal fold indicator
    end,
})


-- ============================================================================
-- Navigation & editing keymaps
-- ============================================================================

-- Move selected lines DOWN in visual mode
-- Keeps selection active and re-indents
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Move selected lines UP in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines without moving cursor position
-- mz / `z preserves cursor location
vim.keymap.set("n", "J", "mzJ`z")

-- Half-page jump DOWN while keeping cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Half-page jump UP while keeping cursor centered
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search next result and center screen + open folds
vim.keymap.set("n", "n", "nzzzv")

-- Search previous result and center screen + open folds
vim.keymap.set("n", "N", "Nzzzv")
