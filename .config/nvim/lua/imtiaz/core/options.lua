vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
-- tabs and indentation
opt.relativenumber = true
opt.number = true
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width

opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one.

opt.wrap = false

--search settings

opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search , assume you want case-sensitive

opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark.
opt.signcolumn = "yes" -- show sign column so that the text doesnt shift.

opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

opt.clipboard:append("unnamedplus")

opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
