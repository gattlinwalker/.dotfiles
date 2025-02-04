return {
  name = "test_file",
  builder = function()
    local file = vim.fn.expand("%:p")
    local extension = vim.fn.expand('%:e')

    local cmd_opts = {}

    if extension == "rb" then
      cmd_opts = {
        cmd = { "rt" },
        args = { file },
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
