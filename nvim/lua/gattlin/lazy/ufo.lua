return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async'
  },
  event = 'BufReadPost',
  config = function()
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    
    -- Setup fillchars for fold icons - remove the connecting lines
    vim.o.fillchars = 'eob: ,fold: ,foldopen:▾,foldclose:▸,foldsep: '

    -- Using ufo provider need remap `zR` and `zM`
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

    -- Setup with treesitter and indent providers for automatic folding
    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
      end
    })
  end
}
