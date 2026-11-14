-- return
-- {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--         vim.cmd.colorscheme "catppuccin"
--     end
-- }

-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "mocha", -- Select the flavor
-- 			transparent_background = false, -- Disable transparency
-- 			color_overrides = {
-- 				mocha = {
-- 					-- base = "#0d1117", -- Set the base color
-- 					base = "#000000", -- Set the base color
-- 					mantle = "#000000", -- Set the mantle color
-- 					crust = "#000000", -- Set the crust color
-- 				},
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("catppuccin") -- Apply the colorscheme
-- 	end,
-- }
--
--
-- return {
-- 	"Mofiqul/vscode.nvim",
-- 	name = "vscode",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "mocha", -- Select the flavor
-- 			transparent_background = false, -- Disable transparency
-- 			color_overrides = {
-- 				mocha = {
-- 					-- base = "#0d1117", -- Set the base color
-- 					base = "#000000", -- Set the base color
-- 					mantle = "#000000", -- Set the mantle color
-- 					crust = "#000000", -- Set the crust color
-- 				},
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("catppuccin") -- Apply the colorscheme
-- 	end,
-- }

-- return {
-- 	"Mofiqul/vscode.nvim",
-- 	name = "vscode",
-- 	priority = 1000,
-- 	config = function()
-- 		require("vscode").setup({
-- 			-- Enable transparent background
-- 			transparent = false,
--
-- 			-- Enable italic comment
-- 			italic_comments = true,
--
-- 			-- Disable nvim-tree background color
-- 			disable_nvimtree_bg = true,
-- 		})
--
-- 		vim.cmd.colorscheme("vscode")
-- 	end,
-- }

-- return {
-- 	"lunarvim/darkplus.nvim",
-- 	name = "darkplus",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("darkplus")
-- 	end,
-- }
--
-- return {
-- 	"tomasiser/vim-code-dark",
-- 	name = "codedark",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("codedark")
-- 	end,
-- }

-- return {
-- 	"tomasiser/vim-code-dark",
-- 	name = "codedark",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("codedark")
--
-- 		-- Make background slightly darker
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "#0d1117" })
-- 		-- Make line numbers background same color but keep text grey
-- 		vim.api.nvim_set_hl(0, "LineNr", { bg = "#0d1117", fg = "#5c6370" })
-- 		vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0d1117" })
-- 	end,
-- }
return {
	"tomasiser/vim-code-dark",
	name = "codedark",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("codedark")

		-- Using #050505 for a very deep, almost black look
		-- local bg_color = "#171717" -- vscode style
		local bg_color = "#070707"

		vim.api.nvim_set_hl(0, "Normal", { bg = bg_color })
		vim.api.nvim_set_hl(0, "LineNr", { bg = bg_color, fg = "#5c6370" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = bg_color })

		-- Optional: Match the end-of-buffer lines (the ~ characters)
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg_color })
	end,
}
