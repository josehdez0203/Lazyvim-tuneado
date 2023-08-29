-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.api.nvim_set_keymap --for conciseness
-- local opts = { noremap = true, silent = true }

--Abrir navegador y buscar en archivo en arbol
map("n", "<F3>", ":NvimTreeToggle<CR>", { noremap = true, silent = false })
map("n", "<F7>", ":NvimTreeFindFile<CR>", { noremap = true, silent = false })

--"guardar archivo
-- map("n", "<C-s>", "<cmd>w<CR>", { noremap = true, silent = false })
-- map("i", "<C-s>", "<Esc><cmd>w<CR>", { noremap = true, silent = false })

--Terminal flotante
map("n", "<F12>", ":FloatermToggle<CR>", { noremap = true, silent = true })
map("t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", { noremap = true, silent = true })
