local theme = {}

-- Convert color to #RRGGBB format
local function hex_color(color)
  return string.format("#%02X%02X%02X", bit.rshift(color, 16), bit.band(bit.rshift(color, 8), 0xFF), bit.band(color, 0xFF))
end

-- Define your colors
local colors = {
  bar = hex_color(0x000000),
  base = hex_color(0xfcaa05),
  pop1 = hex_color(0xde8150),
  pop2 = hex_color(0xFF0000),
  back = hex_color(0x020202),
  margin = hex_color(0x222425),
  margin_hover = hex_color(0x63523d),
  margin_active = hex_color(0x63523d),
  list_item = {hex_color(0x222425), hex_color(0x020202)},
  list_item_hover = {hex_color(0x362e25), hex_color(0x222425)},
  list_item_active = {hex_color(0x63523d), hex_color(0x222425)},
  cursor = {
    hex_color(0x00EE00),
    hex_color(0xe0741b),
    hex_color(0x1be094),
    hex_color(0xba60c4),
  },
  at_cursor = hex_color(0x0C0C0C),
  highlight_cursor_line = hex_color(0x1E1E1E),
  highlight = hex_color(0x303040),
  at_highlight = hex_color(0xFF44DD),
  mark = hex_color(0x494949),
  text_default = hex_color(0xb99468),
  comment = hex_color(0x666666),
  comment_pop = {hex_color(0x2ab34f), hex_color(0xdb2828)},
  keyword = hex_color(0xf0c674),
  str_constant = hex_color(0xffa900),
  int_constant = hex_color(0xffa900),
  preproc = hex_color(0xdc7575),
  special_character = hex_color(0xFF0000),
  highlight_junk = hex_color(0x3A0000),
  highlight_white = hex_color(0x003A3A),
  paste = hex_color(0xDDEE00),
  undo = hex_color(0x00DDEE),
  line_numbers_back = hex_color(0x101010),
  line_numbers_text = hex_color(0x404040),
}

-- Apply highlights
function theme.set_highlights()
  local set_hl = vim.api.nvim_set_hl

  -- General UI
  set_hl(0, "Normal", { bg = colors.back, fg = colors.text_default })
  set_hl(0, "CursorLine", { bg = colors.highlight_cursor_line })
  set_hl(0, "CursorColumn", { bg = colors.highlight_cursor_line })
  set_hl(0, "LineNr", { fg = colors.line_numbers_text, bg = colors.line_numbers_back })
  set_hl(0, "Comment", { fg = colors.comment, italic = true })
  set_hl(0, "Keyword", { fg = colors.keyword, bold = true })
  set_hl(0, "String", { fg = colors.str_constant })
  set_hl(0, "Constant", { fg = colors.int_constant })
  set_hl(0, "SpecialChar", { fg = colors.special_character })

  -- Search and highlight
  set_hl(0, "Search", { bg = colors.highlight, fg = colors.at_highlight })
  set_hl(0, "IncSearch", { bg = colors.pop1, fg = colors.back })

  -- Pmenu
  set_hl(0, "Pmenu", { bg = colors.margin, fg = colors.text_default })
  set_hl(0, "PmenuSel", { bg = colors.margin_hover, fg = colors.text_default })
  set_hl(0, "PmenuSbar", { bg = colors.margin })
  set_hl(0, "PmenuThumb", { bg = colors.margin_active })

  -- Visual mode
  set_hl(0, "Visual", { bg = colors.highlight, fg = colors.text_default })

  -- Transparent Background Option
  vim.api.nvim_set_hl(1, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function theme.ColorMyPencils(color)
  color = color or "industry"
  vim.cmd.colorscheme(color)
  theme.set_highlights()
end

function theme.setup()
  theme.ColorMyPencils()
end

return theme
