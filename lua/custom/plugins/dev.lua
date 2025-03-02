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
		-- TODO: 1. Infinite output hangs the buffer
		-- TODO: 2. Some vim like navigation for selection and copy
		-- TODO: 3. Transfer to tab or something to make bigger or allow resize
		"Z-xus/float.nvim",
		lazy = false,
		opts = {
			keybind = "<leader>t",
		},
	},
}
