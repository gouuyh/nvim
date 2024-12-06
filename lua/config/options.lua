-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.compatible = false
opt.backspace = { 'indent', 'eol', 'start' }
opt.showmode = true
opt.showcmd = true
opt.guifont = {"SauceCodePro Nerd Font", "Noto Sans Mono CJK SC", ":h12"}
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.mouse = 'a'
opt.wrap = true
opt.linebreak = false
opt.conceallevel = 0
opt.spell = false
