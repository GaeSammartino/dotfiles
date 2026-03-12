-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set the vimtex flavor
vim.g.tex_flavor = "latex"

-- Use Zathura as the PDF viewer
-- vim.g.vimtex_view_method = "zathura"

-- Use the 'simple' method for Wayland/Fedora compatibility
vim.g.vimtex_view_method = "zathura_simple"

-- Auto-open PDF on successful compilation
vim.g.vimtex_quickfix_mode = 0

-- Continuous compilation: it re-compiles every time you save (:w)
vim.g.vimtex_compiler_method = "latexmk"

vim.opt.wrap = true -- Line wrap
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.expandtab = true -- Use spaces instead of tabs (better for collaboration)
vim.opt.linebreak = true -- Don't break words in the middle of a wrap
vim.opt.relativenumber = true -- Helps you jump 5 lines up/down without counting
