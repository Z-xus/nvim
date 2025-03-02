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
	local c = ls.choice_node
	-- local f = ls.function_node
	-- local sn = ls.snippet_node

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
				"#include <chrono>",
				"",
				"using namespace std;",
				"using namespace std::chrono;",
				"",
				"// Compiler Pragmas (uncomment as needed for extra performance)",
				'// #pragma GCC target ("avx2")',
				'// #pragma GCC optimization ("O3")',
				'// #pragma GCC optimization ("unroll-loops")',
				'// #pragma GCC optimize("Ofast,no-stack-protector,unroll-loops,fast-math,O3")',
				'// #pragma GCC target("sse,sse2,sse3,ssse3,sse4,popcnt,abm,mmx,avx,tune=native")',
				"",
				"// Fast I/O",
				"#define send ios_base::sync_with_stdio(false)",
				"#define help       \\",
				"    cin.tie(NULL); \\",
				"    cout.tie(NULL)",
				"#define fix(prec) cout << setprecision(prec) << fixed",
				"",
				"// Common types",
				"typedef long long ll;",
				"typedef long double lld;",
				"typedef unsigned long long ull;",
				"typedef pair<ll, ll> pll;",
				"typedef vector<ll> vll;",
				"typedef vector<pll> vpl;",
				"typedef vector<char> vc;",
				"typedef vector<vector<char>> vvc;",
				"typedef vector<vector<ll>> vvll;",
				"typedef vector<string> vs;",
				"typedef map<ll, ll> mll;",
				"",
				"// Short helpers",
				"#define pb      push_back",
				"#define ppb     pop_back",
				"#define mp      make_pair",
				"#define f       first",
				"#define s       second",
				"#define all(x)  (x).begin(), (x).end()",
				"#define rall(x) (x).rbegin(), (x).rend()",
				"#define sz(x)   (int)(x).size()",
				"#define msz(x)  ((long long)x.size())",
				"",
				"// I/O helpers",
				"#define in(x)           cin >> x",
				"#define in2(x, y)       cin >> x >> y",
				"#define in3(x, y, z)    cin >> x >> y >> z",
				"#define in4(a, b, c, d) cin >> a >> b >> c >> d",
				"",
				"// Output helpers",
				"#define out(x)   cout << x",
				"#define outsp(x) cout << x << ' '",
				"#define outln(x) cout << x << '\\n'",
				"#define line     cout << '\\n'",
				"",
				"// Constants",
				"constexpr int MOD = 1'000'000'007;",
				"constexpr double PI = 3.14159265358979323846;",
				"",
				"// Print utilities",
				"template <typename A>",
				"ostream &operator<<(ostream &cout, vector<A> const &v);",
				"",
				"template <typename A, typename B>",
				"ostream &operator<<(ostream &cout, pair<A, B> const &p) {",
				'    return cout << p.f << " " << p.s;',
				"}",
				"",
				"template <typename A>",
				"ostream &operator<<(ostream &cout, vector<A> const &v) {",
				"    for (size_t i = 0; i < v.size(); i++) {",
				'        if (i) cout << " ";',
				"        cout << v[i];",
				"    }",
				'    return cout << "\\n";',
				"}",
				"",
				"template <typename A, typename B>",
				"istream &operator>>(istream &cin, pair<A, B> &p) {",
				"    cin >> p.first;",
				"    return cin >> p.second;",
				"}",
				"",
				"// Random number generator",
				"mt19937 rng(chrono::steady_clock::now().time_since_epoch().count());",
				"",
				"// Global variables",
				"// const ll template_array_size = 1e6 + 585;",
				"// ll a[template_array_size];",
				"// ll b[template_array_size];",
				"// ll c[template_array_size];",
				"string s, t;",
				"ll n, m, k, q, l, r, x, y, z;",
				"ll ans = 0;",
				"",
				"void solution() {",
			}),
			i(0),
			t({
				"}",
				"",
				"int main() {",
				"#ifdef LOCAL",
				"    auto begin = chrono::high_resolution_clock::now();",
				"#endif",
				"    send;",
				"    help;",
				"    int tc = 1;",
				"",
			}),
			t({ "    " }),
			i(1, "in(tc);"), -- cursor lands here, you can delete or comment it manually
			t({ "" }),
			-- c(1, {
			-- 	t({ "    in(tc);" }),
			-- 	t({ "    // in(tc);" }),
			-- 	t({ "" }),
			-- }),
			t({
				"",
				"    while (tc--) { solution(); }",
				"",
				"#ifdef LOCAL",
				"    auto end = chrono::high_resolution_clock::now();",
				"    cout << setprecision(4) << fixed;",
				'    cout << "Execution time: " << chrono::duration_cast<chrono::duration<double>>(end - begin).count() << " seconds"',
				"         << endl;",
				"#endif",
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
