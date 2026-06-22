-- Rustic Cream Neovim Colorscheme
-- Based on Obsidian CSS theme with warm earthy tones
-- Supports both light and dark modes

local M = {}

-- Color palettes
local colors = {
  light = {
    -- Backgrounds
    bg = "#f5f1eb",
    bg_alt = "#e6dfd6",
    bg_status = "#e6dfd6",
    bg_visual = "#d8cfc2",
    bg_cursorline = "#ede7df",

    -- Foregrounds
    fg = "#2d2520",
    fg_muted = "#4a4238",
    fg_faint = "#9a8f82",
    fg_status = "#4a4238",

    -- Accents (Rust theme)
    accent = "#bf6159",
    accent_hover = "#a67c6d",
    accent_light = "#d67b73",

    -- Semantic colors
    red = "#bf6159",
    orange = "#c78d75",
    yellow = "#cc9e54",
    green = "#869c7a",
    cyan = "#56706b",
    blue = "#728c99",
    purple = "#9d868e",
    pink = "#b09098",

    -- UI elements
    border = "#d4ccc2",
    separator = "#d4ccc2",
    cursor = "#bf6159",
    selection = "#bf6159",
    line_nr = "#9a8f82",
    line_nr_cur = "#bf6159",
  },

  dark = {
    -- Backgrounds
    bg = "#1a1714",
    bg_alt = "#2a2520",
    bg_status = "#2a2520",
    bg_visual = "#3a3530",
    bg_cursorline = "#252018",

    -- Foregrounds
    fg = "#ebe7e1",
    fg_muted = "#d4cec7",
    fg_faint = "#6b6158",
    fg_status = "#d4cec7",

    -- Accents (Rust theme - lighter for dark bg)
    accent = "#db8e88",
    accent_hover = "#c59b8d",
    accent_light = "#e5a8a2",

    -- Semantic colors
    red = "#db8e88",
    orange = "#deaea0",
    yellow = "#e0bc7e",
    green = "#aebd9f",
    cyan = "#8daeb3",
    blue = "#9bb0bd",
    purple = "#c9b1b9",
    pink = "#d4b8c0",

    -- UI elements
    border = "#3a3530",
    separator = "#3a3530",
    cursor = "#db8e88",
    selection = "#db8e88",
    line_nr = "#6b6158",
    line_nr_cur = "#db8e88",
  },
}

-- Set highlights
local function set_highlights(p)
  local hl = vim.api.nvim_set_hl

  -- Editor
  hl(0, "Normal", { fg = p.fg, bg = p.bg })
  hl(0, "NormalFloat", { fg = p.fg, bg = p.bg_alt })
  hl(0, "FloatBorder", { fg = p.border, bg = p.bg_alt })
  hl(0, "Cursor", { fg = p.bg, bg = p.cursor })
  hl(0, "CursorLine", { bg = p.bg_cursorline })
  hl(0, "CursorColumn", { bg = p.bg_cursorline })
  hl(0, "ColorColumn", { bg = p.bg_alt })
  hl(0, "LineNr", { fg = p.line_nr })
  hl(0, "CursorLineNr", { fg = p.line_nr_cur, bold = true })
  hl(0, "SignColumn", { bg = p.bg })
  hl(0, "StatusLine", { fg = p.fg_status, bg = p.bg_status })
  hl(0, "StatusLineNC", { fg = p.fg_faint, bg = p.bg_status })
  hl(0, "WinSeparator", { fg = p.separator })
  hl(0, "VertSplit", { fg = p.separator })
  hl(0, "Folded", { fg = p.fg_faint, bg = p.bg_alt })
  hl(0, "FoldColumn", { fg = p.fg_faint })
  hl(0, "Search", { bg = p.bg_visual, bold = true })
  hl(0, "IncSearch", { bg = p.accent, fg = p.bg, bold = true })
  hl(0, "Visual", { bg = p.bg_visual })
  hl(0, "VisualNOS", { bg = p.bg_visual })
  hl(0, "MatchParen", { fg = p.accent, bold = true })
  hl(0, "NonText", { fg = p.fg_faint })
  hl(0, "SpecialKey", { fg = p.fg_faint })
  hl(0, "Whitespace", { fg = p.fg_faint })
  hl(0, "EndOfBuffer", { fg = p.fg_faint })
  hl(0, "WildMenu", { fg = p.bg, bg = p.accent })
  hl(0, "QuickFixLine", { bg = p.bg_visual, bold = true })
  hl(0, "SpellBad", { undercurl = true, sp = p.red })
  hl(0, "SpellCap", { undercurl = true, sp = p.yellow })
  hl(0, "SpellRare", { undercurl = true, sp = p.blue })
  hl(0, "SpellLocal", { undercurl = true, sp = p.cyan })
  hl(0, "Pmenu", { fg = p.fg, bg = p.bg_alt })
  hl(0, "PmenuSel", { fg = p.bg, bg = p.accent })
  hl(0, "PmenuSbar", { bg = p.bg_alt })
  hl(0, "PmenuThumb", { bg = p.accent_hover })
  hl(0, "TabLine", { fg = p.fg_muted, bg = p.bg_alt })
  hl(0, "TabLineSel", { fg = p.fg, bg = p.bg, bold = true })
  hl(0, "TabLineFill", { bg = p.bg_alt })
  hl(0, "Title", { fg = p.accent, bold = true })

  -- Messages
  hl(0, "ErrorMsg", { fg = p.red, bold = true })
  hl(0, "WarningMsg", { fg = p.yellow, bold = true })
  hl(0, "ModeMsg", { fg = p.fg_muted, bold = true })
  hl(0, "MsgArea", { fg = p.fg })
  hl(0, "MoreMsg", { fg = p.green, bold = true })
  hl(0, "Question", { fg = p.yellow, bold = true })

  -- Syntax
  hl(0, "Comment", { fg = p.fg_faint, italic = true })
  hl(0, "Constant", { fg = p.orange })
  hl(0, "String", { fg = p.green })
  hl(0, "Character", { fg = p.green })
  hl(0, "Number", { fg = p.orange })
  hl(0, "Boolean", { fg = p.orange, bold = true })
  hl(0, "Float", { fg = p.orange })
  hl(0, "Identifier", { fg = p.fg })
  hl(0, "Function", { fg = p.blue })
  hl(0, "Statement", { fg = p.purple, bold = true })
  hl(0, "Conditional", { fg = p.purple, bold = true })
  hl(0, "Repeat", { fg = p.purple, bold = true })
  hl(0, "Label", { fg = p.purple })
  hl(0, "Operator", { fg = p.accent })
  hl(0, "Keyword", { fg = p.purple, bold = true })
  hl(0, "Exception", { fg = p.purple, bold = true })
  hl(0, "PreProc", { fg = p.yellow })
  hl(0, "Include", { fg = p.purple })
  hl(0, "Define", { fg = p.purple })
  hl(0, "Macro", { fg = p.purple })
  hl(0, "PreCondit", { fg = p.yellow })
  hl(0, "Type", { fg = p.yellow })
  hl(0, "StorageClass", { fg = p.yellow })
  hl(0, "Structure", { fg = p.yellow })
  hl(0, "Typedef", { fg = p.yellow })
  hl(0, "Special", { fg = p.accent })
  hl(0, "SpecialChar", { fg = p.accent })
  hl(0, "Tag", { fg = p.accent })
  hl(0, "Delimiter", { fg = p.fg_muted })
  hl(0, "SpecialComment", { fg = p.fg_faint, bold = true })
  hl(0, "Debug", { fg = p.red })
  hl(0, "Underlined", { underline = true })
  hl(0, "Ignore", { fg = p.fg_faint })
  hl(0, "Error", { fg = p.red, bold = true })
  hl(0, "Todo", { fg = p.bg, bg = p.yellow, bold = true })
  hl(0, "Done", { fg = p.green, bold = true })

  -- Treesitter (modern syntax highlighting)
  hl(0, "@attribute", { fg = p.yellow })
  hl(0, "@boolean", { fg = p.orange, bold = true })
  hl(0, "@character", { fg = p.green })
  hl(0, "@comment", { fg = p.fg_faint, italic = true })
  hl(0, "@conditional", { fg = p.purple, bold = true })
  hl(0, "@constant", { fg = p.orange })
  hl(0, "@constant.builtin", { fg = p.orange, bold = true })
  hl(0, "@constant.macro", { fg = p.orange })
  hl(0, "@constructor", { fg = p.yellow })
  hl(0, "@error", { fg = p.red })
  hl(0, "@exception", { fg = p.purple, bold = true })
  hl(0, "@field", { fg = p.fg })
  hl(0, "@float", { fg = p.orange })
  hl(0, "@function", { fg = p.blue })
  hl(0, "@function.builtin", { fg = p.blue, bold = true })
  hl(0, "@function.macro", { fg = p.blue })
  hl(0, "@include", { fg = p.purple })
  hl(0, "@keyword", { fg = p.purple, bold = true })
  hl(0, "@keyword.function", { fg = p.purple, bold = true })
  hl(0, "@keyword.operator", { fg = p.accent })
  hl(0, "@keyword.return", { fg = p.purple, bold = true })
  hl(0, "@label", { fg = p.accent })
  hl(0, "@method", { fg = p.blue })
  hl(0, "@namespace", { fg = p.yellow })
  hl(0, "@none", {})
  hl(0, "@number", { fg = p.orange })
  hl(0, "@operator", { fg = p.accent })
  hl(0, "@parameter", { fg = p.fg })
  hl(0, "@parameter.reference", { fg = p.fg })
  hl(0, "@property", { fg = p.fg })
  hl(0, "@punctuation.bracket", { fg = p.fg_muted })
  hl(0, "@punctuation.delimiter", { fg = p.fg_muted })
  hl(0, "@punctuation.special", { fg = p.accent })
  hl(0, "@repeat", { fg = p.purple, bold = true })
  hl(0, "@storageclass", { fg = p.yellow })
  hl(0, "@string", { fg = p.green })
  hl(0, "@string.escape", { fg = p.accent })
  hl(0, "@string.regex", { fg = p.green })
  hl(0, "@string.special", { fg = p.green })
  hl(0, "@symbol", { fg = p.cyan })
  hl(0, "@tag", { fg = p.accent })
  hl(0, "@tag.attribute", { fg = p.yellow })
  hl(0, "@tag.delimiter", { fg = p.fg_muted })
  hl(0, "@text", { fg = p.fg })
  hl(0, "@text.bold", { bold = true })
  hl(0, "@text.emphasis", { italic = true })
  hl(0, "@text.literal", { fg = p.green })
  hl(0, "@text.reference", { fg = p.accent })
  hl(0, "@text.strike", { strikethrough = true })
  hl(0, "@text.title", { fg = p.accent, bold = true })
  hl(0, "@text.underline", { underline = true })
  hl(0, "@text.uri", { fg = p.accent, underline = true })
  hl(0, "@type", { fg = p.yellow })
  hl(0, "@type.builtin", { fg = p.yellow, bold = true })
  hl(0, "@type.definition", { fg = p.yellow })
  hl(0, "@type.qualifier", { fg = p.purple })
  hl(0, "@variable", { fg = p.fg })
  hl(0, "@variable.builtin", { fg = p.pink, bold = true })
  hl(0, "@variable.member", { fg = p.fg })
  hl(0, "@variable.parameter", { fg = p.fg })

  -- LSP
  hl(0, "LspReferenceText", { bg = p.bg_visual })
  hl(0, "LspReferenceRead", { bg = p.bg_visual })
  hl(0, "LspReferenceWrite", { bg = p.bg_visual })
  hl(0, "DiagnosticError", { fg = p.red })
  hl(0, "DiagnosticWarn", { fg = p.yellow })
  hl(0, "DiagnosticInfo", { fg = p.blue })
  hl(0, "DiagnosticHint", { fg = p.cyan })
  hl(0, "DiagnosticSignError", { fg = p.red })
  hl(0, "DiagnosticSignWarn", { fg = p.yellow })
  hl(0, "DiagnosticSignInfo", { fg = p.blue })
  hl(0, "DiagnosticSignHint", { fg = p.cyan })
  hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = p.red })
  hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = p.yellow })
  hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = p.blue })
  hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = p.cyan })
  hl(0, "LspInlayHint", { fg = p.fg_faint, bg = p.bg_alt })

  -- Git
  hl(0, "DiffAdd", { fg = p.green, bg = p.bg_alt })
  hl(0, "DiffChange", { fg = p.yellow, bg = p.bg_alt })
  hl(0, "DiffDelete", { fg = p.red, bg = p.bg_alt })
  hl(0, "DiffText", { fg = p.bg, bg = p.yellow, bold = true })
  hl(0, "diffAdded", { fg = p.green })
  hl(0, "diffRemoved", { fg = p.red })
  hl(0, "diffChanged", { fg = p.yellow })
  hl(0, "diffOldFile", { fg = p.red })
  hl(0, "diffNewFile", { fg = p.green })
  hl(0, "diffFile", { fg = p.blue })
  hl(0, "diffLine", { fg = p.fg_faint })

  -- GitSigns
  hl(0, "GitSignsAdd", { fg = p.green })
  hl(0, "GitSignsChange", { fg = p.yellow })
  hl(0, "GitSignsDelete", { fg = p.red })
  hl(0, "GitSignsAddNr", { fg = p.green })
  hl(0, "GitSignsChangeNr", { fg = p.yellow })
  hl(0, "GitSignsDeleteNr", { fg = p.red })
  hl(0, "GitSignsAddLn", { bg = p.bg_alt })
  hl(0, "GitSignsChangeLn", { bg = p.bg_alt })

  -- NeoTree / NvimTree
  hl(0, "NeoTreeNormal", { fg = p.fg, bg = p.bg_alt })
  hl(0, "NeoTreeNormalNC", { fg = p.fg, bg = p.bg_alt })
  hl(0, "NeoTreeRootName", { fg = p.accent, bold = true })
  hl(0, "NeoTreeFileName", { fg = p.fg })
  hl(0, "NeoTreeFileNameOpened", { fg = p.accent, bold = true })
  hl(0, "NeoTreeFloatBorder", { fg = p.border, bg = p.bg_alt })
  hl(0, "NeoTreeGitAdded", { fg = p.green })
  hl(0, "NeoTreeGitModified", { fg = p.yellow })
  hl(0, "NeoTreeGitDeleted", { fg = p.red })
  hl(0, "NeoTreeGitConflict", { fg = p.red, bold = true })
  hl(0, "NeoTreeGitUntracked", { fg = p.cyan })
  hl(0, "NeoTreeDirectoryName", { fg = p.blue })
  hl(0, "NeoTreeDirectoryIcon", { fg = p.accent })
  hl(0, "NeoTreeExpander", { fg = p.fg_faint })

  hl(0, "NvimTreeNormal", { fg = p.fg, bg = p.bg_alt })
  hl(0, "NvimTreeRootFolder", { fg = p.accent, bold = true })
  hl(0, "NvimTreeFolderName", { fg = p.blue })
  hl(0, "NvimTreeFolderIcon", { fg = p.accent })
  hl(0, "NvimTreeEmptyFolderName", { fg = p.fg_faint })
  hl(0, "NvimTreeOpenedFolderName", { fg = p.accent, bold = true })
  hl(0, "NvimTreeGitNew", { fg = p.green })
  hl(0, "NvimTreeGitDirty", { fg = p.yellow })
  hl(0, "NvimTreeGitDeleted", { fg = p.red })
  hl(0, "NvimTreeGitMerge", { fg = p.purple })
  hl(0, "NvimTreeIndentMarker", { fg = p.fg_faint })

  -- Telescope
  hl(0, "TelescopeNormal", { fg = p.fg, bg = p.bg })
  hl(0, "TelescopeBorder", { fg = p.border, bg = p.bg })
  hl(0, "TelescopePromptNormal", { fg = p.fg, bg = p.bg_alt })
  hl(0, "TelescopePromptBorder", { fg = p.border, bg = p.bg_alt })
  hl(0, "TelescopePromptTitle", { fg = p.bg, bg = p.accent, bold = true })
  hl(0, "TelescopePreviewTitle", { fg = p.bg, bg = p.green, bold = true })
  hl(0, "TelescopeResultsTitle", { fg = p.bg, bg = p.blue, bold = true })
  hl(0, "TelescopeSelection", { bg = p.bg_visual, bold = true })
  hl(0, "TelescopeSelectionCaret", { fg = p.accent })
  hl(0, "TelescopeMultiSelection", { fg = p.accent })
  hl(0, "TelescopeMatching", { fg = p.accent, bold = true })

  -- WhichKey
  hl(0, "WhichKey", { fg = p.accent, bold = true })
  hl(0, "WhichKeyGroup", { fg = p.purple })
  hl(0, "WhichKeyDesc", { fg = p.blue })
  hl(0, "WhichKeySeparator", { fg = p.fg_faint })
  hl(0, "WhichKeyFloat", { bg = p.bg_alt })
  hl(0, "WhichKeyValue", { fg = p.green })

  -- IndentBlankline
  hl(0, "IblIndent", { fg = p.fg_faint })
  hl(0, "IblScope", { fg = p.accent })
  hl(0, "IblWhitespace", { fg = p.fg_faint })

  -- BufferLine
  hl(0, "BufferLineFill", { bg = p.bg_alt })
  hl(0, "BufferLineBackground", { fg = p.fg_faint, bg = p.bg_alt })
  hl(0, "BufferLineBufferVisible", { fg = p.fg_muted, bg = p.bg_alt })
  hl(0, "BufferLineBufferSelected", { fg = p.fg, bg = p.bg, bold = true, italic = true })
  hl(0, "BufferLineTab", { fg = p.fg_faint, bg = p.bg_alt })
  hl(0, "BufferLineTabSelected", { fg = p.accent, bg = p.bg })
  hl(0, "BufferLineTabClose", { fg = p.red, bg = p.bg_alt })
  hl(0, "BufferLineIndicatorSelected", { fg = p.accent, bg = p.bg })
  hl(0, "BufferLineSeparator", { fg = p.bg_alt, bg = p.bg_alt })
  hl(0, "BufferLineSeparatorVisible", { fg = p.bg_alt, bg = p.bg_alt })
  hl(0, "BufferLineSeparatorSelected", { fg = p.bg_alt, bg = p.bg })
  hl(0, "BufferLineCloseButton", { fg = p.fg_faint, bg = p.bg_alt })
  hl(0, "BufferLineCloseButtonVisible", { fg = p.fg_muted, bg = p.bg_alt })
  hl(0, "BufferLineCloseButtonSelected", { fg = p.red, bg = p.bg })
  hl(0, "BufferLineModified", { fg = p.yellow, bg = p.bg_alt })
  hl(0, "BufferLineModifiedVisible", { fg = p.yellow, bg = p.bg_alt })
  hl(0, "BufferLineModifiedSelected", { fg = p.yellow, bg = p.bg })
  hl(0, "BufferLineDuplicate", { fg = p.fg_faint, bg = p.bg_alt, italic = true })
  hl(0, "BufferLineDuplicateVisible", { fg = p.fg_muted, bg = p.bg_alt, italic = true })
  hl(0, "BufferLineDuplicateSelected", { fg = p.fg, bg = p.bg, italic = true })
  hl(0, "BufferLinePick", { fg = p.accent, bg = p.bg_alt, bold = true })
  hl(0, "BufferLinePickSelected", { fg = p.accent, bg = p.bg, bold = true })

  -- Gitsigns (additional)
  hl(0, "GitGutterAdd", { fg = p.green })
  hl(0, "GitGutterChange", { fg = p.yellow })
  hl(0, "GitGutterDelete", { fg = p.red })

  -- Lazy.nvim
  hl(0, "LazyNormal", { fg = p.fg, bg = p.bg })
  hl(0, "LazyButton", { bg = p.bg_alt })
  hl(0, "LazyButtonActive", { fg = p.bg, bg = p.accent, bold = true })
  hl(0, "LazyCommit", { fg = p.green })
  hl(0, "LazyCommitIssue", { fg = p.red })
  hl(0, "LazyDir", { fg = p.blue })
  hl(0, "LazyH1", { fg = p.bg, bg = p.accent, bold = true })
  hl(0, "LazyProgressDone", { fg = p.green })
  hl(0, "LazyProgressTodo", { fg = p.fg_faint })
  hl(0, "LazyProp", { fg = p.yellow })
  hl(0, "LazyReasonCmd", { fg = p.yellow })
  hl(0, "LazyReasonEvent", { fg = p.cyan })
  hl(0, "LazyReasonFt", { fg = p.purple })
  hl(0, "LazyReasonImport", { fg = p.blue })
  hl(0, "LazyReasonKeys", { fg = p.accent })
  hl(0, "LazyReasonPlugin", { fg = p.green })
  hl(0, "LazyReasonRuntime", { fg = p.purple })
  hl(0, "LazyReasonSource", { fg = p.cyan })
  hl(0, "LazyReasonStart", { fg = p.green })
  hl(0, "LazySpecial", { fg = p.accent })
  hl(0, "LazyTaskError", { fg = p.red })
  hl(0, "LazyTaskOutput", { fg = p.fg_muted })
  hl(0, "LazyUrl", { fg = p.accent, underline = true })
  hl(0, "LazyValue", { fg = p.orange })

  -- Mason.nvim
  hl(0, "MasonHeader", { fg = p.bg, bg = p.accent, bold = true })
  hl(0, "MasonHeaderSecondary", { fg = p.bg, bg = p.blue, bold = true })
  hl(0, "MasonHighlight", { fg = p.accent })
  hl(0, "MasonHighlightBlock", { fg = p.bg, bg = p.accent })
  hl(0, "MasonHighlightBlockBold", { fg = p.bg, bg = p.accent, bold = true })
  hl(0, "MasonHighlightSecondary", { fg = p.blue })
  hl(0, "MasonHighlightBlockSecondary", { fg = p.bg, bg = p.blue })
  hl(0, "MasonHighlightBlockBoldSecondary", { fg = p.bg, bg = p.blue, bold = true })
  hl(0, "MasonLink", { fg = p.accent, underline = true })
  hl(0, "MasonMuted", { fg = p.fg_faint })
  hl(0, "MasonMutedBlock", { fg = p.fg, bg = p.bg_alt })
  hl(0, "MasonMutedBlockBold", { fg = p.fg, bg = p.bg_alt, bold = true })
  hl(0, "MasonNormal", { fg = p.fg, bg = p.bg })
  hl(0, "MasonHeading", { fg = p.fg, bold = true })

  -- Notify
  hl(0, "NotifyBackground", { bg = p.bg_alt })
  hl(0, "NotifyERRORBorder", { fg = p.red })
  hl(0, "NotifyWARNBorder", { fg = p.yellow })
  hl(0, "NotifyINFOBorder", { fg = p.blue })
  hl(0, "NotifyDEBUGBorder", { fg = p.fg_faint })
  hl(0, "NotifyTRACEBorder", { fg = p.purple })
  hl(0, "NotifyERRORIcon", { fg = p.red })
  hl(0, "NotifyWARNIcon", { fg = p.yellow })
  hl(0, "NotifyINFOIcon", { fg = p.blue })
  hl(0, "NotifyDEBUGIcon", { fg = p.fg_faint })
  hl(0, "NotifyTRACEIcon", { fg = p.purple })
  hl(0, "NotifyERRORTitle", { fg = p.red, bold = true })
  hl(0, "NotifyWARNTitle", { fg = p.yellow, bold = true })
  hl(0, "NotifyINFOTitle", { fg = p.blue, bold = true })
  hl(0, "NotifyDEBUGTitle", { fg = p.fg_faint, bold = true })
  hl(0, "NotifyTRACETitle", { fg = p.purple, bold = true })
  hl(0, "NotifyERRORBody", { fg = p.fg })
  hl(0, "NotifyWARNBody", { fg = p.fg })
  hl(0, "NotifyINFOBody", { fg = p.fg })
  hl(0, "NotifyDEBUGBody", { fg = p.fg })
  hl(0, "NotifyTRACEBody", { fg = p.fg })

  -- Noice
  hl(0, "NoiceCmdline", { fg = p.fg, bg = p.bg_alt })
  hl(0, "NoiceCmdlineIcon", { fg = p.accent })
  hl(0, "NoiceCmdlineIconSearch", { fg = p.yellow })
  hl(0, "NoiceCmdlinePopup", { fg = p.fg, bg = p.bg_alt })
  hl(0, "NoiceCmdlinePopupBorder", { fg = p.border, bg = p.bg_alt })
  hl(0, "NoiceCmdlinePopupBorderSearch", { fg = p.yellow, bg = p.bg_alt })
  hl(0, "NoiceCmdlinePrompt", { fg = p.accent, bold = true })
  hl(0, "NoiceCompletionItemKindDefault", { fg = p.fg_muted })
  hl(0, "NoiceCompletionItemMenu", { fg = p.fg_faint })
  hl(0, "NoiceConfirm", { fg = p.fg, bg = p.bg_alt })
  hl(0, "NoiceConfirmBorder", { fg = p.accent, bg = p.bg_alt })
  hl(0, "NoiceFormatProgressDone", { bg = p.accent })
  hl(0, "NoiceFormatProgressTodo", { bg = p.bg_alt })
  hl(0, "NoiceLspProgressClient", { fg = p.blue })
  hl(0, "NoiceLspProgressSpinner", { fg = p.accent })
  hl(0, "NoiceLspProgressTitle", { fg = p.fg_muted })
  hl(0, "NoiceMini", { fg = p.fg_faint })
  hl(0, "NoicePopup", { fg = p.fg, bg = p.bg_alt })
  hl(0, "NoicePopupBorder", { fg = p.border, bg = p.bg_alt })
  hl(0, "NoicePopupmenu", { fg = p.fg, bg = p.bg_alt })
  hl(0, "NoicePopupmenuBorder", { fg = p.border, bg = p.bg_alt })
  hl(0, "NoicePopupmenuMatch", { fg = p.accent, bold = true })
  hl(0, "NoicePopupmenuSelected", { fg = p.bg, bg = p.accent })
  hl(0, "NoiceScrollbar", { bg = p.bg_alt })
  hl(0, "NoiceScrollbarThumb", { bg = p.fg_faint })
  hl(0, "NoiceSplit", { fg = p.fg, bg = p.bg_alt })
  hl(0, "NoiceSplitBorder", { fg = p.border, bg = p.bg_alt })
  hl(0, "NoiceVirtualText", { fg = p.fg_faint })

  -- Illuminate
  hl(0, "IlluminatedWordText", { bg = p.bg_visual })
  hl(0, "IlluminatedWordRead", { bg = p.bg_visual })
  hl(0, "IlluminatedWordWrite", { bg = p.bg_visual })

  -- Sneak
  hl(0, "Sneak", { fg = p.bg, bg = p.accent, bold = true })
  hl(0, "SneakLabel", { fg = p.bg, bg = p.accent, bold = true })
  hl(0, "SneakLabelMask", { fg = p.accent })
  hl(0, "SneakScope", { bg = p.bg_visual })

  -- Hop
  hl(0, "HopNextKey", { fg = p.accent, bold = true })
  hl(0, "HopNextKey1", { fg = p.blue, bold = true })
  hl(0, "HopNextKey2", { fg = p.cyan })
  hl(0, "HopUnmatched", { fg = p.fg_faint })
  hl(0, "HopCursor", { fg = p.cursor })
  hl(0, "HopPreview", { fg = p.green })

  -- Lightspeed / Leap
  hl(0, "LeapMatch", { fg = p.accent, bold = true, underline = true })
  hl(0, "LeapLabelPrimary", { fg = p.bg, bg = p.accent, bold = true })
  hl(0, "LeapLabelSecondary", { fg = p.bg, bg = p.blue, bold = true })
  hl(0, "LeapLabelSelected", { fg = p.bg, bg = p.green, bold = true })
  hl(0, "LeapBackdrop", { fg = p.fg_faint })

  -- Flash
  hl(0, "FlashBackdrop", { fg = p.fg_faint })
  hl(0, "FlashLabel", { fg = p.bg, bg = p.accent, bold = true })
  hl(0, "FlashMatch", { fg = p.accent, bold = true })
  hl(0, "FlashCurrent", { fg = p.yellow, bold = true })
  hl(0, "FlashPrompt", { fg = p.accent, bold = true })
  hl(0, "FlashPromptIcon", { fg = p.accent })
  hl(0, "FlashCursor", { fg = p.cursor })

  -- Rainbow Delimiters
  hl(0, "RainbowDelimiterRed", { fg = p.red })
  hl(0, "RainbowDelimiterYellow", { fg = p.yellow })
  hl(0, "RainbowDelimiterBlue", { fg = p.blue })
  hl(0, "RainbowDelimiterOrange", { fg = p.orange })
  hl(0, "RainbowDelimiterGreen", { fg = p.green })
  hl(0, "RainbowDelimiterViolet", { fg = p.purple })
  hl(0, "RainbowDelimiterCyan", { fg = p.cyan })

  -- Todo Comments
  hl(0, "TodoBgFIX", { fg = p.bg, bg = p.red, bold = true })
  hl(0, "TodoFgFIX", { fg = p.red })
  hl(0, "TodoBgTODO", { fg = p.bg, bg = p.blue, bold = true })
  hl(0, "TodoFgTODO", { fg = p.blue })
  hl(0, "TodoBgHACK", { fg = p.bg, bg = p.yellow, bold = true })
  hl(0, "TodoFgHACK", { fg = p.yellow })
  hl(0, "TodoBgWARN", { fg = p.bg, bg = p.yellow, bold = true })
  hl(0, "TodoFgWARN", { fg = p.yellow })
  hl(0, "TodoBgPERF", { fg = p.bg, bg = p.purple, bold = true })
  hl(0, "TodoFgPERF", { fg = p.purple })
  hl(0, "TodoBgNOTE", { fg = p.bg, bg = p.green, bold = true })
  hl(0, "TodoFgNOTE", { fg = p.green })
  hl(0, "TodoBgTEST", { fg = p.bg, bg = p.cyan, bold = true })
  hl(0, "TodoFgTEST", { fg = p.cyan })

  -- Trouble
  hl(0, "TroubleCount", { fg = p.accent, bg = p.bg_alt, bold = true })
  hl(0, "TroubleError", { fg = p.red })
  hl(0, "TroubleWarning", { fg = p.yellow })
  hl(0, "TroubleInformation", { fg = p.blue })
  hl(0, "TroubleHint", { fg = p.cyan })
  hl(0, "TroubleSignError", { fg = p.red })
  hl(0, "TroubleSignWarning", { fg = p.yellow })
  hl(0, "TroubleSignInformation", { fg = p.blue })
  hl(0, "TroubleSignHint", { fg = p.cyan })
  hl(0, "TroubleText", { fg = p.fg })
  hl(0, "TroubleTextError", { fg = p.red })
  hl(0, "TroubleTextWarning", { fg = p.yellow })
  hl(0, "TroubleTextInformation", { fg = p.blue })
  hl(0, "TroubleTextHint", { fg = p.cyan })
  hl(0, "TroubleFoldIcon", { fg = p.fg_faint })
  hl(0, "TroubleIndent", { fg = p.fg_faint })
  hl(0, "TroubleLocation", { fg = p.fg_faint })
  hl(0, "TroublePreview", { bg = p.bg_visual })
  hl(0, "TroubleSource", { fg = p.fg_faint })
  hl(0, "TroubleCode", { fg = p.fg_muted })
  hl(0, "TroubleNormal", { fg = p.fg, bg = p.bg })

  -- Spectre
  hl(0, "SpectreHeader", { fg = p.accent, bold = true })
  hl(0, "SpectreBody", { fg = p.fg })
  hl(0, "SpectreFile", { fg = p.blue, bold = true })
  hl(0, "SpectreDir", { fg = p.fg_faint })
  hl(0, "SpectreSearch", { fg = p.bg, bg = p.accent, bold = true })
  hl(0, "SpectreReplace", { fg = p.bg, bg = p.green, bold = true })
  hl(0, "SpectreBorder", { fg = p.border })
  hl(0, "SpectreResult", { fg = p.green })

  -- Hydra
  hl(0, "HydraAmaranth", { fg = p.red, bold = true })
  hl(0, "HydraBlue", { fg = p.blue, bold = true })
  hl(0, "HydraPink", { fg = p.pink, bold = true })
  hl(0, "HydraRed", { fg = p.red, bold = true })
  hl(0, "HydraTeal", { fg = p.cyan, bold = true })
  hl(0, "HydraHint", { fg = p.fg, bg = p.bg_alt })
  hl(0, "HydraBorder", { fg = p.border })

  -- Dressing
  hl(0, "DressingNormal", { fg = p.fg, bg = p.bg_alt })
  hl(0, "DressingBorder", { fg = p.border, bg = p.bg_alt })
  hl(0, "DressingTitle", { fg = p.accent, bold = true })
  hl(0, "DressingPrompt", { fg = p.accent })
  hl(0, "DressingInput", { fg = p.fg, bg = p.bg })

  -- Cmp (nvim-cmp)
  hl(0, "CmpItemAbbr", { fg = p.fg })
  hl(0, "CmpItemAbbrDeprecated", { fg = p.fg_faint, strikethrough = true })
  hl(0, "CmpItemAbbrMatch", { fg = p.accent, bold = true })
  hl(0, "CmpItemAbbrMatchFuzzy", { fg = p.accent, bold = true })
  hl(0, "CmpItemKind", { fg = p.fg_muted })
  hl(0, "CmpItemMenu", { fg = p.fg_faint })
  hl(0, "CmpItemKindText", { fg = p.fg })
  hl(0, "CmpItemKindMethod", { fg = p.blue })
  hl(0, "CmpItemKindFunction", { fg = p.blue })
  hl(0, "CmpItemKindConstructor", { fg = p.yellow })
  hl(0, "CmpItemKindField", { fg = p.fg })
  hl(0, "CmpItemKindVariable", { fg = p.pink, bold = true })
  hl(0, "CmpItemKindClass", { fg = p.yellow })
  hl(0, "CmpItemKindInterface", { fg = p.yellow })
  hl(0, "CmpItemKindModule", { fg = p.yellow })
  hl(0, "CmpItemKindProperty", { fg = p.fg })
  hl(0, "CmpItemKindUnit", { fg = p.orange })
  hl(0, "CmpItemKindValue", { fg = p.orange })
  hl(0, "CmpItemKindEnum", { fg = p.yellow })
  hl(0, "CmpItemKindKeyword", { fg = p.purple })
  hl(0, "CmpItemKindSnippet", { fg = p.green })
  hl(0, "CmpItemKindColor", { fg = p.red })
  hl(0, "CmpItemKindFile", { fg = p.blue })
  hl(0, "CmpItemKindReference", { fg = p.orange })
  hl(0, "CmpItemKindFolder", { fg = p.blue })
  hl(0, "CmpItemKindEnumMember", { fg = p.orange })
  hl(0, "CmpItemKindConstant", { fg = p.orange })
  hl(0, "CmpItemKindStruct", { fg = p.yellow })
  hl(0, "CmpItemKindEvent", { fg = p.yellow })
  hl(0, "CmpItemKindOperator", { fg = p.accent })
  hl(0, "CmpItemKindTypeParameter", { fg = p.yellow })

  -- Navic (winbar)
  hl(0, "NavicIconsFile", { fg = p.blue })
  hl(0, "NavicIconsModule", { fg = p.yellow })
  hl(0, "NavicIconsNamespace", { fg = p.yellow })
  hl(0, "NavicIconsPackage", { fg = p.yellow })
  hl(0, "NavicIconsClass", { fg = p.yellow })
  hl(0, "NavicIconsMethod", { fg = p.blue })
  hl(0, "NavicIconsProperty", { fg = p.accent })
  hl(0, "NavicIconsField", { fg = p.accent })
  hl(0, "NavicIconsConstructor", { fg = p.yellow })
  hl(0, "NavicIconsEnum", { fg = p.yellow })
  hl(0, "NavicIconsInterface", { fg = p.yellow })
  hl(0, "NavicIconsFunction", { fg = p.blue })
  hl(0, "NavicIconsVariable", { fg = p.pink, bold = true })
  hl(0, "NavicIconsConstant", { fg = p.orange })
  hl(0, "NavicIconsString", { fg = p.green })
  hl(0, "NavicIconsNumber", { fg = p.orange })
  hl(0, "NavicIconsBoolean", { fg = p.orange })
  hl(0, "NavicIconsArray", { fg = p.yellow })
  hl(0, "NavicIconsObject", { fg = p.yellow })
  hl(0, "NavicIconsKey", { fg = p.purple })
  hl(0, "NavicIconsNull", { fg = p.red })
  hl(0, "NavicIconsEnumMember", { fg = p.orange })
  hl(0, "NavicIconsStruct", { fg = p.yellow })
  hl(0, "NavicIconsEvent", { fg = p.yellow })
  hl(0, "NavicIconsOperator", { fg = p.accent })
  hl(0, "NavicIconsTypeParameter", { fg = p.yellow })
  hl(0, "NavicText", { fg = p.fg })
  hl(0, "NavicSeparator", { fg = p.fg_faint })

  -- Scrollbar
  hl(0, "ScrollbarHandle", { bg = p.fg_faint })
  hl(0, "ScrollbarSearchHandle", { fg = p.yellow, bg = p.fg_faint })
  hl(0, "ScrollbarSearch", { fg = p.yellow })
  hl(0, "ScrollbarErrorHandle", { fg = p.red, bg = p.fg_faint })
  hl(0, "ScrollbarError", { fg = p.red })
  hl(0, "ScrollbarWarnHandle", { fg = p.yellow, bg = p.fg_faint })
  hl(0, "ScrollbarWarn", { fg = p.yellow })
  hl(0, "ScrollbarInfoHandle", { fg = p.blue, bg = p.fg_faint })
  hl(0, "ScrollbarInfo", { fg = p.blue })
  hl(0, "ScrollbarHintHandle", { fg = p.cyan, bg = p.fg_faint })
  hl(0, "ScrollbarHint", { fg = p.cyan })
  hl(0, "ScrollbarMiscHandle", { fg = p.purple, bg = p.fg_faint })
  hl(0, "ScrollbarMisc", { fg = p.purple })
  hl(0, "ScrollbarGitAddHandle", { fg = p.green, bg = p.fg_faint })
  hl(0, "ScrollbarGitAdd", { fg = p.green })
  hl(0, "ScrollbarGitChangeHandle", { fg = p.yellow, bg = p.fg_faint })
  hl(0, "ScrollbarGitChange", { fg = p.yellow })
  hl(0, "ScrollbarGitDeleteHandle", { fg = p.red, bg = p.fg_faint })
  hl(0, "ScrollbarGitDelete", { fg = p.red })

  -- CodeCompanion / CopilotChat
  hl(0, "CodeCompanionChatHeader", { fg = p.accent, bold = true })
  hl(0, "CodeCompanionChatSeparator", { fg = p.border })
  hl(0, "CodeCompanionChatTool", { fg = p.green })
  hl(0, "CodeCompanionChatVariable", { fg = p.cyan })
  hl(0, "CodeCompanionVirtualText", { fg = p.fg_faint })
  hl(0, "CodeCompanionUser", { fg = p.blue })
  hl(0, "CodeCompanionAssistant", { fg = p.accent })
  hl(0, "CopilotChatHeader", { fg = p.accent, bold = true })
  hl(0, "CopilotChatSeparator", { fg = p.border })

  -- DAP (Debug Adapter Protocol)
  hl(0, "DapBreakpoint", { fg = p.red })
  hl(0, "DapBreakpointCondition", { fg = p.yellow })
  hl(0, "DapBreakpointRejected", { fg = p.purple })
  hl(0, "DapLogPoint", { fg = p.cyan })
  hl(0, "DapStopped", { fg = p.green })
  hl(0, "DapStoppedLine", { bg = p.bg_visual })
  hl(0, "DapUIVariable", { fg = p.fg })
  hl(0, "DapUIScope", { fg = p.cyan, bold = true })
  hl(0, "DapUIType", { fg = p.yellow })
  hl(0, "DapUIValue", { fg = p.fg })
  hl(0, "DapUIModifiedValue", { fg = p.accent, bold = true })
  hl(0, "DapUIDecoration", { fg = p.fg_faint })
  hl(0, "DapUIThread", { fg = p.green })
  hl(0, "DapUIStoppedThread", { fg = p.accent, bold = true })
  hl(0, "DapUIFrameName", { fg = p.fg })
  hl(0, "DapUISource", { fg = p.purple })
  hl(0, "DapUILineNumber", { fg = p.line_nr })
  hl(0, "DapUIFloatBorder", { fg = p.border, bg = p.bg_alt })
  hl(0, "DapUIWatchesEmpty", { fg = p.red })
  hl(0, "DapUIWatchesValue", { fg = p.green })
  hl(0, "DapUIWatchesError", { fg = p.red })
  hl(0, "DapUIBreakpointsPath", { fg = p.blue, bold = true })
  hl(0, "DapUIBreakpointsInfo", { fg = p.green })
  hl(0, "DapUIBreakpointsCurrentLine", { fg = p.green, bold = true })
  hl(0, "DapUIBreakpointsLine", { fg = p.line_nr })

  -- Aerial
  hl(0, "AerialArrayIcon", { fg = p.yellow })
  hl(0, "AerialBooleanIcon", { fg = p.orange })
  hl(0, "AerialClassIcon", { fg = p.yellow })
  hl(0, "AerialConstantIcon", { fg = p.orange })
  hl(0, "AerialConstructorIcon", { fg = p.yellow })
  hl(0, "AerialEnumIcon", { fg = p.yellow })
  hl(0, "AerialEnumMemberIcon", { fg = p.orange })
  hl(0, "AerialEventIcon", { fg = p.yellow })
  hl(0, "AerialFieldIcon", { fg = p.accent })
  hl(0, "AerialFileIcon", { fg = p.blue })
  hl(0, "AerialFunctionIcon", { fg = p.blue })
  hl(0, "AerialInterfaceIcon", { fg = p.yellow })
  hl(0, "AerialKeyIcon", { fg = p.purple })
  hl(0, "AerialMethodIcon", { fg = p.blue })
  hl(0, "AerialModuleIcon", { fg = p.yellow })
  hl(0, "AerialNamespaceIcon", { fg = p.yellow })
  hl(0, "AerialNullIcon", { fg = p.red })
  hl(0, "AerialNumberIcon", { fg = p.orange })
  hl(0, "AerialObjectIcon", { fg = p.yellow })
  hl(0, "AerialOperatorIcon", { fg = p.accent })
  hl(0, "AerialPackageIcon", { fg = p.yellow })
  hl(0, "AerialPropertyIcon", { fg = p.accent })
  hl(0, "AerialStringIcon", { fg = p.green })
  hl(0, "AerialStructIcon", { fg = p.yellow })
  hl(0, "AerialTypeParameterIcon", { fg = p.yellow })
  hl(0, "AerialVariableIcon", { fg = p.pink, bold = true })
  hl(0, "AerialLine", { fg = p.accent, bold = true })
  hl(0, "AerialNormal", { fg = p.fg, bg = p.bg_alt })
  hl(0, "AerialGuide", { fg = p.fg_faint })
  hl(0, "AerialFloatBorder", { fg = p.border, bg = p.bg_alt })

  -- Overseer
  hl(0, "OverseerPENDING", { fg = p.fg_faint })
  hl(0, "OverseerRUNNING", { fg = p.blue })
  hl(0, "OverseerSUCCESS", { fg = p.green })
  hl(0, "OverseerCANCELLED", { fg = p.yellow })
  hl(0, "OverseerFAILURE", { fg = p.red })
  hl(0, "OverseerTask", { fg = p.fg })
  hl(0, "OverseerTaskBorder", { fg = p.border })
  hl(0, "OverseerOutput", { fg = p.fg_muted })

  -- Neotest
  hl(0, "NeotestPassed", { fg = p.green })
  hl(0, "NeotestFailed", { fg = p.red })
  hl(0, "NeotestRunning", { fg = p.yellow })
  hl(0, "NeotestSkipped", { fg = p.fg_faint })
  hl(0, "NeotestTest", { fg = p.fg })
  hl(0, "NeotestNamespace", { fg = p.purple })
  hl(0, "NeotestFocused", { fg = p.accent, bold = true })
  hl(0, "NeotestFile", { fg = p.blue })
  hl(0, "NeotestDir", { fg = p.blue })
  hl(0, "NeotestBorder", { fg = p.border })
  hl(0, "NeotestIndent", { fg = p.fg_faint })
  hl(0, "NeotestExpandMarker", { fg = p.fg_faint })
  hl(0, "NeotestAdapterName", { fg = p.accent, bold = true })
  hl(0, "NeotestWinSelect", { fg = p.accent, bold = true })
  hl(0, "NeotestMarked", { fg = p.accent, bold = true })
  hl(0, "NeotestTarget", { fg = p.red, bold = true })
  hl(0, "NeotestUnknown", { fg = p.fg_faint })
  hl(0, "NeotestWatching", { fg = p.yellow })

  -- Outline (symbols-outline)
  hl(0, "FocusedSymbol", { fg = p.accent, bg = p.bg_visual, bold = true })
  hl(0, "SymbolsOutlineConnector", { fg = p.fg_faint })

  -- Fidget
  hl(0, "FidgetTitle", { fg = p.accent, bold = true })
  hl(0, "FidgetTask", { fg = p.fg_muted })

  -- Harpoon
  hl(0, "HarpoonWindow", { fg = p.fg, bg = p.bg_alt })
  hl(0, "HarpoonBorder", { fg = p.border, bg = p.bg_alt })
  hl(0, "HarpoonCurrentFile", { fg = p.accent, bold = true })

  -- Alpha (dashboard)
  hl(0, "AlphaHeader", { fg = p.accent })
  hl(0, "AlphaHeaderLabel", { fg = p.accent, bold = true })
  hl(0, "AlphaButtons", { fg = p.blue })
  hl(0, "AlphaShortcut", { fg = p.yellow, bold = true })
  hl(0, "AlphaFooter", { fg = p.fg_faint })

  -- Dashboard
  hl(0, "DashboardHeader", { fg = p.accent })
  hl(0, "DashboardCenter", { fg = p.blue })
  hl(0, "DashboardFooter", { fg = p.fg_faint })
  hl(0, "DashboardShortcut", { fg = p.yellow, bold = true })
  hl(0, "DashboardProjectTitle", { fg = p.accent, bold = true })
  hl(0, "DashboardProjectIcon", { fg = p.accent })
  hl(0, "DashboardMruTitle", { fg = p.accent, bold = true })
  hl(0, "DashboardMruIcon", { fg = p.blue })
  hl(0, "DashboardFiles", { fg = p.fg })
  hl(0, "DashboardDesc", { fg = p.fg_muted })
  hl(0, "DashboardKey", { fg = p.yellow, bold = true })
  hl(0, "DashboardIcon", { fg = p.accent })

  -- Starter (mini.starter)
  hl(0, "MiniStarterCurrent", { fg = p.accent, bold = true })
  hl(0, "MiniStarterFooter", { fg = p.fg_faint })
  hl(0, "MiniStarterHeader", { fg = p.accent })
  hl(0, "MiniStarterInactive", { fg = p.fg_faint, italic = true })
  hl(0, "MiniStarterItem", { fg = p.fg })
  hl(0, "MiniStarterItemBullet", { fg = p.fg_faint })
  hl(0, "MiniStarterItemPrefix", { fg = p.yellow })
  hl(0, "MiniStarterSection", { fg = p.purple, bold = true })
  hl(0, "MiniStarterQuery", { fg = p.blue, bold = true })

  -- Indent Mini
  hl(0, "MiniIndentScope", { fg = p.accent })
  hl(0, "MiniIndentscopeSymbol", { fg = p.accent })
  hl(0, "MiniIndentscopePrefix", { nocombine = true })

  -- Cursorword
  hl(0, "MiniCursorword", { bg = p.bg_visual })
  hl(0, "MiniCursorwordCurrent", { bg = p.bg_visual })

  -- Tabline
  hl(0, "MiniTablineCurrent", { fg = p.fg, bg = p.bg, bold = true })
  hl(0, "MiniTablineFill", { bg = p.bg_alt })
  hl(0, "MiniTablineHidden", { fg = p.fg_faint, bg = p.bg_alt })
  hl(0, "MiniTablineModifiedCurrent", { fg = p.yellow, bg = p.bg, bold = true })
  hl(0, "MiniTablineModifiedHidden", { fg = p.yellow, bg = p.bg_alt })
  hl(0, "MiniTablineModifiedVisible", { fg = p.yellow, bg = p.bg_alt })
  hl(0, "MiniTablineTabpagesection", { fg = p.bg, bg = p.accent, bold = true })
  hl(0, "MiniTablineVisible", { fg = p.fg_muted, bg = p.bg_alt })

  -- Statusline
  hl(0, "MiniStatuslineModeNormal", { fg = p.bg, bg = p.accent, bold = true })
  hl(0, "MiniStatuslineModeInsert", { fg = p.bg, bg = p.green, bold = true })
  hl(0, "MiniStatuslineModeVisual", { fg = p.bg, bg = p.purple, bold = true })
  hl(0, "MiniStatuslineModeReplace", { fg = p.bg, bg = p.red, bold = true })
  hl(0, "MiniStatuslineModeCommand", { fg = p.bg, bg = p.yellow, bold = true })
  hl(0, "MiniStatuslineModeOther", { fg = p.bg, bg = p.cyan, bold = true })
  hl(0, "MiniStatuslineDevinfo", { fg = p.fg, bg = p.bg_alt })
  hl(0, "MiniStatuslineFilename", { fg = p.fg, bg = p.bg_alt })
  hl(0, "MiniStatuslineFileinfo", { fg = p.fg, bg = p.bg_alt })
  hl(0, "MiniStatuslineInactive", { fg = p.fg_faint, bg = p.bg_alt })

  -- Pick (mini.pick)
  hl(0, "MiniPickBorder", { fg = p.border, bg = p.bg_alt })
  hl(0, "MiniPickBorderBusy", { fg = p.yellow, bg = p.bg_alt })
  hl(0, "MiniPickHeader", { fg = p.accent, bold = true })
  hl(0, "MiniPickIconDirectory", { fg = p.blue })
  hl(0, "MiniPickIconFile", { fg = p.fg })
  hl(0, "MiniPickMatchCurrent", { bg = p.bg_visual })
  hl(0, "MiniPickMatchMarked", { bg = p.bg_visual, bold = true })
  hl(0, "MiniPickMatchRanges", { fg = p.accent, bold = true })
  hl(0, "MiniPickNormal", { fg = p.fg, bg = p.bg_alt })
  hl(0, "MiniPickPreviewLine", { bg = p.bg_visual })
  hl(0, "MiniPickPreviewRegion", { bg = p.bg_visual })
  hl(0, "MiniPickPrompt", { fg = p.accent })

  -- Files (mini.files)
  hl(0, "MiniFilesBorder", { fg = p.border, bg = p.bg_alt })
  hl(0, "MiniFilesBorderModified", { fg = p.yellow, bg = p.bg_alt })
  hl(0, "MiniFilesCursorLine", { bg = p.bg_visual })
  hl(0, "MiniFilesDirectory", { fg = p.blue })
  hl(0, "MiniFilesFile", { fg = p.fg })
  hl(0, "MiniFilesNormal", { fg = p.fg, bg = p.bg_alt })
  hl(0, "MiniFilesTitle", { fg = p.accent, bg = p.bg_alt, bold = true })
  hl(0, "MiniFilesTitleFocused", { fg = p.bg, bg = p.accent, bold = true })

  -- Snippets (mini.snippets)
  hl(0, "MiniSnippetsCurrent", { bg = p.bg_visual })
  hl(0, "MiniSnippetsCurrentReplace", { bg = p.bg_visual })
  hl(0, "MiniSnippetsFinal", { bg = p.bg_visual, bold = true })
  hl(0, "MiniSnippetsUnvisited", { bg = p.bg_visual })
  hl(0, "MiniSnippetsVisited", { bg = p.bg_alt })

  -- Clue (mini.clue)
  hl(0, "MiniClueBorder", { fg = p.border, bg = p.bg_alt })
  hl(0, "MiniClueDescGroup", { fg = p.purple, bold = true })
  hl(0, "MiniClueDescSingle", { fg = p.blue })
  hl(0, "MiniClueNextKey", { fg = p.accent, bold = true })
  hl(0, "MiniClueNextKeyWithPostkeys", { fg = p.red, bold = true })
  hl(0, "MiniClueSeparator", { fg = p.fg_faint })
  hl(0, "MiniClueTitle", { fg = p.accent, bold = true })

  -- Diff (mini.diff)
  hl(0, "MiniDiffOverAdd", { bg = p.bg_alt })
  hl(0, "MiniDiffOverChange", { bg = p.bg_alt })
  hl(0, "MiniDiffOverContext", { bg = p.bg_alt })
  hl(0, "MiniDiffOverDelete", { bg = p.bg_alt })
  hl(0, "MiniDiffSignAdd", { fg = p.green })
  hl(0, "MiniDiffSignChange", { fg = p.yellow })
  hl(0, "MiniDiffSignDelete", { fg = p.red })

  -- Git (mini.git)
  hl(0, "MiniGitCommit", { fg = p.fg })
  hl(0, "MiniGitCommitMessage", { fg = p.green })
  hl(0, "MiniGitCommitRange", { fg = p.accent })
  hl(0, "MiniGitHead", { fg = p.purple })
  hl(0, "MiniGitHeadMessage", { fg = p.purple })
  hl(0, "MiniGitHeadRange", { fg = p.accent })
  hl(0, "MiniGitProgress", { fg = p.accent })
  hl(0, "MiniGitSignsAdd", { fg = p.green })
  hl(0, "MiniGitSignsChange", { fg = p.yellow })
  hl(0, "MiniGitSignsDelete", { fg = p.red })

  -- Notify (mini.notify)
  hl(0, "MiniNotifyBorder", { fg = p.border, bg = p.bg_alt })
  hl(0, "MiniNotifyNormal", { fg = p.fg, bg = p.bg_alt })
  hl(0, "MiniNotifyTitle", { fg = p.accent, bold = true })
  hl(0, "MiniNotifyTitleError", { fg = p.red, bold = true })
  hl(0, "MiniNotifyTitleWarn", { fg = p.yellow, bold = true })
  hl(0, "MiniNotifyTitleInfo", { fg = p.blue, bold = true })
  hl(0, "MiniNotifyTitleTrace", { fg = p.purple, bold = true })

  -- hipatterns (mini.hipatterns)
  hl(0, "MiniHipatternsFixme", { fg = p.bg, bg = p.red, bold = true })
  hl(0, "MiniHipatternsHack", { fg = p.bg, bg = p.yellow, bold = true })
  hl(0, "MiniHipatternsNote", { fg = p.bg, bg = p.blue, bold = true })
  hl(0, "MiniHipatternsTodo", { fg = p.bg, bg = p.purple, bold = true })

  -- trailspace
  hl(0, "MiniTrailspace", { bg = p.red })

  -- Operators (mini.operators)
  hl(0, "MiniOperatorsExchangeFrom", { bg = p.bg_visual })

  -- Surround (mini.surround)
  hl(0, "MiniSurround", { fg = p.bg, bg = p.accent, bold = true })

  -- Bracketed (mini.bracketed)
  hl(0, "MiniBracketedConfict", { fg = p.red, bold = true })
  hl(0, "MiniBracketedConfictCurrent", { fg = p.red, bold = true, bg = p.bg_visual })

  -- Misc
  hl(0, "yamlKey", { fg = p.accent })
  hl(0, "tomlKey", { fg = p.accent })
  hl(0, "jsonKeyword", { fg = p.accent })
  hl(0, "markdownH1", { fg = p.accent, bold = true })
  hl(0, "markdownH2", { fg = p.accent, bold = true })
  hl(0, "markdownH3", { fg = p.orange, bold = true })
  hl(0, "markdownH4", { fg = p.orange, bold = true })
  hl(0, "markdownH5", { fg = p.yellow, bold = true })
  hl(0, "markdownH6", { fg = p.yellow, bold = true })
  hl(0, "markdownHeadingDelimiter", { fg = p.accent })
  hl(0, "markdownHeadingRule", { fg = p.fg_faint })
  hl(0, "markdownLinkText", { fg = p.accent, underline = true })
  hl(0, "markdownLinkTextDelimiter", { fg = p.fg_muted })
  hl(0, "markdownLinkDelimiter", { fg = p.fg_muted })
  hl(0, "markdownUrl", { fg = p.blue, underline = true })
  hl(0, "markdownId", { fg = p.yellow })
  hl(0, "markdownIdDeclaration", { fg = p.accent })
  hl(0, "markdownBold", { bold = true })
  hl(0, "markdownItalic", { italic = true })
  hl(0, "markdownCode", { fg = p.green })
  hl(0, "markdownCodeBlock", { fg = p.green })
  hl(0, "markdownCodeDelimiter", { fg = p.green })
  hl(0, "markdownBlockquote", { fg = p.fg_faint, italic = true })
  hl(0, "markdownListMarker", { fg = p.accent })
  hl(0, "markdownOrderedListMarker", { fg = p.accent })
  hl(0, "markdownRule", { fg = p.fg_faint })
  hl(0, "markdownUrlTitleDelimiter", { fg = p.green })
end

-- Main load function
function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.opt.termguicolors = true
  vim.g.colors_name = "rustic-cream"

  -- Detect background
  local bg = vim.o.background or "dark"
  local palette = colors[bg] or colors.dark

  set_highlights(palette)
end

-- Expose colors for other plugins
M.colors = colors

M.load()

return M
