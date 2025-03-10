return {
  'sindrets/diffview.nvim',
  cmd = "DiffviewOpen",
  keys = {
    "<leader>gd",
    "<leader>gD"
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    "diffview.nvim"
  },
  config = function()
    local diffview = require('diffview')
    diffview.setup()

    local diffviewOpen = false
    local toggleDiffview = function()
      if not diffviewOpen then
        diffviewOpen = true
        vim.cmd(":DiffviewOpen")
      else
        diffviewOpen = false
        vim.cmd(":DiffviewClose")
      end
    end
    vim.keymap.set("n", "<leader>gd", toggleDiffview)

    local diffviewHeadOpen = false
    local toggleDiffviewHead = function()
      if not diffviewHeadOpen then
        diffviewHeadOpen = true
        vim.cmd(":DiffviewOpen HEAD^")
      else
        diffviewHeadOpen = false
        vim.cmd(":DiffviewClose")
      end
    end
    vim.keymap.set("n", "<leader>gD", toggleDiffviewHead)
  end
}
