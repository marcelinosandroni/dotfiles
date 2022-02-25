local ls = require("luasnip")
ls.snippets = {}
ls.cleanup()
ls.config.set_config({
	enable_autosnippets = false,
})
require("luasnip.loaders.from_vscode").load()
