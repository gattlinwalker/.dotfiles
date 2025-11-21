return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "html",
        "javascript",
        "typescript",
        "tsx",
        "css",
        "json",
        "lua",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "rust",
        "go",
        "ruby",
        "python",
      },
      sync_install = false,
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
        filetypes = {
          'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
          'handlebars',
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
  end
}
