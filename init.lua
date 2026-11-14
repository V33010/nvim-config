vim.g.mapleader = " "
vim.g.maplocalleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- local opts = {}

require("vim-options")
require("lazy").setup("plugins")
-- vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })
-- vim.keymap.set("v", "<leader>i", "=")
-- vim.g.clipboard = {
-- 	name = "win32yank",
-- 	copy = {
-- 		["+"] = "win32yank.exe -i --crlf",
-- 		["*"] = "win32yank.exe -i --crlf",
-- 	},
-- 	paste = {
-- 		["+"] = "win32yank.exe -o --lf",
-- 		["*"] = "win32yank.exe -o --lf",
-- 	},
-- 	cache_enabled = 0,
-- }
