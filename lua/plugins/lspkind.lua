return function()
	require("lspkind").init({
		mode = "symbol_text",
		preset = "codicons",
		symbol_map = {
			Text = "",
			Method = "ƒ",
			Function = "",
			Constructor = "",
			Variable = "",
			Class = "",
			Interface = "ﰮ",
			Field = "✨",
			Module = "",
			Property = "",
			Unit = "",
			Value = "",
			Enum = "了",
			Keyword = "",
			Snippet = "﬌",
			Color = "",
			File = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "",
		},
	})
end
