return {
  'mhartington/formatter.nvim',
  config = function()
    vim.api.nvim_exec(
      [[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePost * FormatWrite
        augroup END
      ]],
      true
    )
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

    require("formatter").setup({
      filetype = {
        rust = {
          -- Rustfmt
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
        -- SAMPLE for prettier
        -- javascript = {
        --   function()
        --     return prettierd_fmt(util.escape_path(util.get_current_buffer_file_path()))
        --   end,
        -- },
        -- javascriptreact = {
        --   function()
        --     return prettierd_fmt(util.escape_path(util.get_current_buffer_file_path()))
        --   end,
        -- },
        -- typescript = {
        --   function()
        --     return prettierd_fmt(util.escape_path(util.get_current_buffer_file_path()))
        --   end,
        -- },
        -- typescriptreact = {
        --   function()
        --     return prettierd_fmt(util.escape_path(util.get_current_buffer_file_path()))
        --   end,
        -- },
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
  end,
}
