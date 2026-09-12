vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  error("lazy.nvim is missing; run: chezmoi apply ~/.local/share/nvim/lazy/lazy.nvim")
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
  checker = { enabled = false },
  change_detection = { notify = false },
  install = { colorscheme = { "habamax" } },
})
