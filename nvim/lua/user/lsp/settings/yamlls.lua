local settings = {
	yaml = {
		trace = {
			server = "verbose"
		},
		schemas = {
			["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s(.template)?.yaml",
		},
	},
}

return { settings }
