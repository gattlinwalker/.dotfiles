return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("lualine").setup({
      options = {
<<<<<<< Updated upstream
        theme = "nord-dark",  -- Using custom nord-dark theme
||||||| Stash base
        theme = "everforest",
=======
        theme = "auto",
>>>>>>> Stashed changes
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1
          }
        }
      }
    })
  end,
}
