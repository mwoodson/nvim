local options = {
  backup = false, -- creates a backup file
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hidden = true, -- required to keep multiple buffers and open multiple buffers
  ignorecase = true, -- ignore case in search patterns
  smartcase = true, -- smart case
  mouse = "", -- allow the mouse to be used in neovim
 -- mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 8, -- pop up menu height
  pumblend = 10, -- transparency of pop-up menu
  showmode = true, -- we don't need to see things like -- INSERT -- anymore
  smartindent = true, -- make indenting smarter again
  splitbelow = false, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = true, -- creates a swapfile
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 100, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  softtabstop = 2,                         -- insert/delete 4 spaces when tab/bs
  cursorline = false, -- highlight the current line

--  I didn't care for these
  number = true, -- set numbered lines
  relativenumber = false, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 4 {default 4}

  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 8, -- minimal number of columns to scroll horizontally.
  sidescrolloff = 8, -- minimal number of screen columns
  lazyredraw = false, -- Won't be redrawn while executing macros, register and other commands.
  termguicolors = true, -- Enables 24-bit RGB color in the TUI
  foldmethod = "indent",
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,
  fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "" }, -- make EndOfBuffer invisible
  wrapscan = true, -- wrap around the end of the file when you search for a pattern
  showmatch = true, -- reduce the need for %, the cursor will briefly jump to the matching brace when you insert one
  hlsearch = true, -- it will highlight all matches when you search for a pattern
  vb = true, -- visual bell instead of beeping
  so = 10, -- show 10 lines of context around the cursor when scrolling up or down
  incsearch = true, -- search as characters are entered

  -- foldcolumn = "1",
  -- shell = vim.fn.executable "pwsh" and "pwsh" or "powershell",
  -- shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  -- shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  -- shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  -- shellquote = "",
  -- shellxquote = "",
}

local global = {
  mkdp_auto_close = false, -- Don't Exit Preview When Switching Buffers
  mapleader = " ", -- Set mapleader to space
}

-- vim.opt.shortmess:append "Ac" -- Disable asking when editing file with swapfile.
-- vim.opt.whichwrap:append "<,>,[,],h,l"
vim.opt.iskeyword:append "-"

set_option(options)
set_global(global)
