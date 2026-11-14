return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		-- Enable termguicolors for better color support
		vim.opt.termguicolors = true

		-- Setup bufferline
		require("bufferline").setup({})
	end,
}
