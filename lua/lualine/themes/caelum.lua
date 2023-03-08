local colors = {
	background = "#22211E",
	foreground = "#CABEAC",
	green = "#7B8F5A",
	yellow = "#DCC68D",
	blue = "#677FA3",
	red = "#de6464",
	orange = "#E58538",
	purple = "#7B77A0",
	magenta = "#D885A3",
}

local caelum = {
	normal = {
		a = { bg = colors.background, fg = colors.blue, gui = "bold" },
		b = { fg = colors.background, bg = colors.blue },
		c = { fg = colors.fg, bg = colors.background },
	},
	insert = {
		a = { bg = colors.background, fg = colors.green },
		b = { fg = colors.background, bg = colors.green },
	},
	visual = {
		a = { bg = colors.background, fg = colors.purple },
		b = { fg = colors.background, bg = colors.purple },
	},
	replace = {
		a = { bg = colors.background, fg = colors.orange },
		b = { fg = colors.background, bg = colors.orange },
	},
	command = {
		a = { bg = colors.background, fg = colors.yellow },
		b = { fg = colors.background, bg = colors.yellow },
	},
}

return caelum
