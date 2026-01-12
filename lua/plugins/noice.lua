return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
        },
        cmdline = {
            enabled = true,
            view = "cmdline_popup",
        },
        messages = {
            enabled = true,
        },
        notify = {
            enabled = true,
            view = "notify",
        },
        routes = {
            {
                view = "notify",
                filter = { event = "msg_showmode" },
            },
        },
    },
    config = function(_, opts)
        require("noice").setup(opts)
        -- Integrate with Snacks notifier
        vim.notify = function(msg, level, notify_opts)
            require("snacks").notifier.notify(msg, level, notify_opts)
        end
    end,
}
