-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Center cursor after half-page scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half-page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half-page up and center" })

-- Toggle LSP inlay hints
vim.keymap.set("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

-- Toggle diagnostic virtual text
vim.keymap.set("n", "<leader>td", function()
  local vt = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = not vt })
end, { desc = "Toggle diagnostic virtual text" })

-- Toggle diagnostic virtual text and underlines
vim.keymap.set("n", "<leader>tf", function()
  local config = vim.diagnostic.config()
  local new_val = not (config.virtual_text or config.underline)
  vim.diagnostic.config({ virtual_text = new_val, underline = new_val })
end, { desc = "Toggle diagnostic virtual text and underlines" })

-- Toggle statusline
vim.keymap.set("n", "<leader>ts", function()
  if vim.o.laststatus == 0 then
    vim.o.laststatus = vim.g._saved_laststatus or 3
  else
    vim.g._saved_laststatus = vim.o.laststatus
    vim.o.laststatus = 0
  end
end, { desc = "Toggle statusline" })

-- Override <leader>uD to also toggle statusline
vim.keymap.set("n", "<leader>uD", function()
  Snacks.toggle.get("dim"):toggle()
  if Snacks.dim.enabled then
    vim.g._saved_laststatus = vim.o.laststatus
    vim.o.laststatus = 0
  else
    vim.o.laststatus = vim.g._saved_laststatus or 3
  end
end, { desc = "Toggle Dim + Statusline" })

