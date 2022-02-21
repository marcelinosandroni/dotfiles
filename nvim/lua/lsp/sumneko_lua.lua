local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local settings = {
  Lua = {
    runtime = {
      version = 'LuaJIT',
      path = runtime_path
    },
    diagnostics = {
      globals = {
        "global",
        'vim',
        "use",
        "describe",
        "it",
        "assert",
        "before_each",
        "after_each"
      }
    },
    workspace = {
      checkThirdParty = false,
      library = vim.api.nvim_get_runtime_file("", true)
    },
    telemetry = {
      enable = false
    }
  }
}

local M = {}

M.setup = function(on_attach, capabilities)
  require('lspconfig').sumneko_lua.setup {
    on_attach = on_attach,
    settings = settings,
    capabilities = capabilities,
  }
end

return M
