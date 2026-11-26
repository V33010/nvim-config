-- return {
--
-- 	{
-- 		"hrsh7th/cmp-nvim-lsp",
-- 	},
--
-- 	{
-- 		"L3MON4D3/LuaSnip",
-- 		dependencies = {
-- 			"saadparwaiz1/cmp_luasnip",
-- 			"rafamadriz/friendly-snippets",
-- 		},
-- 	},
-- 	{
-- 		"hrsh7th/nvim-cmp",
-- 		config = function()
-- 			local cmp = require("cmp")
-- 			require("luasnip.loaders.from_vscode").lazy_load()
--
-- 			cmp.setup({
-- 				snippet = {
-- 					-- REQUIRED - you must specify a snippet engine
-- 					expand = function(args)
-- 						require("luasnip").lsp_expand(args.body)
-- 					end,
-- 				},
-- 				window = {
-- 					completion = cmp.config.window.bordered(),
-- 					documentation = cmp.config.window.bordered(),
-- 				},
-- 				mapping = cmp.mapping.preset.insert({
-- 					["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 					["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 					["<C-Space>"] = cmp.mapping.complete(),
-- 					["<C-e>"] = cmp.mapping.abort(),
-- 					["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 				}),
-- 				sources = cmp.config.sources({
-- 					{ name = "nvim_lsp" },
-- 					{ name = "luasnip" }, -- For luasnip users.
-- 					-- { name = 'ultisnips' }, -- For ultisnips users.
-- 					-- { name = 'snippy' }, -- For snippy users.
-- 				}, {
-- 					{ name = "buffer" },
-- 				}),
-- 			})
-- 		end,
-- 	},
-- }

return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            -- Load friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Custom snippet for Python "print"
            luasnip.add_snippets("python", {
                luasnip.snippet("print", {
                    luasnip.text_node("print("),
                    luasnip.insert_node(1),
                    luasnip.text_node(")"),
                }),
            })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                -- window = {
                --     completion = cmp.config.window.bordered(),
                --     documentation = cmp.config.window.bordered(),
                -- },
                --
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = vim.tbl_extend("force", cmp.config.window.bordered(), {
                        max_width = 50,
                        max_height = 20,
                    }),
                },
                formatting = {
                    format = function(_, vim_item)
                        local max_abbr = 28
                        local max_menu = 24
                        if vim.fn.strchars(vim_item.abbr) > max_abbr then
                            vim_item.abbr = vim.fn.strcharpart(vim_item.abbr, 0, max_abbr - 1) .. "…"
                        end
                        if vim_item.menu and vim.fn.strchars(vim_item.menu) > max_menu then
                            vim_item.menu = vim.fn.strcharpart(vim_item.menu, 0, max_menu - 1) .. "…"
                        end
                        return vim_item
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),

                    -- Super-Tab mapping: Handles both menu selection AND snippet jumping
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }), -- "s" mode is required for jumping out of placeholders

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                -- AFTER (Flattened)
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer", keyword_length = 3 },
                    { name = "path" },
                }),
                -- sources = cmp.config.sources({
                --     { name = "nvim_lsp" },
                --     { name = "luasnip" },
                -- }, {
                --     { name = "buffer" },
                --     { name = "path" },
                -- }),
            })
        end,
    },
}
