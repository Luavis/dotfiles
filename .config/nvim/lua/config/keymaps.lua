local map = LazyVim.safe_keymap_set

map("n", "<C-/>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root(), win = { position = "right" } })
end, { desc = "Terminal (Root Dir)" })
map("n", "<C-_>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root(), win = { position = "right" } })
end, { desc = "which_key_ignore" })

map("n", "<M-right>", "e")
map("n", "<M-left>", "b")
