local cmp_kinds = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

local cp_snippet = function()
	local ls = require("luasnip") -- Ensure luasnip is required
	local s = ls.snippet
	local t = ls.text_node
	local i = ls.insert_node

	ls.add_snippets("cpp", {
		s("lc", {
			t({
				"#include <bits/stdc++.h>",
				"using namespace std;",
				"",
				"static const bool Init = [](){",
				"	std::ios_base::sync_with_stdio(false);",
				"	std::cout.tie(nullptr);",
				"	std::cin.tie(nullptr);",
				"return true;",
				"}();",
				"",
				"int main() {",
			}),
			i(0),
			t({
				"}",
			}),
		}),
		s("cp", {
			t({
				"#include <bits/stdc++.h>",
				"using namespace std;",
				"",

				"#define fio ios_base::sync_with_stdio(0), cin.tie(0), cout.tie(0);",
				"",

				"typedef long long ll;",
				"#define f first",
				"#define s second",
				"",

				"#define pb push_back",
				"#define ppb pop_back",
				"#define mp make_pair",
				"#define all(x) x.begin(), x.end()",
				"#define sort_all(v) sort(all(v));",
				"",

				"#define PI 3.141592653589793238462",
				"#define gcd(a, b) __gcd(a, b);",
				"",

				"#define in(x) cin >> x",
				"#define in2(x, y) cin >> x >> y",
				"#define in3(x, y, z) cin >> x >> y >> z",
				"",

				"#define out(x) cout << x",
				"#define outsp(x) cout << x << ' '",
				"#define out2(x, y) cout << x << ' ' << y",
				"#define out3(x, y, z) cout << x << ' ' << y << ' ' << z",
				"",

				"#define line cout << endl",
				"#define string_in(x) getline(cin, x)",
				"",

				"typedef vector<int> vi;",
				"typedef vector<char> vc;",
				"typedef vector<vector<int>> vvi;",
				"",

				"typedef set<int> si;",
				"typedef set<char> scr;",
				"typedef set<string> sst;",
				"",

				"typedef vector<ll> vll;",
				"typedef vector<string> vs;",
				"typedef map<int, int> mii;",
				"typedef pair<int, int> pii;",
				"",

				"// mt19937_64 rang(chrono::high_resolution_clock::now().time_since_epoch().count());",
				"const int mod = 1'000'000'007;",
				"// const int N = 3e5, M = N;",
				"",

				"void solution()",
				"{",
			}),
			i(0),
			t({
				"}",
				"",
				"int main() {",
				"    fio;",
				"",
				"    int tc = 1;",
				"    in(tc);",
				"",
				"    while (tc--)",
				"    {",
				"		solution();",
				"    }",
				"",
				"    return 0;",
				"}",
			}),
		}),
	})
end

--TODO: Checkout earlier config
return {
	-- Autocompletion
	"hrsh7th/nvim-cmp",
	lazy = false,
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				--    https://github.com/rafamadriz/friendly-snippets
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			config = cp_snippet,
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({})

		cmp.setup({

			window = {
				documentation = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
				},
				completion = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
					col_offset = -3,
					side_padding = 0,
				},
			},

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(_, vim_item)
					local kind_symbol = cmp_kinds[vim_item.kind] or ""
					local kind_text = vim_item.kind
					if kind_text == nil then
						kind_text = ""
					end
					vim_item.kind = " " .. kind_symbol .. kind_text .. " "
					vim_item.menu = "    (" .. kind_text .. ")"
					return vim_item
				end,
			},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			completion = { completeopt = "menu,menuone,noinsert" },

			-- No, but seriously. Please read `:help ins-completion`, it is really good!
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),

				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				-- ["<C-y>"] = cmp.mapping.confirm({ select = true,  }),

				-- Accept ([y]es) the completion.
				["<C-y>"] = cmp.mapping.confirm({
					-- behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),

				-- If you prefer more traditional completion keymaps,
				-- you can uncomment the following lines
				--['<CR>'] = cmp.mapping.confirm { select = true },
				--['<Tab>'] = cmp.mapping.select_next_item(),
				--['<S-Tab>'] = cmp.mapping.select_prev_item(),

				["<C-Space>"] = cmp.mapping.complete({}), -- Manually trigger a completion from nvim-cmp.

				-- Move to next expansion
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				-- Move to previous expansion

				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			},
		})
	end,
}
