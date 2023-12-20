require('lualine').setup {
  options = {
    icons_enabled = true,
    -- theme = 'gruvbox',
    -- theme = 'onedark',
    theme = 'kanagawa',
  },
  sections = {
    lualine_a = {
      { 'filename', path = 1 },
    },
  },
}
