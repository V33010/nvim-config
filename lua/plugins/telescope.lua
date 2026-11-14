return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-M-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}

-- 	{
-- 		"nvim-telescope/telescope.nvim",
-- 		tag = "0.1.8",
-- 		dependencies = { "nvim-lua/plenary.nvim" },
-- 		config = function()
-- 			local telescope = require("telescope")
-- 			local builtin = require("telescope.builtin")
--
-- 			telescope.setup({
-- 				defaults = {
-- 					file_ignore_patterns = { ".git/" }, -- Ignore .git directories
-- 					mappings = {
-- 						i = {
-- 							["<C-u>"] = false, -- Disable clearing
-- 							["<C-d>"] = false, -- Disable delete
-- 						},
-- 					},
-- 				},
-- 				pickers = {
-- 					find_files = {
-- 						hidden = true, -- Include hidden files in the search
-- 						no_ignore = true, -- Do not ignore files based on .gitignore
-- 						follow = true, -- Follow symlinks
-- 					},
-- 				},
-- 			})
--
-- 			-- Keymaps for find_files and live_grep
-- 			vim.keymap.set("n", "<C-M-p>", builtin.find_files, {})
-- 			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
-- 		end,
-- 	},
-- 	{
-- 		"nvim-telescope/telescope-ui-select.nvim",
-- 		config = function()
-- 			require("telescope").setup({
-- 				extensions = {
-- 					["ui-select"] = {
-- 						require("telescope.themes").get_dropdown({
-- 							-- additional options
-- 						}),
-- 					},
-- 				},
-- 			})
-- 			require("telescope").load_extension("ui-select")
-- 		end,
-- 	},
-- }
