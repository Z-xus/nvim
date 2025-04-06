return {
	{

		dir = "~/Projects/present.nvim",
		lazy = false,
		config = function()
			-- require("present")
			vim.keymap.set("n", "<leader>ps", function()
				require("present").start_presentation()
			end, { desc = "Start presentation", silent = true })
		end,
	},

	{
		dir = "~/Projects/dsa_io.nvim",
		lazy = false,
		config = function()
			require("dsa_io").setup()
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
