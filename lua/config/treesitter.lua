local treesitter = require("nvim-treesitter.configs")
local highlighted_languages = require("highlighted_languages")

local opts = {
	ensure_installed = highlighted_languages,
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

treesitter.setup(opts)
