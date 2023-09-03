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
-- delete single character without copying into register
map("n", "x", '"_x', { noremap = true, silent = true })
map("n", "<C-c>", ":<C-w>q<cr>", { noremap = true, silent = true }) -- close current split window
map("n", "<C-x>", ":bdelete<CR>", { noremap = true, silent = false }) -- cerrar buffer
map("n", "<leader>zz", ":ZenMode<CR>", { noremap = true, silent = true }) -- ZenMode
map("n", "<leader>zt", ":Twilight<CR>", { noremap = true, silent = true }) --Twilight
-- Reemplazar todo en el archivo
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true, silent = false })
--" Commentary
-- map("n", "<leader>/", "gcc", { noremap = true, silent = true })
-- map("v", "<c-/>", "gc", { noremap = true, silent = true })
