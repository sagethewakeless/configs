vim.cmd("highlight clear")
if vim.g.syntax_on then vim.cmd("syntax reset") end
vim.g.colors_name = "gradient"
vim.o.background  = "dark"
vim.o.termguicolors = true

-- ── Palette ──────────────────────────────────────────────────────────────────

local c = {
  -- Core
  bg        = "#090909",
  fg        = "#CCCCDB",

  -- Normal
  black     = "#090909",
  red       = "#F75C66",
  green     = "#41D686",
  yellow    = "#E3C23B",
  blue      = "#618DF3",
  magenta   = "#D961D2",
  cyan      = "#44D6D6",
  white     = "#9D9DA8",

  -- Bright
  br_black  = "#59596B",
  br_red    = "#FF8F90",
  br_green  = "#66F5A2",
  br_yellow = "#FDDC5B",
  br_blue   = "#8BAFFF",
  br_mag    = "#F985F0",
  br_cyan   = "#77F2F1",
  br_white  = "#E7E7EE",

  -- Semantic extras derived from the palette
  selection = "#562353",
  cursor    = "#F985F0",
  vi_cursor = "#44D6D6",
  line_bg   = "#0F0F15",   -- slightly lifted bg for cursorline and floats
  dim       = "#3A3A48",   -- subtle UI: line numbers, guides, bars (br_black is too bright for these)
  border    = "#3A3A48",   -- suits popups/floats
  comment   = "#59596B",   -- same as br_black, matches terminal suggestions
  none      = "NONE",
}

-- ── Helper ────────────────────────────────────────────────────────────────────

---@param group string
---@param opts { fg?: string, bg?: string, bold?: boolean, italic?: boolean, underline?: boolean, undercurl?: boolean, strikethrough?: boolean, sp?: string, link?: string }
local function hi(group, opts)
  if opts.link then
    vim.api.nvim_set_hl(0, group, { link = opts.link })
    return
  end
  vim.api.nvim_set_hl(0, group, {
    fg            = opts.fg,
    bg            = opts.bg,
    bold          = opts.bold,
    italic        = opts.italic,
    underline     = opts.underline,
    undercurl     = opts.undercurl,
    strikethrough = opts.strikethrough,
    sp            = opts.sp,
  })
end

-- ── UI ────────────────────────────────────────────────────────────────────────

hi("Normal",          { fg = c.fg,       bg = c.bg })
hi("NormalFloat",     { fg = c.fg,       bg = c.line_bg })
hi("NormalNC",        { fg = c.white,    bg = c.bg })

hi("ColorColumn",     { bg = c.line_bg })
hi("CursorLine",      { bg = c.line_bg })
hi("CursorLineNr",    { fg = c.br_mag,   bold = true })
hi("CursorColumn",    { bg = c.line_bg })
hi("Cursor",          { fg = c.bg,       bg = c.cursor })
hi("TermCursor",      { fg = c.bg,       bg = c.vi_cursor })

hi("LineNr",          { fg = c.dim })
hi("SignColumn",      { fg = c.dim,      bg = c.bg })
hi("FoldColumn",      { fg = c.dim,      bg = c.bg })
hi("Folded",          { fg = c.white,    bg = c.dim })

hi("StatusLine",      { fg = c.fg,       bg = c.dim })
hi("StatusLineNC",    { fg = c.white,    bg = c.black })
hi("WinSeparator",    { fg = c.border })
hi("VertSplit",       { link = "WinSeparator" })

hi("TabLine",         { fg = c.white,    bg = c.dim })
hi("TabLineFill",     { bg = c.black })
hi("TabLineSel",      { fg = c.bg,       bg = c.magenta, bold = true })

hi("Pmenu",           { fg = c.fg,       bg = c.line_bg })
hi("PmenuSel",        { fg = c.bg,       bg = c.cyan,    bold = true })
hi("PmenuSbar",       { bg = c.dim })
hi("PmenuThumb",      { bg = c.magenta })
hi("PmenuBorder",     { fg = c.border,   bg = c.line_bg })

hi("FloatBorder",     { fg = c.border,   bg = c.line_bg })
hi("FloatTitle",      { fg = c.br_mag,   bg = c.line_bg, bold = true })

hi("Visual",          { bg = c.selection })
hi("VisualNOS",       { bg = c.selection })
hi("Search",          { fg = c.bg,       bg = c.br_yellow })
hi("IncSearch",       { fg = c.bg,       bg = c.br_mag,  bold = true })
hi("CurSearch",       { link = "IncSearch" })
hi("Substitute",      { fg = c.bg,       bg = c.br_red })

hi("MatchParen",      { fg = c.br_cyan,  bold = true, underline = true })
hi("NonText",         { fg = c.dim })
hi("Whitespace",      { fg = c.dim })
hi("SpecialKey",      { fg = c.dim })
hi("EndOfBuffer",     { fg = c.dim })
hi("Conceal",         { fg = c.white })

hi("WildMenu",        { fg = c.bg,       bg = c.br_cyan })
hi("QuickFixLine",    { fg = c.br_cyan,  bold = true })
hi("Directory",       { fg = c.br_blue })
hi("Title",           { fg = c.br_mag,   bold = true })
hi("Question",        { fg = c.br_green })
hi("MoreMsg",         { fg = c.green })
hi("ModeMsg",         { fg = c.br_cyan,  bold = true })
hi("ErrorMsg",        { fg = c.br_red,   bold = true })
hi("WarningMsg",      { fg = c.br_yellow })

hi("SpellBad",        { undercurl = true, sp = c.br_red })
hi("SpellCap",        { undercurl = true, sp = c.br_yellow })
hi("SpellRare",       { undercurl = true, sp = c.br_mag })
hi("SpellLocal",      { undercurl = true, sp = c.br_cyan })

-- ── Syntax (classic groups, also used as TreeSitter fallbacks) ────────────────

hi("Comment",         { fg = c.comment,  italic = true })
hi("Todo",            { fg = c.br_yellow, bold = true })
hi("Error",           { fg = c.br_red,   bold = true })

hi("Constant",        { fg = c.br_cyan })
hi("String",          { fg = c.br_green })
hi("Character",       { fg = c.green })
hi("Number",          { fg = c.br_yellow })
hi("Boolean",         { fg = c.br_mag })
hi("Float",           { link = "Number" })

hi("Identifier",      { fg = c.fg })
hi("Function",        { fg = c.br_blue })

hi("Statement",       { fg = c.magenta,  bold = true })
hi("Conditional",     { fg = c.magenta })
hi("Repeat",          { fg = c.magenta })
hi("Label",           { fg = c.cyan })
hi("Operator",        { fg = c.br_cyan })
hi("Keyword",         { fg = c.br_mag,   bold = true })
hi("Exception",       { fg = c.br_red })

hi("PreProc",         { fg = c.cyan })
hi("Include",         { fg = c.blue })
hi("Define",          { fg = c.cyan })
hi("Macro",           { fg = c.cyan })
hi("PreCondit",       { fg = c.cyan })

hi("Type",            { fg = c.br_cyan })
hi("StorageClass",    { fg = c.br_blue,  bold = true })
hi("Structure",       { fg = c.blue })
hi("Typedef",         { fg = c.cyan })

hi("Special",         { fg = c.br_yellow })
hi("SpecialChar",     { fg = c.yellow })
hi("Tag",             { fg = c.br_mag })
hi("Delimiter",       { fg = c.white })
hi("SpecialComment",  { fg = c.br_cyan,  italic = true })
hi("Debug",           { fg = c.br_red })

hi("Underlined",      { underline = true })
hi("Ignore",          { fg = c.dim })

-- ── TreeSitter ────────────────────────────────────────────────────────────────

hi("@comment",                  { link = "Comment" })
hi("@comment.todo",             { link = "Todo" })
hi("@comment.error",            { fg = c.br_red,    italic = true })
hi("@comment.warning",          { fg = c.br_yellow, italic = true })
hi("@comment.note",             { fg = c.br_cyan,   italic = true })

hi("@string",                   { link = "String" })
hi("@string.escape",            { fg = c.br_yellow })
hi("@string.special",           { fg = c.yellow })
hi("@string.special.url",       { fg = c.br_blue,   underline = true })
hi("@character",                { link = "Character" })
hi("@number",                   { link = "Number" })
hi("@number.float",             { link = "Float" })
hi("@boolean",                  { link = "Boolean" })

hi("@variable",                 { fg = c.fg })
hi("@variable.builtin",         { fg = c.br_mag,    italic = true })
hi("@variable.parameter",       { fg = c.br_white })
hi("@variable.member",          { fg = c.br_cyan })

hi("@constant",                 { link = "Constant" })
hi("@constant.builtin",         { fg = c.br_cyan,   bold = true })
hi("@constant.macro",           { fg = c.cyan })

hi("@function",                 { link = "Function" })
hi("@function.builtin",         { fg = c.br_blue,   italic = true })
hi("@function.call",            { fg = c.blue })
hi("@function.method",          { fg = c.br_blue })
hi("@function.method.call",     { fg = c.blue })
hi("@function.macro",           { fg = c.cyan })

hi("@keyword",                  { link = "Keyword" })
hi("@keyword.import",           { fg = c.blue })
hi("@keyword.return",           { fg = c.br_mag,    italic = true })
hi("@keyword.operator",         { fg = c.br_cyan })
hi("@keyword.coroutine",        { fg = c.br_mag })
hi("@keyword.exception",        { link = "Exception" })
hi("@keyword.conditional",      { link = "Conditional" })
hi("@keyword.repeat",           { link = "Repeat" })

hi("@operator",                 { link = "Operator" })
hi("@punctuation.bracket",      { fg = c.white })
hi("@punctuation.delimiter",    { fg = c.white })
hi("@punctuation.special",      { fg = c.br_yellow })

hi("@type",                     { link = "Type" })
hi("@type.builtin",             { fg = c.cyan,      bold = true })
hi("@type.definition",          { fg = c.br_cyan,   bold = true })

hi("@module",                   { fg = c.br_blue })
hi("@module.builtin",           { fg = c.br_blue,   italic = true })

hi("@label",                    { link = "Label" })
hi("@tag",                      { fg = c.br_mag })
hi("@tag.attribute",            { fg = c.br_cyan })
hi("@tag.delimiter",            { fg = c.white })

hi("@markup.heading",           { fg = c.br_mag,    bold = true })
hi("@markup.heading.1",         { fg = c.br_mag,    bold = true })
hi("@markup.heading.2",         { fg = c.magenta,   bold = true })
hi("@markup.heading.3",         { fg = c.br_cyan,   bold = true })
hi("@markup.heading.4",         { fg = c.cyan,      bold = true })
hi("@markup.heading.5",         { fg = c.br_blue,   bold = true })
hi("@markup.heading.6",         { fg = c.blue,      bold = true })
hi("@markup.bold",              { bold = true })
hi("@markup.italic",            { italic = true })
hi("@markup.strikethrough",     { strikethrough = true })
hi("@markup.underline",         { underline = true })
hi("@markup.link",              { fg = c.br_blue,   underline = true })
hi("@markup.link.label",        { fg = c.blue })
hi("@markup.raw",               { fg = c.br_green })
hi("@markup.list",              { fg = c.br_yellow })
hi("@markup.list.checked",      { fg = c.green })
hi("@markup.list.unchecked",    { fg = c.white })

hi("@diff.plus",                { fg = c.br_green })
hi("@diff.minus",               { fg = c.br_red })
hi("@diff.delta",               { fg = c.br_yellow })

-- ── LSP ──────────────────────────────────────────────────────────────────────

hi("LspReferenceText",          { bg = c.dim })
hi("LspReferenceRead",          { bg = c.dim })
hi("LspReferenceWrite",         { bg = c.dim, underline = true })
hi("LspSignatureActiveParameter", { fg = c.br_yellow, underline = true })
hi("LspInlayHint",              { fg = c.comment,  italic = true })
hi("LspCodeLens",               { fg = c.comment,  italic = true })

-- Diagnostics
hi("DiagnosticError",           { fg = c.br_red })
hi("DiagnosticWarn",            { fg = c.br_yellow })
hi("DiagnosticInfo",            { fg = c.br_blue })
hi("DiagnosticHint",            { fg = c.br_cyan })
hi("DiagnosticOk",              { fg = c.br_green })

hi("DiagnosticUnderlineError",  { undercurl = true, sp = c.br_red })
hi("DiagnosticUnderlineWarn",   { undercurl = true, sp = c.br_yellow })
hi("DiagnosticUnderlineInfo",   { undercurl = true, sp = c.br_blue })
hi("DiagnosticUnderlineHint",   { undercurl = true, sp = c.br_cyan })

hi("DiagnosticVirtualTextError",  { fg = c.red,    italic = true })
hi("DiagnosticVirtualTextWarn",   { fg = c.yellow, italic = true })
hi("DiagnosticVirtualTextInfo",   { fg = c.blue,   italic = true })
hi("DiagnosticVirtualTextHint",   { fg = c.cyan,   italic = true })

hi("DiagnosticSignError",       { fg = c.br_red })
hi("DiagnosticSignWarn",        { fg = c.br_yellow })
hi("DiagnosticSignInfo",        { fg = c.br_blue })
hi("DiagnosticSignHint",        { fg = c.br_cyan })

-- ── Plugin highlights ─────────────────────────────────────────────────────────

-- gitsigns.nvim
hi("GitSignsAdd",               { fg = c.green })
hi("GitSignsChange",            { fg = c.blue })
hi("GitSignsDelete",            { fg = c.red })
hi("GitSignsAddNr",             { fg = c.green })
hi("GitSignsChangeNr",          { fg = c.blue })
hi("GitSignsDeleteNr",          { fg = c.red })
hi("GitSignsAddLn",             { bg = c.line_bg })
hi("GitSignsStagedAdd",         { fg = c.br_green })
hi("GitSignsStagedChange",      { fg = c.br_blue })
hi("GitSignsStagedDelete",      { fg = c.br_red })

-- Diff (built-in :diff and plugins)
hi("DiffAdd",                   { fg = c.green,    bg = "#021a0e" })
hi("DiffChange",                { fg = c.blue,     bg = "#020e1a" })
hi("DiffDelete",                { fg = c.red,      bg = "#1a0208" })
hi("DiffText",                  { fg = c.br_blue,  bg = "#042040", bold = true })

-- nvim-tree / neo-tree
hi("NvimTreeNormal",            { fg = c.fg,       bg = c.black })
hi("NvimTreeRootFolder",        { fg = c.br_mag,   bold = true })
hi("NvimTreeFolderName",        { fg = c.br_blue })
hi("NvimTreeOpenedFolderName",  { fg = c.br_cyan,  bold = true })
hi("NvimTreeFolderIcon",        { fg = c.blue })
hi("NvimTreeSymlink",           { fg = c.br_cyan })
hi("NvimTreeExecFile",          { fg = c.br_green, bold = true })
hi("NvimTreeSpecialFile",       { fg = c.br_yellow })
hi("NvimTreeGitDirty",          { fg = c.yellow })
hi("NvimTreeGitNew",            { fg = c.green })
hi("NvimTreeGitDeleted",        { fg = c.red })
hi("NvimTreeIndentMarker",      { fg = c.dim })
hi("NvimTreeWinSeparator",      { fg = c.border })

-- telescope.nvim
hi("TelescopeNormal",           { fg = c.fg,       bg = c.line_bg })
hi("TelescopeBorder",           { fg = c.border,   bg = c.line_bg })
hi("TelescopeTitle",            { fg = c.br_mag,   bold = true })
hi("TelescopePromptBorder",     { fg = c.magenta,  bg = c.line_bg })
hi("TelescopePromptTitle",      { fg = c.bg,       bg = c.magenta, bold = true })
hi("TelescopeResultsBorder",    { fg = c.border,   bg = c.line_bg })
hi("TelescopeResultsTitle",     { fg = c.br_cyan })
hi("TelescopePreviewBorder",    { fg = c.border,   bg = c.line_bg })
hi("TelescopePreviewTitle",     { fg = c.br_blue })
hi("TelescopeSelection",        { bg = c.selection })
hi("TelescopeSelectionCaret",   { fg = c.br_mag })
hi("TelescopeMatching",         { fg = c.br_yellow, bold = true })
hi("TelescopePromptCounter",    { fg = c.white })

-- which-key.nvim
hi("WhichKey",                  { fg = c.br_cyan })
hi("WhichKeyGroup",             { fg = c.br_mag })
hi("WhichKeyDesc",              { fg = c.fg })
hi("WhichKeySeparator",         { fg = c.white })
hi("WhichKeyFloat",             { bg = c.line_bg })
hi("WhichKeyBorder",            { fg = c.border })

-- indent-blankline.nvim
hi("IblIndent",                 { fg = c.dim })
hi("IblScope",                  { fg = c.dim })
hi("IndentBlanklineChar",       { fg = c.dim })
hi("IndentBlanklineContextChar",{ fg = c.border })

-- nvim-cmp
hi("CmpItemMenu",               { fg = c.white,    italic = true })
hi("CmpItemAbbrMatch",          { fg = c.br_yellow, bold = true })
hi("CmpItemAbbrMatchFuzzy",     { fg = c.yellow,   bold = true })
hi("CmpItemAbbrDeprecated",     { fg = c.white,    strikethrough = true })
hi("CmpItemKindText",           { fg = c.fg })
hi("CmpItemKindMethod",         { fg = c.br_blue })
hi("CmpItemKindFunction",       { fg = c.br_blue })
hi("CmpItemKindConstructor",    { fg = c.br_cyan })
hi("CmpItemKindField",          { fg = c.br_cyan })
hi("CmpItemKindVariable",       { fg = c.fg })
hi("CmpItemKindClass",          { fg = c.br_cyan })
hi("CmpItemKindInterface",      { fg = c.cyan })
hi("CmpItemKindModule",         { fg = c.blue })
hi("CmpItemKindProperty",       { fg = c.br_cyan })
hi("CmpItemKindKeyword",        { fg = c.br_mag })
hi("CmpItemKindSnippet",        { fg = c.br_yellow })
hi("CmpItemKindColor",          { fg = c.br_mag })
hi("CmpItemKindFile",           { fg = c.br_green })
hi("CmpItemKindEnumMember",     { fg = c.cyan })
hi("CmpItemKindConstant",       { fg = c.br_cyan })
hi("CmpItemKindStruct",         { fg = c.blue })
hi("CmpItemKindOperator",       { fg = c.br_cyan })
hi("CmpItemKindTypeParameter",  { fg = c.cyan })

-- notify.nvim / noice.nvim
hi("NotifyERRORBorder",         { fg = c.red })
hi("NotifyWARNBorder",          { fg = c.yellow })
hi("NotifyINFOBorder",          { fg = c.blue })
hi("NotifyDEBUGBorder",         { fg = c.white })
hi("NotifyTRACEBorder",         { fg = c.magenta })
hi("NotifyERRORIcon",           { fg = c.br_red })
hi("NotifyWARNIcon",            { fg = c.br_yellow })
hi("NotifyINFOIcon",            { fg = c.br_blue })
hi("NotifyDEBUGIcon",           { fg = c.white })
hi("NotifyTRACEIcon",           { fg = c.br_mag })
hi("NotifyERRORTitle",          { fg = c.br_red,   bold = true })
hi("NotifyWARNTitle",           { fg = c.br_yellow, bold = true })
hi("NotifyINFOTitle",           { fg = c.br_blue,  bold = true })
hi("NotifyDEBUGTitle",          { fg = c.white })
hi("NotifyTRACETitle",          { fg = c.br_mag,   bold = true })

-- mini.nvim (statusline, icons, etc.)
hi("MiniStatuslineModeNormal",  { fg = c.bg,       bg = c.br_cyan,   bold = true })
hi("MiniStatuslineModeInsert",  { fg = c.bg,       bg = c.br_green,  bold = true })
hi("MiniStatuslineModeVisual",  { fg = c.bg,       bg = c.br_mag,    bold = true })
hi("MiniStatuslineModeReplace", { fg = c.bg,       bg = c.br_red,    bold = true })
hi("MiniStatuslineModeCommand", { fg = c.bg,       bg = c.br_yellow, bold = true })
hi("MiniStatuslineFilename",    { fg = c.fg,       bg = c.dim })
hi("MiniStatuslineFileinfo",    { fg = c.white,    bg = c.dim })
hi("MiniStatuslineDevinfo",     { fg = c.green,    bg = c.dim })
