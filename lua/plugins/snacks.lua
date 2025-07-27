return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = false },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = false },
        notifier = { enabled = true, timeout = 3000 },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        terminal = {
            win = {
                position = "float",
                width = 0.5,        -- 50% of screen width
                height = 0.5,       -- 50% of screen height
                row = 0.2,          -- Position from top
                col = 0.25,         -- Position from left
                border = "rounded", -- Optional border style
            },
        },
        words = { enabled = true },
        styles = {
            notification = {
                wo = { wrap = true }, -- Wrap notifications
            },
        },
    },
    keys = {
        {
            "<leader>tt",
            function()
                Snacks.terminal()
            end,
            desc = "Toggle Terminal",
        },
    },
}
