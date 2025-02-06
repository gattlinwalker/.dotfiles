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

local theme = everforest

return {
  theme.package,
  lazy = false,
  priority = 1000,
  config = theme.config
}
