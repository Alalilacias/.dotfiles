return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost" }, -- Lazy load on read/write
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			bash = { "shellcheck" },
			c = { "cpplint" },
			c_sharp = { "dotnet_format" },
			cmake = { "cmakelint" },
			cpp = { "cpplint" },
			java = { "checkstyle" },
			json = { "jsonlint" },
			json5 = { "jsonlint" },
			jsonc = { "jsonlint" },
			kotlin = { "ktlint" },
			lua = { "luacheck" },
			markdown = { "markdownlint" },
			markdown_inline = { "markdownlint" },
			nix = { "nix-linter" },
			rust = { "clippy" },
			sql = { "sqlfluff" },
			yaml = { "yamllint" },
			dockerfile = { "hadolint" },
		}

		-- Auto-run linting when opening or saving a file
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
