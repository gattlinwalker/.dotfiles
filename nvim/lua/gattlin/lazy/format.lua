return {
  'mhartington/formatter.nvim',
  config = function()
    local util = require("formatter.util")

    local prettierd_fmt = function(path)
      return {
        exe = "prettierd",
        args = {
          path,
        },
        stdin = true,
        try_node_modules = true,
      }
    end

    local eslint_d_fmt = function()
      -- Use global eslint_d (it will pick up project's eslint.config.js automatically)
      return {
        exe = "eslint_d",
        args = {
          "--fix-to-stdout",
          "--stdin",
          "--stdin-filename",
          util.escape_path(util.get_current_buffer_file_path()),
        },
        stdin = true,
        cwd = vim.fn.getcwd(),
      }
    end

    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        javascript = {
          eslint_d_fmt,
        },
        javascriptreact = {
          eslint_d_fmt,
        },
        typescript = {
          eslint_d_fmt,
        },
        typescriptreact = {
          eslint_d_fmt,
        },
        rust = {
          function()
            return {
              exe = "rustfmt",
              args = {
                "--emit=stdout",
              },
              stdin = true,
            }
          end,
        },
        html = {
          function()
            return prettierd_fmt(util.escape_path(util.get_current_buffer_file_path()))
          end,
        },
        css = {
          function()
            return prettierd_fmt(util.escape_path(util.get_current_buffer_file_path()))
          end,
        },
        handlebars = {
          function()
            return prettierd_fmt(util.escape_path(util.get_current_buffer_file_path()))
          end,
        },
        markdown = {
          function()
            return prettierd_fmt(util.escape_path(util.get_current_buffer_file_path()))
          end,
        },
        json = {
          function()
            return prettierd_fmt(util.escape_path(util.get_current_buffer_file_path()))
          end,
        },
      },
    })

    -- Auto-format on save
    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function()
        vim.cmd("FormatWrite")
      end,
    })
  end,
}
