vim.opt.autochdir = true
vim.opt.smartindent = true
vim.opt.autoindent = true
-- vim.cmd("set expandtab")
-- vim.cmd("set tabstop=4")
-- vim.cmd("set softtabstop=4")
-- vim.cmd("set shiftwidth=4")
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.o.timeoutlen = 1000

vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>w", ":wq<CR>", { noremap = true, silent = true })

-- Remap `>` in visual mode to indent and stay in visual mode
-- vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })

vim.opt.termguicolors = true
vim.o.shada = ""
vim.opt.scrolloff = 7
vim.opt.relativenumber = true
vim.opt.number = true

vim.keymap.set("n", "<leader>s", ":w<CR>", { desc = "Save file" })

vim.keymap.set("i", "<C-s>", function() -- save file in insert mode
    vim.cmd("write")
    vim.cmd("stopinsert")
end, { desc = "Save file and exit insert mode" })

-- Keymap to open the terminal in Neovim
vim.keymap.set("n", "<leader>ft", ":term<CR>i", {
    desc = "Open a terminal window inside Neovim", -- Description of the keybinding
})

-- Keymaps for creating splits
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Horizontal Split" })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical Split" })

-- Close the current split
vim.keymap.set("n", "<leader>sc", ":close<CR>", { desc = "Close Split" })

-- Resize splits
vim.keymap.set("n", "<leader>+", ":resize +5<CR>", { desc = "Increase Height" })
vim.keymap.set("n", "<leader>-", ":resize -5<CR>", { desc = "Decrease Height" })
vim.keymap.set("n", "<leader><", ":vertical resize -5<CR>", { desc = "Decrease Width" })
vim.keymap.set("n", "<leader>>", ":vertical resize +5<CR>", { desc = "Increase Width" })
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- disable swapfile
vim.opt.swapfile = false

-- enable undofile
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true

-- move cursor to right in insert mode
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })

-- use windows clipbloard
vim.g.clipboard = {
    name = "win32yank",
    copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
}

-- Wrap selected text in parentheses in visual mode
-- vim.keymap.set("v", "<leader>p", 'c(<C-r>")<Esc>h', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>p", 'c(<C-r>")<Esc>', { noremap = true, silent = true })
