local group = vim.api.nvim_create_augroup("arccha_config", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = group,
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})

-- Show the file tree on interactive startup without stealing editor focus.
vim.api.nvim_create_autocmd("UIEnter", {
  group = group,
  once = true,
  callback = function()
    vim.schedule(function()
      if vim.wo.diff or vim.bo.buftype ~= "" then
        return
      end
      require("neo-tree.command").execute({ action = "show", source = "filesystem", position = "left" })
    end)
  end,
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = group,
  callback = function()
    vim.notify("File changed on disk; buffer reloaded", vim.log.levels.WARN)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "help",
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    vim.keymap.set("n", "<CR>", "<C-]>", opts)
    vim.keymap.set("n", "<BS>", "<C-T>", opts)
  end,
})
