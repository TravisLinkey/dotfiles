local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "elixir", "typescript", "typescriptreact" },
  callback = function()
    vim.opt_local.foldmethod = "indent"
    vim.opt_local.foldlevel = 0
  end,
})

local function markdown_gx_open()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1

  -- Open inline markdown link if cursor is anywhere inside it: [text](url)
  for s, e, url in line:gmatch("()%%%b[]%((.-)%)()") do
    if col >= s and col <= e then
      url = url:gsub("^<", ""):gsub(">$", "")
      return vim.ui.open(url)
    end
  end

  -- Fallback: bare URL/file under cursor
  local cfile = vim.fn.expand("<cfile>")
  if cfile and cfile ~= "" then
    return vim.ui.open(cfile)
  end

  vim.notify("No URL found", vim.log.levels.WARN)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(ev)
    -- schedule so we win even if something maps gx later in the same FileType chain
    vim.schedule(function()
      vim.keymap.set("n", "gx", markdown_gx_open, {
        buffer = ev.buf,
        silent = true,
        desc = "Open markdown link under cursor",
      })
    end)
  end,
})


require("vim-options")
require("functions")
require("lazy").setup("plugins")

