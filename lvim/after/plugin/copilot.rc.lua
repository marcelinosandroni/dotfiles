vim.g.copilot_node_command = "$HOME/.asdf/installs/nodejs/16.18.1/bin/node"
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- Key maps
vim.api.nvim_set_keymap("n", "<leader>cp", ":Copilot<CR>", { noremap = true, silent = true })
vim.cmd [[imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")]]
