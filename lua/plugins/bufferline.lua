-- return {
-- 	"akinsho/bufferline.nvim",
-- 	version = "*",
-- 	dependencies = "nvim-tree/nvim-web-devicons",
-- 	config = function()
-- 		-- Enable termguicolors for better color support
-- 		vim.opt.termguicolors = true
--
-- 		-- Setup bufferline
-- 		require("bufferline").setup({})
-- 	end,
-- }

return {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    },
    opts = {},
}
