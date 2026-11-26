-- return {
--
-- 	{
-- 		"williamboman/mason.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			require("mason").setup()
-- 		end,
-- 	},
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		lazy = false,
-- 		-- version = "*",
--
-- 		-- commit = "c11f8c6", -- Officially after removal of automatic_enable
-- 		config = function()
-- 			require("mason-lspconfig").setup({
-- 				ensure_installed = { "lua_ls" },
-- 			})
--
-- 			require("mason-lspconfig").setup_handlers({
-- 				function(server_name)
-- 					require("lspconfig")[server_name].setup({})
-- 				end,
-- 			})
-- 		end,
-- 	},
--
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		lazy = false,
-- 		config = function()
-- 			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- 			local lspconfig = require("lspconfig")
--
-- 			-- Lua Language Server setup
-- 			lspconfig.lua_ls.setup({
-- 				-- capabilities = capabilities,
-- 				on_attach = function(client, bufnr)
-- 					-- Enable only for lua files
-- 					if vim.bo.filetype == "lua" then
-- 						-- Add your key mappings or other settings specific to lua_ls here
-- 					end
-- 				end,
-- 			})
--
-- 			-- Python Language Server setup
-- 			lspconfig.pyright.setup({
-- 				-- capabilities = vim.lsp.protocol.make_client_capabilities(),
--
-- 				on_attach = function(client, bufnr)
-- 					-- Enable only for Python files
-- 					if vim.bo.filetype == "python" then
-- 						-- Add key mappings or other settings specific to pyright here
-- 					end
-- 				end,
-- 			})
--
-- 			-- General LSP keybindings
-- 			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- 			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
-- 			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
-- 			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
-- 			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename variable" }) -- Add rename keymap here
-- 		end,
-- 	},
-- }
--
-------------------------
---
-- return {
--
-- 	{
-- 		"williamboman/mason.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			require("mason").setup()
-- 		end,
-- 	},
--
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			local mason_lspconfig = require("mason-lspconfig")
--
-- 			mason_lspconfig.setup({
-- 				ensure_installed = { "lua_ls", "pyright" },
-- 			})
--
-- 			-- -- ⚠️ Mason handlers still need old API (not yet migrated)
-- 			-- mason_lspconfig.setup_handlers({
-- 			-- 	function(server_name)
-- 			-- 		require("lspconfig")[server_name].setup({})
-- 			-- 	end,
-- 			-- })
-- 		end,
-- 	},
--
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		lazy = false,
-- 		config = function()
-- 			-- ✅ New native LSP API (Neovim 0.11+)
-- 			vim.lsp.config("lua_ls", {
-- 				settings = {
-- 					Lua = {
-- 						diagnostics = { globals = { "vim" } },
-- 					},
-- 				},
-- 			})
--
-- 			vim.lsp.config("pyright", {})
--
-- 			vim.lsp.enable({ "lua_ls", "pyright" })
--
-- 			-- ✅ Replaces on_attach: keymaps when any LSP attaches
-- 			vim.api.nvim_create_autocmd("LspAttach", {
-- 				desc = "LSP keybindings",
-- 				callback = function(event)
-- 					local opts = { buffer = event.buf }
--
-- 					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- 					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- 					vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
-- 					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
-- 					vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
-- 				end,
-- 			})
-- 		end,
-- 	},
-- }
--
-- -----------------------------------------------
--
-- return {
-- 	{
-- 		"williamboman/mason.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			require("mason").setup()
-- 		end,
-- 	},
--
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			local mason_lspconfig = require("mason-lspconfig")
--
-- 			mason_lspconfig.setup({
-- 				ensure_installed = { "lua_ls", "pyright", "rust_analyzer", "clangd" },
-- 			})
-- 			-- ✅ no setup_handlers() needed in Neovim 0.11+
-- 			-- Mason will handle installation only; configuration handled by new LSP API
-- 		end,
-- 	},
--
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		lazy = false,
-- 		config = function()
-- 			-- ✅ Define server configurations using new API
-- 			vim.lsp.config("lua_ls", {
-- 				settings = {
-- 					Lua = {
-- 						diagnostics = { globals = { "vim" } },
-- 					},
-- 				},
-- 			})
--
-- 			vim.lsp.config("pyright", {})
--
-- 			vim.lsp.config("rust_analyzer", {
-- 				settings = {
-- 					["rust-analyzer"] = {
-- 						checkOnSave = true,
-- 						cargo = {
-- 							allFeatures = true,
-- 						},
-- 						check = {
-- 							command = "clippy",
-- 						},
-- 					},
-- 				},
-- 			})
--
-- 			-- ✅ Enable both servers
-- 			vim.lsp.enable({ "lua_ls", "pyright", "rust_analyzer", "clangd" })
--
-- 			-- ✅ Modern LspAttach autocommand replaces on_attach
-- 			vim.api.nvim_create_autocmd("LspAttach", {
-- 				desc = "LSP keybindings",
-- 				callback = function(event)
-- 					local opts = { buffer = event.buf }
-- 					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- 					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- 					vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
-- 					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
-- 					vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
-- 					vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
-- 				end,
-- 			})
-- 		end,
-- 	},
-- }
--------------------------------------------------------
---

-- return {
-- 	{
-- 		"williamboman/mason.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			require("mason").setup()
-- 		end,
-- 	},
--
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			local mason_lspconfig = require("mason-lspconfig")
--
-- 			mason_lspconfig.setup({
-- 				-- ✅ Added "pylsp" here so Mason downloads it
-- 				ensure_installed = { "lua_ls", "pyright", "pylsp" },
-- 			})
-- 		end,
-- 	},
--
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		lazy = false,
-- 		config = function()
-- 			-- 1. Configure lua_ls
-- 			vim.lsp.config("lua_ls", {
-- 				settings = {
-- 					Lua = {
-- 						diagnostics = { globals = { "vim" } },
-- 					},
-- 				},
-- 			})
--
-- 			-- 2. Configure pyright (Static type checking & auto-completion)
-- 			vim.lsp.config("pyright", {})
--
-- 			-- 3. Configure pylsp (Linting/Style checking)
-- 			-- You can customize plugins here (e.g., flake8, black, etc.)
-- 			vim.lsp.config("pylsp", {
-- 				settings = {
-- 					pylsp = {
-- 						plugins = {
-- 							pycodestyle = { enabled = true },
-- 						},
-- 					},
-- 				},
-- 			})
--
-- 			-- ✅ Enable all servers
-- 			vim.lsp.enable({ "lua_ls", "pyright", "pylsp" })
--
-- 			-- LspAttach autocommand
-- 			vim.api.nvim_create_autocmd("LspAttach", {
-- 				desc = "LSP keybindings",
-- 				callback = function(event)
-- 					local opts = { buffer = event.buf }
-- 					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- 					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- 					vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
-- 					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
-- 					vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
-- 				end,
-- 			})
-- 		end,
-- 	},
-- }
return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    -- "rust_analyzer",
                    "clangd",
                },
            })
            -- Mason handles installation only.
            -- Configuration is done using the Neovim 0.11+ LSP API below.
        end,
    },

    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            -- Capabilities for nvim-cmp completion
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Lua
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            -- Python
            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })

            -- Rust
            vim.lsp.config("rust_analyzer", {
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = true,
                        cargo = {
                            allFeatures = false,
                        },
                        check = {
                            command = "clippy",
                        },
                    },
                },
            })

            -- C/C++
            vim.lsp.config("clangd", {
                capabilities = capabilities,
            })

            -- Enable all configured servers
            vim.lsp.enable({
                "lua_ls",
                "pyright",
                "rust_analyzer",
                "clangd",
            })

            -- LSP keymaps
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP keybindings",
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
                    vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
                end,
            })
        end,
    },
}
