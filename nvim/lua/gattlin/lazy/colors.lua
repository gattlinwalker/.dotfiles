local everforest = {
  package = 'neanias/everforest-nvim',
  config = function()
    local everforest = require('everforest')
    everforest.setup {
      background = "hard",
      transparent_background_level = 0,
    }
    everforest.load()
  end,
}

local nordic = {
  package = 'AlexvZyl/nordic.nvim',
  config = function()
    require('nordic').load()
  end
}

-- Change this to switch themes: "everforest", "nordic", or "nord_dark"
local active_theme = "nord_dark"

-- Load custom theme if selected (not managed by lazy.nvim)
if active_theme == "nord_dark" then
  require("nord-dark").setup()
  return {}  -- Return empty table so lazy.nvim doesn't try to load anything
end

-- Otherwise return the plugin-based theme
local themes = {
  everforest = everforest,
  nordic = nordic,
}

local theme = themes[active_theme]

return {
  theme.package,
  lazy = false,
  priority = 1000,
  config = theme.config
}
