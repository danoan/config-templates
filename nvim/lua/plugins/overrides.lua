-- This file overrides options of default plugins in lazy.nvim
return {
	{
		"neovim/nvim-lspconfig",
		init = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			keys[#keys + 1] = { "K", false }
			keys[#keys + 1] = { "oo", vim.lsp.buf.hover }
		end,
	},
}
