local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local api = vim.api

g.mapleader = ' '

g.syntax_on = true

-- o.hidden = true

wo.number = true
o.number = true

-- wo.relativenumber = true
-- o.relativenumber = true

o.clipboard = 'unnamedplus'
o.updatetime=100

wo.wrap = false
o.wrap = false

o.expandtab = true
bo.expandtab = true
o.shiftwidth = 4
bo.shiftwidth = 4
-- when 'sts' is negative, the value of 'shiftwidth' is used.
o.softtabstop = -1
bo.softtabstop = -1
o.autoindent = true
bo.autoindent = true

--searching
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

o.splitbelow = true
o.splitright = true
o.signcolumn = 'yes'

o.undodir = "~/.vim/undodir"
o.undofile = true

o.cmdheight = 2

o.mouse = 'a'

o.cursorline = true

-- o.colorscheme = 'material'
