# Neovim Configuration

My personal Neovim configuration, written in Lua and managed with
[lazy.nvim](https://github.com/folke/lazy.nvim).

## Overview

This repository contains my Neovim configuration, including editor
options, keymaps, plugin specifications, and a lockfile for reproducible
plugin versions.

The configuration is organized around:

-   `init.lua` --- entry point; bootstraps lazy.nvim and loads the
    configuration modules.
-   `lua/vim-options.lua` --- editor options and general keymaps.
-   `lua/plugins/` --- plugin specifications loaded automatically by
    lazy.nvim.
-   `lazy-lock.json` --- pinned plugin revisions.
-   `.luarc.json` --- Lua language-server configuration.

## Requirements

-   [Neovim](https://neovim.io/)
-   Git
-   A working terminal environment

Some plugins and language tooling may require additional external
programs depending on which features you use. Language servers,
formatters, and related tools can be installed separately; Mason is
included in this configuration.

### Windows clipboard from WSL

The current options file configures `win32yank.exe` for clipboard
integration. This is intended for a WSL environment where
`win32yank.exe` is available on `PATH`.

If you use this configuration outside WSL, adjust or remove that
clipboard configuration in `lua/vim-options.lua` to match your system.

## Installation

Back up any existing Neovim configuration before replacing it.

``` bash
git clone git@github.com:V33010/nvim-config.git ~/.config/nvim
```

Then start Neovim:

``` bash
nvim
```

The `init.lua` file bootstraps lazy.nvim if it is not already installed.
lazy.nvim then installs the configured plugins.

To synchronize plugins manually from inside Neovim:

``` vim
:Lazy sync
```

## Configuration

### Editor options

The current `lua/vim-options.lua` includes:

-   Automatic directory changes to the directory of the active file
    (`autochdir`).
-   Smart and automatic indentation.
-   Four-space indentation using spaces.
-   System clipboard integration through `unnamedplus` and
    `win32yank.exe`.
-   Relative and absolute line numbers.
-   Seven lines of scroll offset.
-   True-color terminal support.
-   Swap files disabled.
-   Persistent undo enabled, with undo data stored in Neovim's data
    directory.
-   ShaDa persistence disabled.

### Keymaps

The leader key is set to **Space**.

  Mode     Key            Action
  -------- -------------- -------------------------------------
  Normal   `<leader>q`    Quit
  Normal   `<leader>w`    Write and quit
  Normal   `<leader>s`    Save file
  Insert   `<C-s>`        Save file and return to Normal mode
  Visual   `>`            Indent right and keep selection
  Visual   `<`            Indent left and keep selection
  Normal   `<leader>ft`   Open an embedded terminal
  Normal   `<leader>sh`   Create a horizontal split
  Normal   `<leader>sv`   Create a vertical split
  Normal   `<leader>sc`   Close the current split
  Normal   `<leader>+`    Increase split height
  Normal   `<leader>-`    Decrease split height
  Normal   `<leader><`    Decrease split width
  Normal   `<leader>>`    Increase split width
  Normal   `<C-h>`        Move to the left window
  Normal   `<C-j>`        Move to the lower window
  Normal   `<C-k>`        Move to the upper window
  Normal   `<C-l>`        Move to the right window
  Insert   `<C-l>`        Move cursor one character right
  Visual   `<leader>p`    Wrap selected text in parentheses

## Plugins

Plugins are managed by lazy.nvim. The following names are recorded in
`lazy-lock.json`:

### Completion and snippets

-   [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
-   [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
-   [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
-   [cmp-path](https://github.com/hrsh7th/cmp-path)
-   [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
-   [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
-   [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

### LSP, formatting, and language support

-   [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
-   [mason.nvim](https://github.com/mason-org/mason.nvim)
-   [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)
-   [conform.nvim](https://github.com/stevearc/conform.nvim)
-   [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
-   [rustaceanvim](https://github.com/mrcjkb/rustaceanvim)
-   [crates.nvim](https://github.com/Saecki/crates.nvim)

### Navigation and editing

-   [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
-   [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)
-   [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
-   [oil.nvim](https://github.com/stevearc/oil.nvim)
-   [flash.nvim](https://github.com/folke/flash.nvim)
-   [autoclose.nvim](https://github.com/m4xshen/autoclose.nvim)
-   [mini.nvim](https://github.com/echasnovski/mini.nvim)
-   [typr](https://github.com/nvim-typr/typr)
-   [which-key.nvim](https://github.com/folke/which-key.nvim)

### UI and appearance

-   [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
-   [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
-   [codedark](https://github.com/tomasiser/vim-code-dark)
-   [dressing.nvim](https://github.com/stevearc/dressing.nvim)
-   [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
-   [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
-   [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
-   [snacks.nvim](https://github.com/folke/snacks.nvim)
-   [volt](https://github.com/vim-volt/volt)

### Git, diagnostics, and utilities

-   [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
-   [vim-fugitive](https://github.com/tpope/vim-fugitive)
-   [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
-   [trouble.nvim](https://github.com/folke/trouble.nvim)
-   [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)
-   [presence.nvim](https://github.com/andweeb/presence.nvim)
-   [vim-wakatime](https://github.com/wakatime/vim-wakatime)
-   [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
-   [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
-   [nui.nvim](https://github.com/MunifTanjim/nui.nvim)

The lockfile records exact revisions. It is the source of truth for the
versions pinned by this repository; the list above identifies plugins
present in that lockfile and does not imply that every plugin is
configured or enabled in every workflow.

## Updating plugins

Open Neovim and run:

``` vim
:Lazy
```

Useful lazy.nvim commands:

  Command          Purpose
  ---------------- ------------------------------------
  `:Lazy`          Open the plugin manager
  `:Lazy sync`     Install, update, and clean plugins
  `:Lazy update`   Update plugins
  `:Lazy clean`    Remove unused plugins
  `:checkhealth`   Check Neovim and provider health

After changing plugin versions, commit the updated `lazy-lock.json` so
other installations can reproduce the same plugin revisions.

## Customization

-   Change editor options and general keymaps in `lua/vim-options.lua`.
-   Add or modify plugin specifications in `lua/plugins/`.
-   Keep `lazy-lock.json` under version control.

## License

No license has been specified for this repository. Unless a license is
added, the repository's contents are not explicitly offered for reuse
under an open-source license.
