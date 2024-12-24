return {
	{

		dir = "~/Projects/present.nvim",
		lazy = false,
		config = function()
			require("present")
		end,
	},
	{
		-- dir = "~/Personal/float.nvim",
		"Z-xus/float.nvim",
		lazy = false,
		opts = {
			keybind = "<leader>tt",
		},
	},
}
