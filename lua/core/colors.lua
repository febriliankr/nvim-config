-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------
local status_ok, color_scheme = pcall(require, 'tokyonight')
if not status_ok then
    return
end

-- Tokyonight Settings
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}

-- Tokyonight Settings / Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = {
    hint = "orange",
    error = "#ff0000"
}

-- Tokyonight Settings / Load the colorscheme
vim.cmd [[colorscheme tokyonight]]

-- Note: The instruction to load the color scheme may vary.
-- See the README of the selected color scheme for the instruction
-- to use.
-- e.g.: require('color_scheme').setup{}, vim.cmd('color_scheme')

-- statusline color schemes:
-- import with: require('colors').colorscheme_name
local M = {}

M.tokyonight = {
    -- former onedark
    pink = '#c678dd',
    -- copas dari mnabila config
    none = "NONE",
    bg_dark = "#1f2335",
    bg = "#24283b",
    bg_highlight = "#292e42",
    terminal_black = "#414868",
    fg = "#c0caf5",
    fg_dark = "#a9b1d6",
    fg_gutter = "#3b4261",
    dark3 = "#545c7e",
    comment = "#565f89",
    dark5 = "#737aa2",
    blue0 = "#3d59a1",
    blue = "#7aa2f7",
    cyan = "#7dcfff",
    blue1 = "#2ac3de",
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#B4F9F8",
    blue7 = "#394b70",
    magenta = "#bb9af7",
    magenta2 = "#ff007c",
    purple = "#9d7cd8",
    orange = "#ff9e64",
    yellow = "#e0af68",
    green = "#9ece6a",
    green1 = "#73daca",
    green2 = "#41a6b5",
    teal = "#1abc9c",
    red = "#f7768e",
    red1 = "#db4b4b",
    git = {
        change = "#6183bb",
        add = "#449dab",
        delete = "#914c54",
        conflict = "#bb7a61"
    },
    gitSigns = {
        add = "#164846",
        change = "#394b70",
        delete = "#823c41"
    }

}

return M

