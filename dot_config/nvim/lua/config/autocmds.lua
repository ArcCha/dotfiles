local group = vim.api.nvim_create_augroup("arccha_config", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = group,
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
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
