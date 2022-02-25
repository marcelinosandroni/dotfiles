-- verify plugin manager install
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local installPacker = nil
if fn.empty(fn.glob(install_path)) > 0 then
	installPacker = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

local bootstrap = function()
	if installPacker then
		require("packer").sync()
	end
end

-- auto install when plugin list is changed
vim.cmd([[
  augroup packer_user_config
   autocmd!
    autocmd BufWritePost */lua/plugins/init.lua source <afile> | PackerSync
  augroup end
]])

return bootstrap
