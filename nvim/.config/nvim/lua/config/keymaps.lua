-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- SALVAR
map("n", "<C-s>", ":w<CR>", { desc = "Save" })
map("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save" })
map("v", "<C-s>", "<Esc>:w<CR>gv", { desc = "Save" })

-- DESFAZER / REFAZER
map("n", "<C-S-z>", "<C-r>", { desc = "Redo" })

-- FECHAR BUFFER
map("n", "<A-q>", ":bdelete<CR>", { desc = "Close buffer" })

-- NAVEGACAO ENTRE BUFFERS
map("n", "<C-Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<C-S-Tab>", ":bprevious<CR>", { desc = "Prev buffer" })

-- MOVER LINHAS (Alt+Up/Down)
map("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- DELETAR LINHA
map("n", "<C-S-k>", "dd", { desc = "Delete line" })

-- COMENTARIO
map("n", "<C-/>", "gcc", { desc = "Toggle comment" })
map("v", "<C-/>", "gc", { desc = "Toggle comment" })

-- PALETA DE COMANDOS
map("n", "<C-S-p>", function()
  Snacks.picker.commands()
end, { desc = "Command palette" })

-- BUSCAR ARQUIVOS
map("n", "<C-p>", function()
  Snacks.picker.files()
end, { desc = "Find files" })

-- BUSCAR NO PROJETO
map("n", "<leader>fw", function()
  Snacks.picker.grep()
end, { desc = "Find in files" })

-- RENOMEAR
map("n", "<F2>", function()
  vim.lsp.buf.rename()
end, { desc = "Rename symbol" })

-- IR PRA DEFINICAO
map("n", "<F12>", function()
  vim.lsp.buf.definition()
end, { desc = "Go to definition" })
