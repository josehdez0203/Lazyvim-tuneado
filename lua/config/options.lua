-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.whichwrap = "b,s,<,>[,],h,l"
opt.foldmethod = "indent"
opt.colorcolumn = "80"
opt.foldlevel = 100
opt.undofile = true
opt.showmode = false
---@diagnostic disable-next-line: assign-type-mismatch
opt.undodir = vim.fn.expand("~/.undodir/")
