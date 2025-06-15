-- Undotree Commands Reference:
-- :UndotreeToggle       - Opens/closes the Undotree window, showing the undo history visually
-- :UndotreeShow         - Opens the Undotree window if it’s not already open
-- :UndotreeHide         - Closes the Undotree window if it’s open
-- :UndotreeFocus        - Focuses cursor on Undotree window without toggling

return {
  'mbbill/undotree',
  config = function()
    -- Setup persistent undo directory
    local undodir = vim.fn.expand("~/.undodir")
    if vim.fn.isdirectory(undodir) == 0 then
      local ok, err = pcall(vim.fn.mkdir, undodir, "p", tonumber("0700", 8))
      if not ok then
        vim.notify("Failed to create undodir: " .. err, vim.log.levels.ERROR)
      end
    end

    vim.opt.undodir = undodir
    vim.opt.undofile = true

    -- Keymap to toggle Undotree and resize its window
    vim.keymap.set("n", "<leader>u", function()
      vim.cmd("UndotreeToggle")
      -- After toggle, resize the undotree window if it's open
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), "filetype") == "undotree" then
          vim.api.nvim_win_set_width(win, 30)
        end
      end
    end, { desc = "Toggle Undotree and resize" })
  end,
}

