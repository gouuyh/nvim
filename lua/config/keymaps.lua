-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

keymap('n', ';', 'i')
keymap({'n', 'v'}, 'i', 'k')
keymap({'n', 'v'}, 'k', 'j')
keymap({'n', 'v'}, 'j', 'h')
keymap({'n', 'v'}, 'h', 'i')
