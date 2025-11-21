return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      warn_no_results = false,
      open_no_results = false,
    },
    config = function()
      require("trouble").setup({
        modes = {
          diagnostics = {
            auto_open = false,
            auto_close = false,
            follow = true, -- Follow the cursor
            focus = false, -- Don't steal focus
          },
        },
      })

      -- Toggle trouble diagnostics
      vim.keymap.set("n", "<leader>tt", function()
        require("trouble").toggle("diagnostics")
      end, { desc = "Toggle Trouble Diagnostics" })

      -- Navigate between diagnostics
      vim.keymap.set("n", "]t", function()
        require("trouble").next({ skip_groups = true, jump = true })
      end, { desc = "Next Trouble Item" })

      vim.keymap.set("n", "[t", function()
        require("trouble").prev({ skip_groups = true, jump = true })
      end, { desc = "Previous Trouble Item" })
    end
  },
}
