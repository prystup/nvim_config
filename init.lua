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

-- Tab
-- vim.cmd("set tabstop=4")
-- vim.cmd("set expandtab")
