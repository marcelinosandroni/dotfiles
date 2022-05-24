local M = {}
M.keymap = function(mode, target, source, customOptions)
   local options = { silent = true }
   if customOptions then
      options = vim.tbl_extend('force', options, customOptions)
   end
   if type(source) == 'function' then
      vim.api.nvim_set_keymap(mode, target, source(), options)
   end
   vim.api.nvim_set_keymap(mode, target, source, options)
end

local modes = {
   'normal',
   'insert',
   'visual',
}

M.map = {}

for _, mode in ipairs(modes) do
   M.map[mode] = function(...)
      M.keymap(mode:sub(1, 1), ...)
   end
end

M.map.lsp = function(bufnr, target, source, customOptions)
   if not customOptions or not next(customOptions) then
      customOptions = {}
   end
   vim.api.nvim_buf_set_keymap(bufnr, 'n', target, source, customOptions)
end

M.requireAllFilesInFolder = function()
   local files = tostring(io.popen('ls'):read('*a'))
   for item in string.gmatch(files, '([^ ]+)') do
      require(item)
   end
end

M.loadConfig = function(name)
   return string.format("require('plugins.%s')", name)
end

M.setup = function(name)
   return require(name).setup()
end

M.useWith = function(method)
   return function(use)
      return function(path, name, ...)
         local options = { path, config = method(name) }
         local args = ...
         if args and next(args) ~= nil then
            for key, value in pairs(args) do
               options[key] = value
            end
         end
         use(options)
      end
   end
end

M.useAndConfig = M.useWith(M.loadConfig)
M.useAndSetup = M.useWith(M.setup)

M.makeUse = function(use)
   return M.useAndConfig(use), M.useAndSetup(use), M.loadConfig, M.setup
end

return M
