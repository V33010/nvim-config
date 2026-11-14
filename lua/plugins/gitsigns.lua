return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
}
-- return {
-- 	"lewis6991/gitsigns.nvim",
-- 	config = function()
-- 		-- Setup gitsigns.nvim
-- 		require("gitsigns").setup()
-- 	end,
-- }
