require("config.lazy")

vim.cmd("filetype plugin indent on")

vim.cmd("syntax enable")
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard:append("unnamedplus")

vim.cmd("colorscheme molokai")

-- Define a helper to preserve cursor position & search history
function Preserve(cmd)
	local winview = vim.fn.winsaveview()
	local search = vim.fn.getreg('/')
	vim.cmd(cmd)
	vim.fn.winrestview(winview)
	vim.fn.setreg('/', search)
end

-- Strip trailing spaces
vim.keymap.set("n", "_$", function()
	Preserve([[%s/\s\+$//e]])
end, { silent = true })

-- Re-indent the whole file
vim.keymap.set("n", "_=", function()
	Preserve("normal! gg=G")
end, { silent = true })
