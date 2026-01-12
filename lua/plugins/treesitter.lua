-- return {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     config = function()
--         require("nvim-treesitter.install").compilers = { "zig" }
--         local config = require("nvim-treesitter.configs")
--         config.setup({
--             ensure_installed = { "c", "python", "rust", "javascript", "typescript" },
--             auto_install = true,
--             highlight = { enable = true },
--             indent = { enable = true },
--         })
--     end,
-- }

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
