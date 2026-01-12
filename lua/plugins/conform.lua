return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            c = { "clang_format" },
            cpp = { "clang_format" },
            rust = { "rustfmt" },
            python = { "black" },
            typescript = { "prettier" },
            javascript = { "prettier" },
            -- Add more languages as needed
        },
        format_on_save = {
            timeout_ms = 3000,
            lsp_fallback = true,
        },
        formatters = {
            clang_format = {
                prepend_args = {
                    "--style={BasedOnStyle: llvm, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
                },
            },
            stylua = {
                prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
            },
        },
    },
}
