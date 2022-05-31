return function()
	require("neorg").setup({
		load = {
			["core.defaults"] = {},
			["core.norg.dirman"] = {
				config = {
					workspaces = {
						work = "~/notes/work",
						presentation = "~/notes/presentation",
						personal = "~/notes/personal",
					},
				},
			},
		},
	})
end
