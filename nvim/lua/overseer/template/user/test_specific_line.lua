return {
  name = "test_specific_line",
  builder = function()
    local file = vim.fn.expand("%:p")
    local extension = vim.fn.expand('%:e')
    local line_num = vim.api.nvim__buf_stats(0).current_lnum

    local cmd_opts = {}

    if extension == "rb" then
      cmd_opts = {
        cmd = { "rt" },
        args = { file .. ":" .. tostring(line_num) },
      }
    elseif extension == "js" or extension == "ts" then
      cmd_opts = {
        cmd = { "yarn" },
        args = { "test", "--", file },
      }
    else
      error("invalid operation")
    end

    return cmd_opts
  end,
}
