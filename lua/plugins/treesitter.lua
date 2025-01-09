return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.install").compilers = { "zig" , "clang", "gcc"}
		local config = require("nvim-treesitter.configs")
		config.setup({
            ensure_installed = {"c", "python", "rust"},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
