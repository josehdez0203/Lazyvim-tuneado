-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.api.nvim_set_keymap --for conciseness
local opts = { noremap = true, silent = true }

--Abrir navegador y buscar en archivo en arbol
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>d", ":NvimTreeFindFile<CR>", opts)

--"guardar archivo
-- map("n", "<C-s>", "<cmd>w<CR>", { noremap = true, silent = false })
-- map("i", "<C-s>", "<Esc><cmd>w<CR>", { noremap = true, silent = false })

--Terminal flotante
map("n", "<F12>", ":FloatermToggle<CR>", opts)
map("t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", opts)
-- delete single character without copying into register
map("n", "x", '"_x', opts)
map("n", "<C-c>", ":<C-w>q<cr>", opts) -- close current split window
map("n", "<C-x>", ":bdelete<CR>", opts) -- cerrar buffer
map("n", "<leader>zz", ":ZenMode<CR>", opts) -- ZenMode
map("n", "<leader>zt", ":Twilight<CR>", opts) --Twilight
-- Reemplazar todo en el archivo
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
-- Buscar palabra en todo el archivo
map("n", "<leader>h", [[:/\<<C-r><C-w>\><Left><Left><CR>:set hlsearch<CR>n]], opts)
-- Move Lines
map("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
-- Mover entre buffers
map("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Move right" })
map("n", "<s-tab>", "<cmd>BufferLineCylcePrev<CR>", { desc = "Move left" })
--Mostrar/ocultar barra de cambios
map("n", "<F4>", ":UndotreeToggle<CR>", { noremap = true, silent = false })
-- map(
--   "v",
--   "n",
--   [[:<c-u>let temp_variable=@"<CR>gvy:<c-u>let @/='\V<C-R>=escape(@",'/\')<CR>'<CR>:let @"=temp_variable<CR>]],
--   { silent = true }
-- )
