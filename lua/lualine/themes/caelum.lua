local colors = {
  background = '#1F1F1F',
  background2 = '#2F2F2F',
  foreground = '#CABEAC',
  foreground2 = '#a09483',
  green = '#7B8F5A',
  yellow = '#DCC68D',
  blue = '#677FA3',
  gray = '#848e8A',
  red = '#de6464',
  orange = '#E58538',
  purple = '#7B77A0',
  magenta = '#D885A3',
}

local caelum = {
  normal = {
    a = { fg = colors.blue, bg = colors.background, gui = 'bold' },
    b = { fg = colors.foreground2, bg = colors.background2 },
    c = { fg = colors.foreground2, bg = colors.background2 },
    z = { fg = colors.blue, bg = colors.background },
  },
  insert = {
    a = { fg = colors.green, bg = colors.background },
  },
  visual = {
    a = { fg = colors.purple, bg = colors.background },
  },
  replace = {
    a = { fg = colors.orange, bg = colors.background },
  },
  command = {
    a = { fg = colors.yellow, bg = colors.background },
  },
}

return caelum
