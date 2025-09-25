return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = "all",
      sync_install = false,
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
        filetypes = {
          'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
          'rescript',
          'css', 'lua', 'xml', 'php', 'markdown'
        },
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
    require 'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }
  end
}
