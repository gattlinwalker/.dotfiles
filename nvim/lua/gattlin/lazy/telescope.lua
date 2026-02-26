return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-frecency.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local tele_actions = require("telescope.actions")

    -- Set up custom highlight for bold filenames
    vim.api.nvim_set_hl(0, "TelescopeResultsFileName", { bold = true })

    telescope.setup({
      defaults = {
        layout_config = {
          horizontal = {
            preview_width = 0.45,
          },
        },
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
        frecency = {
          show_scores = false,
          show_unindexed = true,
          ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
          disable_devicons = false,
          auto_validate = true,  -- Automatically validate and clean up entries
          db_safe_mode = false,  -- Don't prompt for confirmation
          workspaces = {
            ["conf"] = vim.env.HOME .. "/.config",
            ["project"] = vim.env.HOME .. "/projects",
          },
        },
      },
    })

    local builtin = require('telescope.builtin')
<<<<<<< Updated upstream

    -- Use frecency for intelligent file finding (shows frequently/recently used files first)
    vim.keymap.set('n', '<C-p>', function()
      telescope.extensions.frecency.frecency({
        workspace = 'CWD',
        path_display = function(opts, path)
          -- Extract just the filename (no path components)
          local filename = vim.fn.fnamemodify(path, ":t")

          -- Get the parent directory
          local parent = vim.fn.fnamemodify(path, ":h")

          -- Make parent relative to cwd
          local cwd = vim.fn.getcwd()
          if vim.startswith(parent, cwd) then
            parent = parent:sub(#cwd + 2) -- +2 to remove leading slash
            if parent == "" then
              parent = "."
            end
          end

          -- Handle current directory
          if parent == "." then
            return filename
          end

          -- Return display: filename first, then path
          return string.format("%s - %s", filename, parent)
        end,
      })
    end, {})
||||||| Stash base
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
=======
    -- Use frecency for intelligent file finding (shows frequently/recently used files first)
    vim.keymap.set('n', '<C-p>', function()
      telescope.extensions.frecency.frecency({
        workspace = 'CWD',
        path_display = function(opts, path)
          -- Extract just the filename (no path components)
          local filename = vim.fn.fnamemodify(path, ":t")

          -- Get the parent directory
          local parent = vim.fn.fnamemodify(path, ":h")

          -- Make parent relative to cwd
          local cwd = vim.fn.getcwd()
          if vim.startswith(parent, cwd) then
            parent = parent:sub(#cwd + 2) -- +2 to remove leading slash
            if parent == "" then
              parent = "."
            end
          end

          -- Handle current directory
          if parent == "." then
            return filename
          end

          -- Return display: filename first, then path
          return string.format("%s - %s", filename, parent)
        end,
      })
    end, {})

    -- VSCode-like quick-open with path-aware fuzzy matching.
    vim.keymap.set('n', '<C-p>', function()
      builtin.find_files({
        hidden = true,
        no_ignore = false,
        path_display = { "smart" },
      })
    end, { desc = "Find files" })

    -- Keep frecency available when you want recency/frequency scoring.
    vim.keymap.set("n", "<leader>pf", function()
      telescope.extensions.frecency.frecency({
        workspace = 'CWD',
        path_display = { "smart" },
      })
    end, { desc = "Find files (frecency)" })
>>>>>>> Stashed changes

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
    telescope.load_extension("frecency")
  end,
}
