-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Defold filetype

vim.cmd("autocmd BufNewFile,BufRead *.script set filetype=lua")
vim.cmd("autocmd BufNewFile,BufRead *.gui_script set filetype=lua")
vim.cmd("autocmd BufNewFile,BufRead *.render_script set filetype=lua")
vim.cmd("autocmd BufNewFile,BufRead *.luac set filetype=lua")

vim.cmd("autocmd BufNewFile,BufRead *.collection set filetype=proto")
vim.cmd("autocmd BufNewFile,BufRead *.atlas set filetype=proto")
vim.cmd("autocmd BufNewFile,BufRead *.gui set filetype=proto")
vim.cmd("autocmd BufNewFile,BufRead *.project set filetype=proto")

vim.keymap.set("n", "<space>fs", ":Telescope file_browser<CR>")

-- Tab
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
