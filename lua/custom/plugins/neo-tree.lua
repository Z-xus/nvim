-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "\\", ":Neotree reveal<CR>", { desc = "NeoTree reveal" } },
	},
	opts = {
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},

		close_if_last_window = true,
		filesystem = {
			hijack_netrw_behavior = "open_default",
			window = {
				-- position = "current",
				width = 30,
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
