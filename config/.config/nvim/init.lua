vim.api.nvim_command("set runtimepath^=~/.vim runtimepath+=~/.vim/after")
vim.api.nvim_command("let &packpath = &runtimepath")
vim.api.nvim_command("source ~/.vimrc")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()
require("config")
