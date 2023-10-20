return {
	load = {
		["core.journal"] = {
			config = { journal_folder = "Journal", workspace = "Neorg" },
		},

		["core.tangle"] = {},

		["core.keybinds"] = {
			config = {
				hook = function(keybinds)
					-- Unmaps any Neorg key from the `norg` mode
					keybinds.unmap("norg", "n", "gO")
				end,
			},
		},

		["core.dirman"] = {
			config = {
				workspaces = {
					Neorg = "~/Documents/Neorg",
					Area = "~/Documents/Neorg/Area",
					Resources = "~/Documents/Neorg/Resources",
					Projects = "~/Documents/Neorg/Projects",
					Archive = "~/Documents/Neorg/Archive",
					WSL = "~/Documents/Neorg/WSL",
				},
			},
		},
	},
}
