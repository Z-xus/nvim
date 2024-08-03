return {
	"theprimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		vim.keymap.set("n", "<leader>ha", function()
			mark.add_file()
		end, { desc = "[h]arpoon [a]dd file" })
		vim.keymap.set("n", "<leader>hv", function()
			ui.toggle_quick_menu()
		end, { desc = "[h]arpoon [v]iew menu" })
		vim.keymap.set("n", "<a-h>", function()
			ui.nav_file(1)
		end, { desc = "harpoon file 1" })
		vim.keymap.set("n", "<a-j>", function()
			ui.nav_file(2)
		end, { desc = "harpoon file 2" })
		vim.keymap.set("n", "<a-k>", function()
			ui.nav_file(3)
		end, { desc = "harpoon file 3" })
		vim.keymap.set("n", "<a-l>", function()
			ui.nav_file(4)
		end, { desc = "harpoon file 4" })
		vim.keymap.set("n", "<a-n>", function()
			ui.nav_next()
		end, { desc = "harpoon to next" })
		vim.keymap.set("n", "<a-p>", function()
			ui.nav_prev()
		end, { desc = "harpoon to previous" })
	end,
}
