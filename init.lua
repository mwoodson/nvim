require "core"
require "lazy-plugin-loader"

-- colorscheme and theme
-- local name = "moonfly"
local name = "dracula"

-- Set the theme
vim.cmd.colorscheme(name)
vim.cmd("highlight Normal cterm=NONE ctermbg=233 gui=NONE guibg=#121212")
