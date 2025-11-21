-- Nord Dark theme for lualine
-- Matches the nord-dark.lua colorscheme

local colors = {
  bg = '#212121',
  fg = '#d8dee9',
  gray = '#424242',
  
  -- Nord palette
  nord0 = '#2e3440',
  nord1 = '#3b4252',
  nord2 = '#434c5e',
  nord3 = '#4c566a',
  nord7 = '#8fbcbb',
  nord8 = '#88c0d0',
  nord9 = '#81a1c1',
  nord10 = '#5e81ac',
  nord11 = '#bf616a',
  nord13 = '#ebcb8b',
  nord14 = '#a3be8c',
}

return {
  normal = {
    a = { bg = colors.nord8, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.nord1, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  insert = {
    a = { bg = colors.nord14, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.nord1, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  visual = {
    a = { bg = colors.nord13, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.nord1, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  replace = {
    a = { bg = colors.nord11, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.nord1, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  command = {
    a = { bg = colors.nord7, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.nord1, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  inactive = {
    a = { bg = colors.gray, fg = colors.nord3, gui = 'bold' },
    b = { bg = colors.bg, fg = colors.nord3 },
    c = { bg = colors.bg, fg = colors.nord3 },
  },
}
