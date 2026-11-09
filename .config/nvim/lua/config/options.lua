local o = vim.opt		-- shorthand for "vim.opt"

-- Line numbers
o.number = true
o.relativenumber = true

-- Indentation
o.tabstop = 4			-- "Tab" character looks like 4 spaces
o.shiftwidth = 4		-- ">>" and "<<" indent/dedent by 4 spaces
o.expandtab = true		-- pressing "Tab" inserts spaces, not a "Tab" character
o.smartindent = true		-- auto-indent new lines based on syntax

-- Search
o.ignorecase = true		-- case-insensitive search by default
o.smartcase = true		-- case-sensitive search if an uppercase letter used

-- Appearance
o.termguicolors = true 		-- enable 24-bit RGB color
o.cursorline = true		-- highlight the cursor
o.signcolumn = "yes"		-- allows show the gutter (avoid layout shifts)
o.scrolloff = 8			-- keep 8 lines visible above/below cursor when scrolling

-- Behavior
o.splitright = true 		-- ":vsplit" opens new pane to the right
o.splitbelow = true 		-- ":split" opens new pane to below
o.wrap = true               -- don't wrap long lines
o.linebreak = true
o.clipboard = ""	-- sync Neovim's clipboard with the system clipboard

-- Theme
vim.cmd.colorscheme("mfbase")
