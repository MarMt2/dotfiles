--Set tab to 4 spaces
vim.cmd("set expandtab")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

--Set colorscheme
vim.cmd.colorscheme "catppuccin"

--ignore lowercase when searching
vim.cmd("set ignorecase")
vim.cmd("set smartcase")

--set cursorline
vim.cmd("set cursorline")

--set signcolum to always be on
vim.cmd("set signcolumn=yes")

--set global clipboard
vim.cmd("set clipboard=unnamedplus")

--leave 8 lines of code above/below cursorline
vim.cmd("set scrolloff=8")

--Set relative line numbers
vim.wo.relativenumber = true
vim.wo.number = true
