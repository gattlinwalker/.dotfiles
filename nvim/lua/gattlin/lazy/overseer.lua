return {
  'stevearc/overseer.nvim',
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-telescope/telescope.nvim',
    'rcarriga/nvim-notify',
    'folke/trouble.nvim',
  },
  keys = {
    { '<leader>ot',  '<cmd>OverseerToggle<CR>',                 desc = 'Overseer' },
    { '<leader>or',  '<cmd>OverseerRun<CR>',                    desc = 'Overseer Run' },
    { '<leader>oi',  '<cmd>OverseerInfo<CR>',                   desc = 'Overseer Info' },
    { '<leader>oc',  '<cmd>OverseerClearCache<CR>',             desc = 'Overseer Clear Cache' },
    { '<leader>tf',  '<cmd>OverseerRun test_file<CR>',          desc = 'Overseer Run: Test File' },
    { '<leader>tfl', '<cmd>OverseerRun test_specific_line<CR>', desc = 'Overseer Run: Test Specific Line' },
  },
  opts = {
    templates = {
      "user.test_file",
      "user.test_specific_line"
    },
    strategy = {
      "toggleterm",
      -- load your default shell before starting the task
      use_shell = true,
      auto_scroll = true,
      open_on_start = true,
      hidden = true,
    },
  },
}
