local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- Visual
opt.cursorline = true
opt.scrolloff = 10
opt.signcolumn = "yes"
opt.list = true
opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
opt.termguicolors = true
opt.colorcolumn = ""

-- Behaviour
opt.swapfile = false
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitbelow = true
opt.splitright = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"
opt.hlsearch = true
opt.breakindent = true

-- Folding (nvim-ufo)
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
