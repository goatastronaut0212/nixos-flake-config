-- Editor config
vim.cmd("syntax enable")
vim.opt.number = true
vim.opt.cursorline = true

-- Folding
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.cmd("set background=light")
vim.cmd("colorscheme strawberry-light")
