return {
  {
    -- ESLint plugin for additional features
    'esmuellert/nvim-eslint',
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require('nvim-eslint').setup({})
    end
  },
  {
    -- Main linting plugin
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- Use eslint_d (it will automatically pick up project's eslint.config.js)
      -- Configure linters by file type
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }

      -- Create autocommand which carries out the actual linting
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      
      -- Lint on these events
      vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          local ft = vim.bo.filetype
          if lint.linters_by_ft[ft] then
            lint.try_lint()
          end
        end,
      })

      -- Lint after formatting completes (triggered by formatter.nvim)
      vim.api.nvim_create_autocmd("User", {
        pattern = "FormatterPost",
        callback = function()
          local ft = vim.bo.filetype
          if lint.linters_by_ft[ft] then
            vim.defer_fn(function()
              lint.try_lint()
            end, 150)
          end
        end,
      })

      -- Manual linting keymap
      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })

      -- Manual ESLint fix keymap (format without saving)
      vim.keymap.set("n", "<leader>e", function()
        local file = vim.fn.expand("%:p")
        local local_eslint = vim.fn.findfile("node_modules/.bin/eslint", ".;")
        local eslint_cmd = "eslint"
        
        if local_eslint ~= "" then
          eslint_cmd = vim.fn.fnamemodify(local_eslint, ":p")
        end
        
        vim.fn.system(eslint_cmd .. " --fix " .. vim.fn.shellescape(file))
        vim.cmd("edit") -- Reload the file to show changes
        vim.notify("ESLint fix applied", vim.log.levels.INFO)
        -- Trigger linting after formatting
        vim.defer_fn(function()
          lint.try_lint()
        end, 100)
      end, { desc = "Fix with ESLint" })
    end,
  },
}
