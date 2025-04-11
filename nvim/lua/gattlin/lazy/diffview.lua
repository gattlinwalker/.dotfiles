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
    local actions = require("diffview.actions")

    local diffviewOpen = false
    local toggleDiffview = function()
      if not diffviewOpen then
        vim.cmd(":DiffviewOpen")
      else
        vim.cmd(":DiffviewClose")
      end
    end

    local goto_file_edit = function()
      actions:goto_file_edit()
      vim.cmd('tabclose #')
    end

    local file_edit_mapping = {
      { "n" }, "gf", goto_file_edit, { desc = "Opening file in editor" }
    }

    require('diffview').setup({
      hooks = {
        view_opened = function(view)
          diffviewOpen = true
        end,
        view_closed = function(view)
          diffviewOpen = false
        end,
      },
      keymaps = {
        view = {
          file_edit_mapping
        },
        file_panel = {
          file_edit_mapping
        },
        file_history_panel = {
          file_edit_mapping
        }
      }
    })

    vim.keymap.set("n", "<leader>gd", toggleDiffview)
  end
}
