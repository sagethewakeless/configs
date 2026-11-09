vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if os.getenv("SCROLL_MODE") then
  
  local function copy_to_clipboard(text)
    local tmpfile = os.tmpname()
    local f = io.open(tmpfile, "w")
    if f then
      f:write(text)
      f:close()
      os.execute("wl-copy < " .. tmpfile .. " &")
    end
  end

  vim.keymap.set("n", "q",        "<Cmd>qa!<CR>")
  vim.keymap.set("x", "q",        "<Cmd>qa!<CR>")

  vim.keymap.set("n", "yy", function()
    copy_to_clipboard(vim.fn.getline(".") .. "\n")
    vim.cmd("qa!")
  end)

  vim.keymap.set("n", "<leader>s", function()
    copy_to_clipboard(vim.fn.getline(".") .. "\n")
    vim.cmd("qa!")
  end)

  vim.keymap.set("x", "y", function()
    vim.cmd('normal! "ay')
    copy_to_clipboard(vim.fn.getreg("a"))
    vim.cmd("qa!")
  end)

  vim.keymap.set("x", "<leader>s", function()
    vim.cmd('normal! "ay')
    copy_to_clipboard(vim.fn.getreg("a"))
    vim.cmd("qa!")
  end)

  vim.cmd("set laststatus=0 nonu nornu signcolumn=no cursorline cmdheight=0")
  vim.cmd("$")
  return
end

require("config.options")
require("config.keymaps")
require("config.lazy")
