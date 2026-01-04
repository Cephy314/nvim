return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			format_on_save = function(bufnr)
				local disable_ft = { "markdown" }
				if vim.tbl_contains(disable_ft, vim.bo[bufnr].filetype) then
					return
				end
				return { timeout_ms = 500, lsp_fallback = true }
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				json = { "biome" },
				jsonc = { "biome" },
			},
		},
	},
}
