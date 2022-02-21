local path = function (address)
  return '~/.config/nvim/lua/' .. address
end

local command = function (name, cmd)
  vim.api.nvim_add_user_command(name, cmd, {})
end

vim.api.nvim_add_user_command('Plugin', 'e ' .. path('plugins/init.lua'), {})
command('Reload', ':source $MYVIMRC')

