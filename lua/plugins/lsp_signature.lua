-- return {
-- 	"ray-x/lsp_signature.nvim",
-- 	event = "VeryLazy",
-- 	opts = {},
-- 	config = function(_, opts)
-- 		require("lsp_signature").setup(opts)
-- 	end,
-- }

return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
        -- ✅ Minimal & Professional Settings
        bind = true, -- Mandatory
        handler_opts = {
            border = "rounded", -- Clean, modern border style
        },
        hint_enable = false, -- Disable the "panda" / virtual text hints (unprofessional)
        hint_prefix = "", -- Remove any hint prefixes
        floating_window = true, -- Keep the main popup
        floating_window_above_cur_line = true, -- Standard VS Code positioning
        fix_pos = false, -- Let it move if it overlaps text
        always_trigger = true, -- Show it automatically as you type

        -- ✅ Style the text inside the popup
        hi_parameter = "LspSignatureActiveParameter", -- Highlights the current param
        timer_interval = 200, -- Smooth response time
    },
    config = function(_, opts)
        require("lsp_signature").setup(opts)
    end,
}
