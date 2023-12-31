local fn = vim.fn

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General Settings", { clear = true })

autocmd("VimEnter", {
  desc = "Open NvimTree when it's a Directory",
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    -- change to the directory
    if directory then
      vim.cmd.cd(data.file)
      -- open the tree
      require("nvim-tree.api").tree.open()
    end
  end,
  group = general,
})

--[[
autocmd("User", {
  desc = "Disable Tabline And StatusLine in Alpha",
  pattern = "AlphaReady",
  callback = function()
    vim.opt.cmdheight = 0
    vim.opt.showtabline = 0
    vim.opt.laststatus = 0

    autocmd("BufUnload", {
      pattern = "<buffer>",
      callback = function()
        vim.opt.cmdheight = 1
        vim.opt.showtabline = 2
        vim.opt.laststatus = 3
      end,
    })
  end,
})

-- remove this if there's an issue
autocmd({ "BufReadPost", "BufNewFile" }, {
  desc = "Lazy load clipboard",
  once = true,
  callback = function()
    -- In wsl 2, just install xclip
    -- Ubuntu
    -- sudo apt install xclip
    -- Arch linux
    -- pacman -S xclip
    vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
  end,
  group = general,
})


autocmd("TermOpen", {
  desc = "Terminal Options",
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.cmd "startinsert!"
  end,
  group = general,
})
--]]

autocmd("BufReadPost", {
  desc = "Go To The Last Cursor Position",
  callback = function()
    if fn.line "'\"" > 1 and fn.line "'\"" <= fn.line "$" then
      vim.cmd 'normal! g`"'
    end
  end,
  group = general,
})

autocmd("TextYankPost", {
  desc = "Highlight when yanking",
  callback = function()
    require("vim.highlight").on_yank { higroup = "YankHighlight", timeout = 200 }
  end,
  group = general,
})

autocmd("BufEnter", {
  desc = "Disable New Line Comment",
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
  group = general,
})

autocmd("FileType", {
  desc = "Set shiftwidth to 4 in these filetypes",
  pattern = { "c", "cpp", "py", "java", "cs" },
  callback = function()
    vim.bo.shiftwidth = 4
  end,
  group = general,
})

--[[
autocmd("BufModifiedSet", {
  callback = function()
    vim.cmd "silent! w"
  end,
  group = general,
  desc = "Auto Save",
})
--]]

autocmd("FocusGained", {
  desc = "Update file when there are changes",
  callback = function()
    vim.cmd "checktime"
  end,
  group = general,
})

autocmd("VimResized", {
  desc = "Equalize Splits",
  callback = function()
    vim.cmd "wincmd ="
  end,
  group = general,
})

-- autocmd("ModeChanged", {
--   desc = "Highlighting matched words when searching",
--   callback = function()
--     if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
--       vim.opt.hlsearch = true
--     else
--       vim.opt.hlsearch = false
--     end
--   end,
--   group = general,
-- })

autocmd("FileType", {
  desc = "Enable Wrap in these filetypes",
  pattern = { "gitcommit", "markdown", "text", "log" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
  group = general,
})

autocmd("BufWritePost", {
  desc = "Automatically source vim file whenever you save it",
  pattern = "*.vim",
  callback = function()
    vim.cmd "source <afile>"
  end,
  group = general,
})
