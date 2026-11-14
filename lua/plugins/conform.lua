return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                rust = { "rustfmt" },
                c = { "clang_format" },
                cpp = { "clang_format" },
            },
            format_on_save = {
                timeout_ms = 5000,
            },
            -- Override default arguments for specific formatters
            formatters = {
                stylua = {
                    prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
                },
                clang_format = {
                    prepend_args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4}" },
                },
            },
        })
    end,
}
