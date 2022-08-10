-- auto pairing
local AutoPairs = require("nvim-autopairs")

AutoPairs.setup({
	check_ts = true,
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = [=[[%'%"%)%>%]%)%}%,]]=],
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "Title",
		highlight_grey = "Normal",
	},
})

