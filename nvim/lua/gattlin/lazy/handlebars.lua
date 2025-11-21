return {
  "mustache/vim-mustache-handlebars",
  ft = { "handlebars", "hbs", "mustache" },
  config = function()
    -- Set up filetype detection
    vim.filetype.add({
      extension = {
        hbs = "handlebars",
        handlebars = "handlebars",
      },
    })
    
    -- Enable syntax highlighting
    vim.g.mustache_abbreviations = 1
  end,
}
