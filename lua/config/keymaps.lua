-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Selest all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
--keymap.set("n", "<C-m>", "C-i", opts)

--Splip windows
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

--Move windows
--keymap.set("n", "sh", "<C-w>h")
--keymap.set("n", "sk", "<C-w>k")
--keymap.set("n", "sj", "<C-w>j")
--keymap.set("n", "sl", "<C-w>l")

--Diagnostics
-- keymap.set("n", "<C-j>", function()
--   vim.diagnostic.goto_next()
-- end, opts)
