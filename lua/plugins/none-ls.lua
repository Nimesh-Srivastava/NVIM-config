return {
    "nvimtools/none-ls.nvim",
    config = function()
        local none_ls = require("null-ls")

        none_ls.setup({
            sources = {
                none_ls.builtins.formatting.prettier,
                none_ls.builtins.formatting.stylua,
            },
        })

        vim.keymap.set("n", "<leader>gf", function()
            vim.lsp.buf.format({

                filter = function(client)
                    return client.name == "none-ls"
                end,
            })
        end, { desc = "Format buffer" })
    end,
}
