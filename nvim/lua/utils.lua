local map = function(mode, target, source, customOptions) 
  local options = { silent = true }
  if customOptions then
    options = vim.tbl_extend('force', options, customOptions)
  end
  if (type(source) == 'function') then
  vim.api.nvim_set_keymap(mode, target, source(), options)
  end
  vim.api.nvim_set_keymap(mode, target, source, options)
end

local modes = {
  'normal',
  'insert',
  'visual'
}

local M = {}
for _, mode in ipairs(modes) do
  M['' .. mode] = function(...)
    map(mode:sub(1, 1), ...) 
  end
end



M.requireAllFilesInFolder = function()
  local files = tostring(io.popen('ls'):read('*a'))
  for item in string.gmatch(files, '([^ ]+)') do
    require(item)
  end
end

return M
