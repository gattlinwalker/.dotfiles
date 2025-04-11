return {
  {
    "folke/trouble.nvim",
    opts = {
      warn_no_results = false,
      indent_guides = false,
    },
    config = function()
      local trouble = require("trouble")
      trouble.setup({
        use_lsp_diagnostic_signs = true,
      })

      vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")

      vim.keymap.set("n", "]t", "<cmd>Trouble diagnostics next jump_only<cr>")
      vim.keymap.set("n", "[t", "<cmd>Trouble diagnostics prev jump_only<cr>")
    end
  },
}
