-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Exit insert mode by typing 'jk' quickly
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Move by visual lines (essential for long LaTeX paragraphs)
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Quick save with Ctrl+s (using your new Caps-Lock-as-Ctrl!)
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><ESC>", { desc = "Save file" })
