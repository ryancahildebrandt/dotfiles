return {
	"mfussenegger/nvim-lint",
	optional = true,
	opts = {
		linters = {
			["markdownlint-cli2"] = {
				args = { "--config", "/home/ryan/.config/markdownlint-cli2/markdownlint-cli2.yaml", "--" },
			},
		},
	},
}
