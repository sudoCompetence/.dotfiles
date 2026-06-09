--- ============================================================================
--- @file ufo.lua
--- @brief ufo (scope folding) config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
vim.cmd('highlight NvimTreeNormal guibg=none')
vim.cmd('highlight NvimTreeNormalNC guibg=none')
local opts = {
    open_fold_hl_timeout = 400,
    close_fold_kinds_for_ft = {
        "comment", "treesitter",
        default = {default = {}}
    },
    preview = {
        win_config = {
            border = { "", "─", "", "", "", "─", "", "" },
            winblend = 0,
        },
        -- mappings = {
        --     scrollU = "<C-u>",
        --     scrollD = "<C-d>",
        --     jumpTop = "[",
        --     jumpBot = "]",
        -- },
    },
}
-- black magic to show percentage of file that is folded away
local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local totalLines = vim.api.nvim_buf_line_count(0)
    local foldedLines = endLnum - lnum
    local suffix = ("     %d%% - %d Lines"):format(foldedLines, foldedLines / totalLines * 100)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    local rAlignAppndx =
    math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
    suffix = (" "):rep(rAlignAppndx) .. suffix
    table.insert(newVirtText, { suffix, "MoreMsg" })
    return newVirtText
end
opts["fold_virt_text_handler"] = handler
require("ufo").setup(opts)
