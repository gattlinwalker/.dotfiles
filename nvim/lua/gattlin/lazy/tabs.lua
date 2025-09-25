return {
  "romgrk/barbar.nvim",
  version = "*",
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  icons = {
    buffer_number = true,
  },
  init = function()
    vim.g.barbar_auto_setup = false

    -- Close buffer
    vim.keymap.set("n", "<C-w><C-k>", '<Cmd>BufferClose<CR>')

    -- Move to previous/next
    vim.keymap.set('n', '<leader>,', '<Cmd>BufferPrevious<CR>')
    vim.keymap.set('n', '<leader>.', '<Cmd>BufferNext<CR>')
  end,
  opts = {
    highlight_visible = true,
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    animation = false,
    -- insert_at_start = true,
    -- …etc.
  },
}
