vim.cmd([[highlight ExtraWhitespace ctermbg=red guibg=red]])

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local whtSpcGrp = augroup("ExtraWhiteSpace", { clear = true})

local excluded_filetypes = {"toggleterm", "alpha", 'TelescopePrompt', 'Trouble', 'help', 'TelescopeResults'}

autocmd("BufWinEnter", {
  callback = function()

    -- local data = {
    --   buf = vim.fn.expand("<abuf>"),
    --   file = vim.fn.expand("<afile>"),
    --   match = vim.fn.expand("<amatch>"),
    --   filetype = vim.fn.expand(vim.bo.filetype)
    -- }

    -- vim.schedule(function()
    --   print(vim.inspect(data))
    --   print(vim.bo.filetype)
    -- end)

    if vim.bo.buftype == 'terminal' then
      return
    end

    if vim.bo.buftype == 'nofile' then
      return
    end

    if vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then
      return
    end

    print("not returning....")
    vim.w.whitespace_match_number = vim.fn.matchadd('ExtraWhitespace', [[\s\+$]])
  end,
  group = whtSpcGrp,
})


autocmd("InsertEnter", {
  callback = function()
    ToggleWhitespaceMatch('i')
  end,
  group = whtSpcGrp,
})

autocmd("InsertLeave", {
  callback = function()
    ToggleWhitespaceMatch('n')
  end,
  group = whtSpcGrp,
})


function _G.ToggleWhitespaceMatch(mode)

  if vim.bo.buftype == 'terminal' then
    return
  end

  if vim.bo.buftype == 'nofile' then
    return
  end

  if vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then
    return
  end

  local pattern = ""
  if mode == "i" then
    pattern = [[\s\+\%#\@<!$]]
  else
    pattern = [[\s\+$]]
  end

  if vim.fn.exists(vim.w.whitespace_match_number) then
    vim.fn.matchdelete(vim.w.whitespace_match_number)
    vim.fn.matchadd('ExtraWhiteSpace', pattern, 10, vim.w.whitespace_match_number)
  else
    vim.w.whitespace_match_number = vim.fn.matchadd('ExtraWhiteSpace', pattern)
  end
end
