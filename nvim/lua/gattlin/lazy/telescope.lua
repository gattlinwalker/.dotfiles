return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local tele_actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = tele_actions.close,
          },
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true,
        },
      },
    })

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})

    vim.keymap.set("n", "<leader>pr", function()
      builtin.resume()
    end)
    vim.keymap.set("n", "<leader>ps", function()
      telescope.extensions.live_grep_args.live_grep_args({
        prompt_title = "Live Grep",
        default_text = '-i ' .. "'",
      })
    end)

    vim.keymap.set("n", "<leader>pws", function()
      require("telescope-live-grep-args.shortcuts").grep_word_under_cursor({
        prompt_title = "Searching for " .. vim.fn.expand("<cword>"),
        additional_args = "-i",
        postfix = " --iglob *",
        auto_quoting = true,
        prompt = "",
      })
    end)

    telescope.load_extension("live_grep_args")
  end,
}
