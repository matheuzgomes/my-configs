-- pi-theme: dark, teal-accent, moderate-high contrast
-- ponytail: single-file colorscheme, no plugin packaging yet

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "pi-theme"

local c = {} -- color palette

-- ── Background ──────────────────────────────────
c.bg        = "#0e0e12"
c.bg_ui     = "#0c0c10" -- sidebar, float borders
c.bg_line   = "#14141a" -- cursorline
c.bg_status = "#16161d" -- statusline
c.bg_visual = "#1e2a38" -- visual selection (cool blue tint)
c.bg_search = "#3a3820" -- search highlight (warm amber tint)

-- ── Foreground / text ──────────────────────────
c.fg        = "#d0d0d8"
c.fg_dim    = "#a0a0b0"
c.fg_muted  = "#757588"

-- ── Accent ──────────────────────────────────────
c.teal      = "#3ec9a7" -- strings, functions, accents
c.blue      = "#5dade2" -- keywords, types, operators
c.purple    = "#c792ea" -- special, preproc, conditional
c.orange    = "#e0a040" -- constants, numbers, booleans
c.red       = "#e06c75" -- errors, builtins
c.yellow    = "#f0c050" -- warnings, labels, tags
c.var       = "#d4c8a8" -- variables (warm beige)
c.green     = "#5cb878" -- diff-add, ok

-- ── Comments ────────────────────────────────────
c.comment   = "#5a5a6e"
c.comment_doc = "#6a6a80" -- doc comments slightly brighter

-- ── Borders & UI lines ──────────────────────────
c.border    = "#2a2a38"
c.line_num  = "#4a4a5c"
c.line_num_active = "#6a6a82"

-- ── Diagnostics ─────────────────────────────────
c.diag_error   = "#e06c75"
c.diag_warn    = "#f0c050"
c.diag_info    = "#5dade2"
c.diag_hint    = "#5cb878"

-- ── Diff ────────────────────────────────────────
c.diff_add    = "#1a3a26"
c.diff_change = "#2a2a10"
c.diff_delete = "#3a1a1e"
c.diff_text   = "#2a3818"

local hi = vim.api.nvim_set_hl

-- ── ── ── ── ── ── ── ── ── ── ── ── ── ── ── ──
-- Standard Neovim highlight groups

-- Text
hi(0, "Normal",        { fg = c.fg, bg = c.bg })
hi(0, "NormalFloat",   { fg = c.fg, bg = c.bg_ui })
hi(0, "CursorLine",    { bg = c.bg_line })
hi(0, "CursorColumn",  { bg = c.bg_line })
hi(0, "ColorColumn",   { bg = c.bg_line })
hi(0, "LineNr",        { fg = c.line_num, bg = c.bg_ui })
hi(0, "CursorLineNr",  { fg = c.line_num_active, bg = c.bg_line })
hi(0, "SignColumn",    { fg = c.line_num, bg = c.bg })
hi(0, "FoldColumn",    { fg = c.comment, bg = c.bg })
hi(0, "EndOfBuffer",   { fg = c.bg })
hi(0, "NonText",       { fg = c.comment })

-- Searching
hi(0, "Search",        { fg = c.bg, bg = c.yellow })
hi(0, "IncSearch",     { fg = c.bg, bg = c.teal })
hi(0, "CurSearch",     { fg = c.bg, bg = c.teal })
hi(0, "MatchParen",    { fg = c.teal, bg = c.bg_line, bold = true })
hi(0, "Visual",        { bg = c.bg_visual })
hi(0, "VisualNOS",     { bg = c.bg_visual })

-- UI elements
hi(0, "Pmenu",         { fg = c.fg_dim, bg = c.bg_ui })
hi(0, "PmenuSel",      { fg = c.fg, bg = c.bg_visual })
hi(0, "PmenuSbar",     { bg = c.bg_status })
hi(0, "PmenuThumb",    { bg = c.fg_muted })
hi(0, "WildMenu",      { fg = c.bg, bg = c.teal })
hi(0, "StatusLine",    { fg = c.fg_dim, bg = c.bg_status })
hi(0, "StatusLineNC",  { fg = c.comment, bg = c.bg_ui })
hi(0, "WinSeparator",  { fg = c.border })
hi(0, "VertSplit",     { fg = c.border, bg = c.bg })
hi(0, "TabLine",       { fg = c.comment, bg = c.bg_ui })
hi(0, "TabLineSel",    { fg = c.fg, bg = c.bg })
hi(0, "TabLineFill",   { bg = c.bg_ui })
hi(0, "FloatBorder",   { fg = c.border, bg = c.bg_ui })
hi(0, "FloatTitle",    { fg = c.fg, bg = c.bg_ui, bold = true })
hi(0, "Title",         { fg = c.teal, bold = true })

-- Messages
hi(0, "ErrorMsg",      { fg = c.diag_error, bold = true })
hi(0, "WarningMsg",    { fg = c.diag_warn })
hi(0, "ModeMsg",       { fg = c.fg_dim })
hi(0, "MoreMsg",       { fg = c.teal })
hi(0, "Question",      { fg = c.teal })

-- Folds
hi(0, "Folded",        { fg = c.comment, bg = c.bg_line })
hi(0, "FoldColumn",    { fg = c.comment })

-- Spelling
hi(0, "SpellBad",      { sp = c.diag_error, undercurl = true })
hi(0, "SpellCap",      { sp = c.diag_warn, undercurl = true })
hi(0, "SpellLocal",    { sp = c.diag_info, undercurl = true })
hi(0, "SpellRare",     { sp = c.diag_hint, undercurl = true })

-- Special
hi(0, "SpecialKey",    { fg = c.purple })
hi(0, "Conceal",       { fg = c.comment })
hi(0, "Directory",     { fg = c.blue })
hi(0, "QuickFixLine",  { bg = c.bg_visual })
hi(0, "MsgArea",       { fg = c.fg_dim })

-- ── ── ── ── ── ── ── ── ── ── ── ── ── ── ── ──
-- Syntax highlighting

hi(0, "Comment",       { fg = c.comment, italic = true })
hi(0, "@comment",      { fg = c.comment, italic = true })
hi(0, "@comment.documentation", { fg = c.comment_doc, italic = true })

hi(0, "Constant",      { fg = c.orange })
hi(0, "String",        { fg = c.teal })
hi(0, "Character",     { fg = c.teal })
hi(0, "Number",        { fg = c.orange })
hi(0, "Boolean",       { fg = c.orange, italic = true })
hi(0, "Float",         { fg = c.orange })

hi(0, "Identifier",    { fg = c.var })
hi(0, "Function",      { fg = c.teal })

hi(0, "Statement",     { fg = c.purple, italic = true })
hi(0, "Conditional",   { fg = c.purple })
hi(0, "Repeat",        { fg = c.purple })
hi(0, "Label",         { fg = c.yellow })
hi(0, "Operator",      { fg = c.blue })
hi(0, "Keyword",       { fg = c.purple, italic = true })
hi(0, "Exception",     { fg = c.red })

hi(0, "PreProc",       { fg = c.purple })
hi(0, "Include",       { fg = c.purple })
hi(0, "Define",        { fg = c.purple })
hi(0, "Macro",         { fg = c.purple })
hi(0, "PreCondit",     { fg = c.purple })

hi(0, "Type",          { fg = c.blue })
hi(0, "StorageClass",  { fg = c.blue, italic = true })
hi(0, "Structure",     { fg = c.blue })
hi(0, "Typedef",       { fg = c.blue })

hi(0, "Special",       { fg = c.orange })
hi(0, "SpecialChar",   { fg = c.orange })
hi(0, "Tag",           { fg = c.yellow })
hi(0, "Delimiter",     { fg = c.fg_muted })
hi(0, "SpecialComment",{ fg = c.comment })
hi(0, "Debug",         { fg = c.red })

hi(0, "Underlined",    { fg = c.blue, underline = true })
hi(0, "Ignore",        { fg = c.comment })
hi(0, "Error",         { fg = c.diag_error })
hi(0, "Todo",          { fg = c.yellow, bg = c.bg_line, bold = true })

-- ── ── ── ── ── ── ── ── ── ── ── ── ── ── ── ──
-- Treesitter (linked groups)

local ts_map = {
  -- Properties and fields
  ["@property"]                  = { fg = c.var },
  ["@variable"]                  = { fg = c.var },
  ["@variable.builtin"]          = { fg = c.red },
  ["@variable.member"]           = { fg = c.fg },
  ["@variable.parameter"]        = { fg = c.fg_dim },

  -- Functions and methods
  ["@function"]                  = { fg = c.teal },
  ["@function.builtin"]          = { fg = c.red },
  ["@function.call"]             = { fg = c.teal },
  ["@function.macro"]            = { fg = c.purple },
  ["@method"]                    = { fg = c.teal },
  ["@method.call"]               = { fg = c.teal },
  ["@constructor"]               = { fg = c.blue },

  -- Keywords
  ["@keyword"]                   = { fg = c.purple, italic = true },
  ["@keyword.function"]          = { fg = c.purple, italic = true },
  ["@keyword.operator"]          = { fg = c.blue },
  ["@keyword.return"]            = { fg = c.purple, italic = true },
  ["@keyword.exception"]         = { fg = c.red },
  ["@keyword.conditional"]       = { fg = c.purple },
  ["@keyword.repeat"]            = { fg = c.purple },
  ["@keyword.import"]            = { fg = c.purple },

  -- Types
  ["@type"]                      = { fg = c.blue },
  ["@type.builtin"]              = { fg = c.red },
  ["@type.definition"]           = { fg = c.blue },
  ["@type.qualifier"]            = { fg = c.blue, italic = true },

  -- Identifiers
  ["@attribute"]                 = { fg = c.yellow },
  ["@attribute.builtin"]         = { fg = c.yellow },
  ["@namespace"]                 = { fg = c.blue },
  ["@module"]                    = { fg = c.teal },

  -- Literals
  ["@string"]                    = { fg = c.teal },
  ["@string.documentation"]      = { fg = c.teal },
  ["@string.regexp"]             = { fg = c.orange },
  ["@string.escape"]             = { fg = c.orange },
  ["@string.special"]            = { fg = c.orange },
  ["@string.special.url"]        = { fg = c.blue, underline = true },
  ["@character"]                 = { fg = c.teal },
  ["@character.special"]         = { fg = c.orange },
  ["@number"]                    = { fg = c.orange },
  ["@number.float"]              = { fg = c.orange },
  ["@boolean"]                   = { fg = c.orange, italic = true },
  ["@boolean.builtin"]           = { fg = c.orange, italic = true },

  -- Tags (HTML/JSX)
  ["@tag"]                       = { fg = c.red },
  ["@tag.attribute"]             = { fg = c.yellow },
  ["@tag.delimiter"]             = { fg = c.fg_muted },
  ["@tag.builtin"]               = { fg = c.red },

  -- Punctuation
  ["@punctuation"]               = { fg = c.fg_muted },
  ["@punctuation.bracket"]       = { fg = c.fg_muted },
  ["@punctuation.delimiter"]     = { fg = c.fg_muted },
  ["@punctuation.special"]       = { fg = c.purple },

  -- Markup
  ["@markup.heading"]            = { fg = c.fg, bold = true },
  ["@markup.heading.1"]          = { fg = c.red, bold = true },
  ["@markup.heading.2"]          = { fg = c.yellow, bold = true },
  ["@markup.heading.3"]          = { fg = c.teal, bold = true },
  ["@markup.heading.4"]          = { fg = c.blue, bold = true },
  ["@markup.heading.5"]          = { fg = c.purple, bold = true },
  ["@markup.heading.6"]          = { fg = c.fg_dim, bold = true },
  ["@markup.link"]               = { fg = c.blue, underline = true },
  ["@markup.link.url"]           = { fg = c.comment, underline = true },
  ["@markup.list"]               = { fg = c.blue },
  ["@markup.list.checked"]       = { fg = c.green },
  ["@markup.list.unchecked"]     = { fg = c.fg_muted },
  ["@markup.strong"]             = { bold = true },
  ["@markup.italic"]             = { italic = true },
  ["@markup.strikethrough"]      = { strikethrough = true },
  ["@markup.quote"]              = { fg = c.comment, italic = true },
  ["@markup.raw"]               = { fg = c.teal },

  -- Diff
  ["@diff.plus"]                 = { fg = c.green },
  ["@diff.minus"]                = { fg = c.red },
  ["@diff.delta"]                = { fg = c.yellow },
}

for group, attrs in pairs(ts_map) do
  hi(0, group, attrs)
end

-- ── ── ── ── ── ── ── ── ── ── ── ── ── ── ── ──
-- LSP / Diagnostic

hi(0, "DiagnosticError",          { fg = c.diag_error })
hi(0, "DiagnosticWarn",           { fg = c.diag_warn })
hi(0, "DiagnosticInfo",           { fg = c.diag_info })
hi(0, "DiagnosticHint",           { fg = c.diag_hint })
hi(0, "DiagnosticUnderlineError", { sp = c.diag_error, undercurl = true })
hi(0, "DiagnosticUnderlineWarn",  { sp = c.diag_warn, undercurl = true })
hi(0, "DiagnosticUnderlineInfo",  { sp = c.diag_info, undercurl = true })
hi(0, "DiagnosticUnderlineHint",  { sp = c.diag_hint, undercurl = true })
hi(0, "DiagnosticVirtualTextError", { fg = c.diag_error })
hi(0, "DiagnosticVirtualTextWarn",  { fg = c.diag_warn })
hi(0, "DiagnosticVirtualTextInfo",  { fg = c.diag_info })
hi(0, "DiagnosticVirtualTextHint",  { fg = c.diag_hint })
hi(0, "DiagnosticFloatingError",    { fg = c.diag_error })
hi(0, "DiagnosticFloatingWarn",     { fg = c.diag_warn })
hi(0, "DiagnosticFloatingInfo",     { fg = c.diag_info })
hi(0, "DiagnosticFloatingHint",     { fg = c.diag_hint })
hi(0, "DiagnosticSignError",        { fg = c.diag_error })
hi(0, "DiagnosticSignWarn",         { fg = c.diag_warn })
hi(0, "DiagnosticSignInfo",         { fg = c.diag_info })
hi(0, "DiagnosticSignHint",         { fg = c.diag_hint })

hi(0, "LspReferenceRead",   { bg = c.bg_visual })
hi(0, "LspReferenceText",   { bg = c.bg_visual })
hi(0, "LspReferenceWrite",  { bg = c.bg_visual })
hi(0, "LspCodeLens",        { fg = c.comment })
hi(0, "LspInlayHint",       { fg = c.comment, bg = c.bg_line })

-- Git / Gitsigns
hi(0, "GitSignsAdd",        { fg = c.green })
hi(0, "GitSignsChange",     { fg = c.yellow })
hi(0, "GitSignsDelete",     { fg = c.red })
hi(0, "GitSignsAddNr",      { fg = c.green })
hi(0, "GitSignsChangeNr",   { fg = c.yellow })
hi(0, "GitSignsDeleteNr",   { fg = c.red })
hi(0, "GitSignsAddLn",      { bg = c.diff_add })
hi(0, "GitSignsChangeLn",   { bg = c.diff_change })
hi(0, "GitSignsDeleteLn",   { bg = c.diff_delete })

-- Yanky / Highlightedyank
hi(0, "HighlightedyankRegion", { bg = c.bg_search })
