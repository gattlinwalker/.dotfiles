-- Nord Dark Theme for Neovim
-- Converted from VSCode theme

local M = {}

M.setup = function()
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end
  
  vim.o.background = 'dark'
  vim.g.colors_name = 'nord-dark'

  local colors = {
    bg = '#212121',
    fg = '#d8dee9',
    
    -- Nord palette
    nord0 = '#2e3440',
    nord1 = '#3b4252',
    nord2 = '#434c5e',
    nord3 = '#4c566a',
    nord4 = '#d8dee9',
    nord5 = '#e5e9f0',
    nord6 = '#eceff4',
    nord7 = '#8fbcbb',
    nord8 = '#88c0d0',
    nord9 = '#81a1c1',
    nord10 = '#5e81ac',
    nord11 = '#bf616a',
    nord12 = '#d08770',
    nord13 = '#ebcb8b',
    nord14 = '#a3be8c',
    nord15 = '#b48ead',
    
    -- UI colors
    gray = '#424242',
    selection = '#3b4252',  -- Slightly lighter than bg for subtle selection
    line_highlight = '#2a2a2a',  -- Slightly lighter than bg for subtle highlight
    cursor = '#ebcb8b',
    error = '#bf616a',
    warning = '#ebcb8b',
    info = '#88c0d0',
    hint = '#a3be8c',
  }

  local groups = {
    -- Editor
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg },
    ColorColumn = { fg = colors.nord8, bg = colors.nord1 },  -- editorRuler.foreground override
    Cursor = { fg = colors.bg, bg = colors.cursor },
    CursorLine = { bg = colors.line_highlight },
    CursorLineNr = { fg = colors.nord8, bg = colors.line_highlight },  -- editorLineNumber.activeForeground override
    LineNr = { fg = colors.gray },
    SignColumn = { bg = colors.bg },
    
    -- Selections
    Visual = { bg = colors.selection },
    VisualNOS = { bg = colors.selection },
    
    -- Search
    Search = { fg = colors.bg, bg = colors.nord13 },
    IncSearch = { fg = colors.bg, bg = colors.nord13 },
    
    -- Splits
    VertSplit = { fg = colors.gray },
    
    -- Tabs
    TabLine = { fg = colors.gray, bg = colors.bg },
    TabLineFill = { bg = colors.bg },
    TabLineSel = { fg = colors.fg, bg = colors.bg },
    
    -- Status line
    StatusLine = { fg = colors.gray, bg = colors.bg },
    StatusLineNC = { fg = colors.gray, bg = colors.bg },
    
    -- Popup menu
    Pmenu = { fg = colors.fg, bg = colors.bg },
    PmenuSel = { fg = colors.fg, bg = colors.line_highlight },
    PmenuSbar = { bg = colors.gray },
    PmenuThumb = { bg = colors.nord8 },
    
    -- Messages
    ErrorMsg = { fg = colors.error },
    WarningMsg = { fg = colors.warning },
    ModeMsg = { fg = colors.fg },
    MoreMsg = { fg = colors.nord8 },
    Question = { fg = colors.nord8 },
    
    -- Syntax
    Comment = { fg = colors.nord3, italic = true },
    Constant = { fg = colors.nord13 },
    String = { fg = colors.nord14 },
    Character = { fg = colors.nord13 },
    Number = { fg = colors.nord15 },
    Boolean = { fg = colors.nord9 },
    Float = { fg = colors.nord15 },
    
    Identifier = { fg = colors.fg },
    Function = { fg = colors.nord8 },
    
    Statement = { fg = colors.nord9 },
    Conditional = { fg = colors.nord9 },
    Repeat = { fg = colors.nord9 },
    Label = { fg = colors.nord9 },
    Operator = { fg = colors.nord9 },
    Keyword = { fg = colors.nord9 },
    Exception = { fg = colors.nord9 },
    
    PreProc = { fg = colors.nord10 },
    Include = { fg = colors.nord9 },
    Define = { fg = colors.nord9 },
    Macro = { fg = colors.nord10 },
    PreCondit = { fg = colors.nord10 },
    
    Type = { fg = colors.nord7 },
    StorageClass = { fg = colors.nord9 },
    Structure = { fg = colors.nord9 },
    Typedef = { fg = colors.nord9 },
    
    Special = { fg = colors.nord13 },
    SpecialChar = { fg = colors.nord13 },
    Tag = { fg = colors.nord9 },
    Delimiter = { fg = colors.nord6 },
    SpecialComment = { fg = colors.nord8, italic = true },
    Debug = { fg = colors.nord15 },
    
    Underlined = { underline = true },
    Ignore = { fg = colors.nord3 },
    Error = { fg = colors.error },
    Todo = { fg = colors.nord13, bold = true },
    
    -- Treesitter
    ['@variable'] = { fg = colors.fg },
    ['@variable.builtin'] = { fg = colors.nord9 },
    ['@variable.parameter'] = { fg = colors.fg },
    ['@variable.member'] = { fg = colors.fg },
    
    ['@constant'] = { fg = colors.nord13 },
    ['@constant.builtin'] = { fg = colors.nord9 },
    ['@constant.macro'] = { fg = colors.nord13 },
    
    ['@string'] = { fg = colors.nord14 },
    ['@string.regex'] = { fg = colors.nord13 },
    ['@string.escape'] = { fg = colors.nord13 },
    
    ['@character'] = { fg = colors.nord13 },
    ['@number'] = { fg = colors.nord15 },
    ['@boolean'] = { fg = colors.nord9 },
    ['@float'] = { fg = colors.nord15 },
    
    ['@function'] = { fg = colors.nord8 },
    ['@function.builtin'] = { fg = colors.nord8 },
    ['@function.macro'] = { fg = colors.nord8 },
    ['@function.method'] = { fg = colors.nord8 },
    
    ['@constructor'] = { fg = colors.nord7 },
    ['@parameter'] = { fg = colors.fg },
    
    ['@keyword'] = { fg = colors.nord9 },
    ['@keyword.function'] = { fg = colors.nord9 },
    ['@keyword.operator'] = { fg = colors.nord9 },
    ['@keyword.return'] = { fg = colors.nord9 },
    
    ['@conditional'] = { fg = colors.nord9 },
    ['@repeat'] = { fg = colors.nord9 },
    ['@label'] = { fg = colors.nord9 },
    ['@operator'] = { fg = colors.nord9 },
    ['@exception'] = { fg = colors.nord9 },
    
    ['@type'] = { fg = colors.nord7 },
    ['@type.builtin'] = { fg = colors.nord9 },
    ['@type.qualifier'] = { fg = colors.nord9 },
    
    ['@structure'] = { fg = colors.nord9 },
    ['@include'] = { fg = colors.nord9 },
    
    ['@property'] = { fg = colors.nord7 },
    ['@field'] = { fg = colors.fg },
    
    ['@punctuation.delimiter'] = { fg = colors.nord6 },
    ['@punctuation.bracket'] = { fg = colors.nord6 },
    ['@punctuation.special'] = { fg = colors.nord9 },
    
    ['@comment'] = { fg = colors.nord3, italic = true },
    
    ['@tag'] = { fg = colors.nord9 },
    ['@tag.attribute'] = { fg = colors.nord7 },
    ['@tag.delimiter'] = { fg = colors.nord9 },
    
    -- Markdown
    ['@markup.heading'] = { fg = colors.nord8, bold = true },
    ['@markup.strong'] = { bold = true },
    ['@markup.italic'] = { italic = true },
    ['@markup.link'] = { fg = colors.nord8 },
    ['@markup.link.url'] = { fg = colors.nord8, underline = true },
    ['@markup.raw'] = { fg = colors.nord7 },
    ['@markup.list'] = { fg = colors.nord9 },
    
    -- LSP
    DiagnosticError = { fg = colors.error },
    DiagnosticWarn = { fg = colors.warning },
    DiagnosticInfo = { fg = colors.info },
    DiagnosticHint = { fg = colors.hint },
    
    DiagnosticVirtualTextError = { fg = colors.error },
    DiagnosticVirtualTextWarn = { fg = colors.warning },
    DiagnosticVirtualTextInfo = { fg = colors.info },
    DiagnosticVirtualTextHint = { fg = colors.hint },
    
    DiagnosticUnderlineError = { undercurl = true, sp = colors.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warning },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint },
    
    -- Git
    DiffAdd = { fg = colors.nord14 },
    DiffChange = { fg = colors.nord13 },
    DiffDelete = { fg = colors.nord11 },
    DiffText = { fg = colors.nord13, bg = colors.nord1 },
    
    -- GitSigns
    GitSignsAdd = { fg = colors.nord14 },
    GitSignsChange = { fg = colors.nord13 },
    GitSignsDelete = { fg = colors.nord11 },
    
    -- Telescope
    TelescopeBorder = { fg = colors.gray },
    TelescopePromptBorder = { fg = colors.gray },
    TelescopeResultsBorder = { fg = colors.gray },
    TelescopePreviewBorder = { fg = colors.gray },
    TelescopeSelection = { fg = colors.nord8, bg = colors.line_highlight },
    TelescopeSelectionCaret = { fg = colors.nord8 },
    TelescopeMultiSelection = { fg = colors.nord8 },
    TelescopeMatching = { fg = colors.nord8, bold = true },
  }

  for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
