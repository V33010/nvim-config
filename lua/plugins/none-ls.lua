-- return {
--
--     "nvimtools/none-ls.nvim",
-- 	config = function()
-- 		local null_ls = require("null-ls")
--
-- 		null_ls.setup({
-- 			sources = {
-- 				null_ls.builtins.formatting.stylua,
-- 				null_ls.builtins.formatting.black,
-- 				null_ls.builtins.formatting.isort,
-- 				-- null_ls.builtins.diagnostics.ruff,
--
-- 				-- null_ls.builtins.completion.spell,
-- 				-- require("none-ls.diagnostics.eslint"),
-- 			},
-- 		})
-- 		vim.keymap.set("n", "F", vim.lsp.buf.format, {})
-- 	end,
-- }
return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Keep diagnostics/linters here if needed in the future
                -- null_ls.builtins.diagnostics.ruff,
            },
        })

        -- Use Conform for manual formatting with the 'F' keymap
        vim.keymap.set("n", "F", function()
            require("conform").format({ lsp_fallback = true, async = true, timeout_ms = 5000 })
        end, { desc = "Format buffer with Conform" })
    end,
}
