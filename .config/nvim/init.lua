-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
})

local wk = require("which-key")
wk.add({
  { "<leader>o", group = "opencode", icon = "" },
})
