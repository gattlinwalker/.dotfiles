-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false
        }
      },
      window = {
        position = "right",
        mappings = {
          ["<C-b>"] = "close_window",
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
        }
      }
    })
    local events = require("neo-tree.events")
    events.fire_event(events.GIT_EVENT)

    vim.keymap.set({ "t", "n" }, "<C-b>", "<cmd>Neotree reveal<cr>", { noremap = true, silent = true })
  end,
}
