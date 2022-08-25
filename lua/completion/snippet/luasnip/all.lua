local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local snippet = {
	s(
		"todo",
		fmt("{task}({}): {}", {
			i(2, "febriliankr"),
			i(3),
			task = c(1, { t("TODO"), t("ERROR"), t("FIXME") }),
		})
	),
}

return snippet
