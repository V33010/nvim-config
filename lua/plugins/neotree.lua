-- IMPORTANT!!
-- navigate to the parent folder using backspace in neotree UI
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal right<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
-- return {
-- 	"nvim-neo-tree/neo-tree.nvim",
-- 	branch = "v3.x",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"nvim-tree/nvim-web-devicons",
-- 		"MunifTanjim/nui.nvim",
-- 	},
-- 	config = function()
-- 		require("neo-tree").setup({
-- 			filesystem = {
-- 				follow_current_file = {
-- 					enabled = true, -- Do not auto-follow the current file
-- 				},
-- 				hijack_netrw_behavior = "open_default", -- Default behavior
-- 				cwd_target = "global", -- Use Neovim's global working directory
-- 			},
-- 		})
--
-- 		-- Keybinding to open Neo-tree with the initial working directory
-- 		vim.keymap.set("n", "<leader>e", function()
-- 			-- Open Neo-tree using the original working directory
-- 			vim.cmd("Neotree filesystem reveal right dir=" .. vim.fn.getcwd(-1, -1))
-- 		end, { desc = "Open Neo-tree in initial working directory" })
-- 	end,
-- }
--
-- return
--     {
--         "nvim-neo-tree/neo-tree.nvim",
--         branch = "v3.x",
--         dependencies = {
--             "nvim-lua/plenary.nvim",
--             "nvim-tree/nvim-web-devicons",
--             "MunifTanjim/nui.nvim",
--         },
--         config = function()
--             vim.keymap.set("n", '<leader>e', ":Neotree filesystem reveal right<CR>")
--         end
--     }
