return {
	"theprimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		-- harpoon functions
		vim.keymap.set("n", "<leader>ha", function()
			mark.add_file()
		end, { desc = "[h]arpoon [a]dd file" })
		vim.keymap.set("n", "<leader>hv", function()
			ui.toggle_quick_menu()
		end, { desc = "[h]arpoon [v]iew menu" })

		-- navigation
		vim.keymap.set("n", "<a-1>", function()
			ui.nav_file(1)
		end, { desc = "harpoon file 1" })
		vim.keymap.set("n", "<a-2>", function()
			ui.nav_file(2)
		end, { desc = "harpoon file 2" })
		vim.keymap.set("n", "<a-3>", function()
			ui.nav_file(3)
		end, { desc = "harpoon file 3" })
		vim.keymap.set("n", "<a-4>", function()
			ui.nav_file(4)
		end, { desc = "harpoon file 4" })

		-- next/prev
		vim.keymap.set("n", "<a-n>", function()
			ui.nav_next()
		end, { desc = "harpoon to next" })
		vim.keymap.set("n", "<a-p>", function()
			ui.nav_prev()
		end, { desc = "harpoon to previous" })
	end,
}
