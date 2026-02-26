return {
<<<<<<< Updated upstream
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
||||||| Stash base

  { -- Linting
=======
  {
    -- ESLint plugin for additional features
    'esmuellert/nvim-eslint',
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      local function real_buf_path(bufnr)
        local name = vim.api.nvim_buf_get_name(bufnr)
        if name == "" or name:match("^%a+view:") or name:match("^fugitive://") then
          return nil
        end

        if vim.fn.filereadable(name) == 1 then
          return name
        end

        return nil
      end

      local function eslint_root(bufnr)
        local path = real_buf_path(bufnr)
        if not path then
          return nil
        end

        local markers = {
          "eslint.config.js",
          "eslint.config.mjs",
          "eslint.config.cjs",
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.json",
          "package.json",
          ".git",
        }
        return vim.fs.root(path, markers)
      end

      require('nvim-eslint').setup({
        root_dir = function(bufnr)
          return eslint_root(bufnr)
        end,
        handlers = {
          ["eslint/noLibrary"] = function()
            return nil
          end,
        },
        settings = {
          workingDirectory = function(bufnr)
            local root = eslint_root(bufnr)
            if root then
              return { directory = root }
            end

            return nil
          end,
        },
      })
    end
  },
  {
    -- Main linting plugin
>>>>>>> Stashed changes
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
<<<<<<< Updated upstream

      -- Use eslint_d (it will automatically pick up project's eslint.config.js)
      -- Configure linters by file type
||||||| Stash base
=======

      local function real_buf_path(bufnr)
        local name = vim.api.nvim_buf_get_name(bufnr)
        if name == "" or name:match("^%a+view:") or name:match("^fugitive://") then
          return nil
        end

        if vim.fn.filereadable(name) == 1 then
          return name
        end

        return nil
      end

      local function eslint_root(bufnr)
        local path = real_buf_path(bufnr)
        if not path then
          return nil
        end

        local markers = {
          "eslint.config.js",
          "eslint.config.mjs",
          "eslint.config.cjs",
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.json",
          "package.json",
          ".git",
        }
        return vim.fs.root(path, markers)
      end

      local function lint_cwd(bufnr)
        return eslint_root(bufnr) or vim.fn.getcwd()
      end

      local function should_lint_buffer(bufnr)
        if vim.bo[bufnr].buftype ~= "" then
          return false
        end

        return real_buf_path(bufnr) ~= nil
      end

      lint.linters.eslint_d = vim.tbl_deep_extend("force", lint.linters.eslint_d, {
        cmd = function()
          local root = lint_cwd(0)
          local local_cmd = vim.fs.joinpath(root, "node_modules", ".bin", "eslint_d")
          if vim.fn.executable(local_cmd) == 1 then
            return local_cmd
          end

          return "eslint_d"
        end,
      })

      -- Use eslint_d (it will automatically pick up project's eslint.config.js)
      -- Configure linters by file type
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          local ft = vim.bo.filetype
          if lint.linters_by_ft[ft] then
            lint.try_lint()
          end
||||||| Stash base
          lint.try_lint()
=======
          if not should_lint_buffer(0) then
            return
          end

          local ft = vim.bo.filetype
          if lint.linters_by_ft[ft] then
            lint.try_lint(nil, { cwd = lint_cwd(0) })
          end
>>>>>>> Stashed changes
        end,
      })
<<<<<<< Updated upstream

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
||||||| Stash base
=======

      -- Lint after formatting completes (triggered by formatter.nvim)
      vim.api.nvim_create_autocmd("User", {
        pattern = "FormatterPost",
        callback = function()
          if not should_lint_buffer(0) then
            return
          end

          local ft = vim.bo.filetype
          if lint.linters_by_ft[ft] then
            vim.defer_fn(function()
              lint.try_lint(nil, { cwd = lint_cwd(0) })
            end, 150)
          end
        end,
      })

      -- Manual linting keymap
      vim.keymap.set("n", "<leader>l", function()
        if not should_lint_buffer(0) then
          vim.notify("Skipping lint for non-file buffer", vim.log.levels.INFO)
          return
        end

        lint.try_lint(nil, { cwd = lint_cwd(0) })
      end, { desc = "Trigger linting for current file" })

      -- Manual ESLint fix keymap (format without saving)
      vim.keymap.set("n", "<leader>e", function()
        if not should_lint_buffer(0) then
          vim.notify("Skipping ESLint fix for non-file buffer", vim.log.levels.INFO)
          return
        end

        local file = vim.fn.expand("%:p")
        local cwd = lint_cwd(0)
        local eslint_cmd = vim.fs.joinpath(cwd, "node_modules", ".bin", "eslint")
        
        if vim.fn.executable(eslint_cmd) ~= 1 then
          eslint_cmd = "eslint"
        end
        
        if vim.system then
          vim.system({ eslint_cmd, "--fix", file }, { cwd = cwd }):wait()
        else
          vim.fn.system(eslint_cmd .. " --fix " .. vim.fn.shellescape(file))
        end
        vim.cmd("edit") -- Reload the file to show changes
        vim.notify("ESLint fix applied", vim.log.levels.INFO)
        -- Trigger linting after formatting
        vim.defer_fn(function()
          lint.try_lint(nil, { cwd = lint_cwd(0) })
        end, 100)
      end, { desc = "Fix with ESLint" })
>>>>>>> Stashed changes
    end,
  },
}
