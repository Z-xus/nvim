vim.g.mapleader = " "
vim.g.maplocalleader = ";"
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
-- vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 1000 -- 250
vim.opt.inccommand = "split"
vim.o.termguicolors = true
vim.opt.colorcolumn = nil

-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Fold
-- vim.wo.foldmethod = "indent"
vim.wo.foldenable = false

-- Delete file content
vim.api.nvim_set_keymap("n", "df", 'gg"_dG', { noremap = true, silent = true })

-- Save file
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- FIXME: :w = :W and :q = :Q -- Laptop key delay
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})

vim.api.nvim_set_keymap("n", "<leader>m", "<cmd>Mason<CR>", { noremap = true, silent = true })

-- Open split

-- Copy line to system clipboard
-- Yank to the system clipboard ("+y)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { noremap = true, silent = true })

-- -- Yank line to system clipboard
-- vim.keymap.set("n", "<leader>Y", [["+Y]], { noremap = true, silent = true })

-- Delete line to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { noremap = true, silent = true })

-- Paste on new line below
vim.keymap.set("n", "<C-p>", [[o<ESC>"+p]], { noremap = true, silent = true })

-- Yank full file to system clipboard
vim.keymap.set("n", "yf", [[gg"+yG<C-o>zz]], { noremap = true, silent = true })

-- Paste from system clipboard after the cursor
vim.keymap.set("n", "<leader>p", [["+p]], { noremap = true, silent = true })

-- Move line
vim.keymap.set({ "n", "v" }, "<A-j>", [[:m '>+1<CR>gv=gv]])
vim.keymap.set({ "n", "v" }, "<A-k>", [[:m '>-2<CR>gv=gv]])

vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>", { noremap = true, silent = true })

-- Change Directory
vim.keymap.set("n", "<A-c>", ":cd %:p:h<CR>:pwd<CR>", { noremap = true, silent = false })

-- Splits
-- <leader>sf <C-v> Opens file in :vs from the fuzzy selector
-- <leader>sf <C-x> Opens file in :s from the fuzzy selector

if vim.g.neovide then
	vim.opt.guifont = "Maple Mono NF:h10"
	vim.g.neovide_cursor_vfx_mode = "sonicboom"
	vim.g.neovide_cursor_trail_size = 0.7
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_cursor_vfx_frame_rate = 60
end

vim.cmd([[
function! FoldText()
	let line = getline(v:foldstart)
	let numOfLines = v:foldend - v:foldstart
	let fillCount = winwidth('%') - len(line) - len(numOfLines) - 14
	return line . '  ' . repeat('.', fillCount) . ' (' . numOfLines . ' L)'
endfunction
]])

vim.cmd("set foldtext=FoldText()")
vim.cmd("set fillchars=fold:\\ ")
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

-- Decrease mapped sequence wait time - Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
-- vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

vim.opt.showbreak = "⤷  " -- ↪	⤷
vim.opt.listchars = {
	tab = "  ",
	extends = "⟫",
	precedes = "⟪",
	conceal = "",
	nbsp = "␣",
	trail = "·",
}
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 8

-- Centered navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous Diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next Diagnostic message" })
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic Error messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })

-- Diagnotic signs
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

-- [[ Basic Autocommands ]]

-- Define custom highlight groups using Neovim's Lua API
vim.api.nvim_set_hl(0, "YankClipboard", { bg = "#95D2B3", fg = "#1A5319" }) -- Green background for clipboard yanks
vim.api.nvim_set_hl(0, "YankNormal", { bg = "#C8A1E0", fg = "#674188" }) -- Purple background for normal yanks

-- Function to highlight yank based on clipboard usage
local function highlight_yank()
	if vim.v.event.regname == "+" then
		vim.highlight.on_yank({ higroup = "YankClipboard" })
	else
		vim.highlight.on_yank({ higroup = "YankNormal" })
	end
end

-- Define the yank autocmd
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = highlight_yank,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]

require("lazy").setup({

	-- { "stackmap.nvim", dir = "/home/neon/Personal/stackmap.nvim", lazy = false },
	-- { "Z-xus/stackmap.nvim", lazy = false },

	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth" },

	-- Use treesitter to auto close and auto rename html tag (Can't find anything better at the moment)
	{ "windwp/nvim-ts-autotag", opts = {} },

	{ "echasnovski/mini.indentscope", version = "*", opts = { symbol = "▏" } },

	-- Search/replace in multiple files
	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		opts = { headerMaxWidth = 80 },
		keys = {
			{
				"<leader>f",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					grug.open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= "" and "*." .. ext or nil,
						},
					})
				end,
				mode = { "n", "v" },
				desc = "Search and Replace",
			},
		},
	},

	{
		"mbbill/undotree",
		opts = {},
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},

	{
		"Bekaboo/dropbar.nvim",
		name = "dropbar",
		keys = {
			vim.keymap.set("n", "<leader>b", function()
				require("dropbar.api").pick(vim.v.count ~= 0 and vim.v.count)
			end, { desc = "Toggle dropbar menu" }),
		},
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("dropbar").setup()
		end,
	},

	-- Color schemes

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			term_colors = true,
			compile_path = vim.fn.stdpath("cache") .. "/catppuccin",

			integrations = {
				dropbar = {
					enabled = false,
					color_mode = true, -- enable color for kind's texts, not just kind's icons
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					inlay_hints = {
						background = true,
					},
				},
				grug_far = true,
				harpoon = true,
				cmp = true,
				copilot_vim = true,
				render_markdown = true,
				which_key = true,
				telescope = {
					enabled = true,
					style = "nvchad",
				},
			},
		},
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},

	-- {
	-- 	-- Theme inspired by Atom
	-- 	"navarasu/onedark.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("onedark")
	-- 		-- Lua
	-- 		require("onedark").setup({
	-- 			style = "dark",
	-- 		})
	-- 		require("onedark").load()
	-- 	end,
	-- },

	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("tokyonight-night")
	-- 		-- vim.cmd.hi("Comment gui=none")
	-- 	end,
	-- },

	-- {
	-- 	"Shatur/neovim-ayu",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		overrides = {
	-- 			Normal = { bg = "None" },
	-- 			ColorColumn = { bg = "None" },
	-- 			SignColumn = { bg = "None" },
	-- 			Folded = { bg = "None" },
	-- 			FoldColumn = { bg = "None" },
	-- 			CursorLine = { bg = "None" },
	-- 			CursorColumn = { bg = "None" },
	-- 			WhichKeyFloat = { bg = "None" },
	-- 			VertSplit = { bg = "None" },
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		-- vim.cmd([[colorscheme ayu]])
	-- 		-- vim.g.ayucolor = "dark"
	-- 		vim.cmd.colorscheme("ayu-mirage")
	-- 	end,
	-- },

	-- { "ThePrimeagen/vim-be-good" },

	-- {
	-- 	-- Line indent markers
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	main = "ibl",
	-- 	---@module "ibl"
	-- 	---@type ibl.config
	-- 	opts = {},
	-- },

	-- { "numToStr/Comment.nvim" },
	{
		"echasnovski/mini.comment",
		version = "*",
		opts = {
			options = {
				custom_commentstring = function()
					if vim.bo.filetype == "sql" then
						return "-- %s"
					end
				end,
			},
		},
	},

	-- { "github/copilot.vim" },

	{
		"folke/trouble.nvim",
		opts = {
			focus = true,
		},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			-- {
			--   "<leader>cs",
			--   "<cmd>Trouble symbols toggle focus=false<cr>",
			--   desc = "Symbols (Trouble)",
			-- },
			-- {
			--   "<leader>cl",
			--   "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			--   desc = "LSP Definitions / references / ... (Trouble)",
			-- },
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
		config = function()
			vim.keymap.set("n", "<c-l>", ":TmuxNavigateRight<CR>", {
				silent = true,
				buffer = true,
			})
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VimEnter",
		opts = {
			icons = {
				mappings = vim.g.have_nerd_font,
				keys = vim.g.have_nerd_font and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1>",
					F2 = "<F2>",
					F3 = "<F3>",
					F4 = "<F4>",
					F5 = "<F5>",
					F6 = "<F6>",
					F7 = "<F7>",
					F8 = "<F8>",
					F9 = "<F9>",
					F10 = "<F10>",
					F11 = "<F11>",
					F12 = "<F12>",
				},
			},

			-- Document existing key chains
			spec = {
				{ "<leader>c", group = "Code", mode = { "n", "x" } },
				{ "<leader>d", group = "Document" },
				{ "<leader>r", group = "Rename" },
				{ "<leader>s", group = "Search" },
				{ "<leader>w", group = "Workspace" },
				{ "<leader>t", group = "Toggle" },
				{ "<leader>h", group = "Git Hunk", mode = { "n", "v" } },
			},
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_config = {
						vertical = { height = 0.5 },
					},

					-- TODO: Fix this
					-- path_display = function(_, path)
					-- 	local tail = vim.fs.basename(path) -- Get the file name
					-- 	local parent = vim.fs.dirname(path) -- Get the parent directory
					--
					-- 	if parent == "." then
					-- 		return tail -- If no parent, return only the file name
					-- 	end
					--
					-- 	-- Return the formatted string with the file name and parent directory
					-- 	return string.format("%s • %s", tail, parent)
					-- end,

					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
					},
				},
				pickers = {
					find_files = {
						follow = true,
					},
				},

				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			require("custom.utils.telescope-multigrep").setup()

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search Select Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current Word" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Search Resume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })

			vim.keymap.set(
				"n",
				"<leader>/",
				builtin.current_buffer_fuzzy_find,
				{ desc = "/ Fuzzily search in current buffer" }
			)

			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "Search / in Open Files" })

			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Search Neovim files" })
		end,
	},

	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",

		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},

		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
					map("gr", require("telescope.builtin").lsp_references, "Goto References")
					map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type Definition")
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
					map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
					map("<leader>rn", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gD", vim.lsp.buf.declaration, "Goto Declaration")

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end
					if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				clangd = {
					cmd = {
						"clangd",
						"--offset-encoding=utf-16",
					},
				},
				emmet_ls = {},
				jsonls = {},
				-- pylsp = {},
				tailwindcss = {},
				ts_ls = {},
				-- gopls = {},
				pyright = {},
				-- rust_analyzer = {},

				lua_ls = {
					-- cmd = {...}, Override the default command used to start the server
					-- filetypes = { ...}, Override the default list of associated filetypes for the server
					-- capabilities = {}, Override fields in capabilities. Can be used to disable certain LSP features.
					settings = { -- Override the default settings passed when initializing the server.
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = { disable = { "missing-fields" }, globals = { "vim" } },
						},
					},
				},
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- for disabling certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{
		-- Autoformat
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<a-f>",
				function()
					require("conform").format({
						async = true,
						lsp_fallback = true,
						stop_after_first = true,
					})
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				html = { "prettierd", "prettier" },
				lua = { "stylua" },
				python = { "black" },
				cpp = { "clang-format" },
				javascript = { "prettierd", "prettier" }, -- Stop after first by default here
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = true },
	},

	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			extensions = {
				"neo-tree",
			},
		},
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {},
	},

	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "bash", "c", "cpp", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ii", -- Start incremental selection
					node_incremental = "<leader>in", -- Increment to the next node
					scope_incremental = "<leader>is", -- Increment to the next scope
					node_decremental = "<leader>id", -- Decrement to the previous node
				},
			},
			-- textobjects
			textobjects = {
				-- select objects
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["am"] = "@parameter.outer",
						["im"] = "@parameter.inner",
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
					},
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					include_surrounding_whitespace = true,
				},

				-- swap objects
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},

				-- move objects
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						-- ["]]"] = { query = "@class.outer", desc = "Next class start" },
						--
						-- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
						["]l"] = "@loop.*",
						-- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
						--
						-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
						-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
						-- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
						["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
					},
					-- goto_next_end = {
					-- 	["]M"] = "@function.outer",
					-- 	["]["] = "@class.outer",
					-- },
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[l"] = "@loop.*",
						-- ["[["] = "@class.outer",
					},
					-- goto_previous_end = {
					-- 	["[M"] = "@function.outer",
					-- 	["[]"] = "@class.outer",
					-- },
				},
			},
		},

		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup(opts)
			--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},

	{ "nvim-treesitter/nvim-treesitter-textobjects" },

	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			enable = true,
			line_numbers = true,
			multiline_threshold = 8,
			trim_scope = "outer",
			mode = "cursor",
			separator = nil,
			zindex = 20,
			on_attach = nil,
		},
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>cc",
				"<cmd>TSContextToggle<CR>",
				{ noremap = true, desc = "Toggle Code Context" }
			)

			-- Get the current highlight properties of 'CursorLine'
			local cursorline_hl = vim.api.nvim_get_hl(0, { name = "CursorLine", link = false })

			-- Apply the same properties to 'TreesitterContext'
			vim.api.nvim_set_hl(0, "TreesitterContext", cursorline_hl)
		end,
	},

	{ import = "custom.plugins" },
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
