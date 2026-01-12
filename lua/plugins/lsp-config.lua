return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                PATH = "prepend",
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pylsp", "rust_analyzer" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" },
        config = function()
            -- Configure diagnostics to show error messages
            vim.diagnostic.config({
                virtual_text = true,  -- Show error messages inline
                signs = true,         -- Show signs in the gutter
                underline = true,     -- Underline errors
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",  -- Show source of diagnostic
                    header = "",
                    prefix = "",
                },
            })

            local capabilities = require("blink.cmp").get_lsp_capabilities()
            vim.lsp.config.lua_ls = {
                capabilities = capabilities,
            }
            vim.lsp.config.pylsp = {
                capabilities = capabilities,
            }
            vim.lsp.config.rust_analyzer = {
                capabilities = capabilities,
            }

            -- vim.api.nvim_create_autocmd("LspAttach", {
            --     callback = function(args)
            --         local client = vim.lsp.get_client_by_id(args.data.client_id)
            --         if not client then
            --             return
            --         end
            --         if client:supports_method("textDocument/formatting") then
            --             vim.api.nvim_create_autocmd("BufWritePre", {
            --                 buffer = args.buf,
            --                 callback = function()
            --                     vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            --                 end,
            --             })
            --         end
            --     end,
            -- })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then
                        return
                    end
                    -- Disable LSP formatting, use conform.nvim instead
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            -- Add keymap to show diagnostics in floating window
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
        end,
    },
}
