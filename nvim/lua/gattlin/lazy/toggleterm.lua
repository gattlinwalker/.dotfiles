return {
  "akinsho/nvim-toggleterm.lua",
  keys = {
    { "<C-t>", "<cmd>ToggleTerm<cr>", desc = "Terminal" },
  },
  config = function()
    require("toggleterm").setup({
      direction = "horizontal",
      shell = vim.o.shell, -- change the default shell
      shade_terminals = true,
      float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'curved', --'single' | 'double' | 'shadow' |
        -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
        zindex = -1,
      },
    })

    -- Allow exiting terminal even in terminal mode
    vim.api.nvim_set_keymap("t", "<C-t>", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("i", "<C-t>", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "<C-t>", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })

    -- Easier escape from terminal buffers
    vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true, silent = true })
  end,
}
