-- LSP Format on save
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    -- 2
    vim.api.nvim_create_autocmd("BufWritePre", {
      -- 3
      buffer = args.buf,
      callback = function()
        -- 4 + 5
        vim.lsp.buf.format { async = false, id = args.data.client_id }
      end,
    })
  end
})

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local function quickfix()
  vim.lsp.buf.code_action({
    filter = function(a) return a.isPreferred end,
    apply = true
  })
end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gf', quickfix, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
-- vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
-- vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)
vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gH", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "gc", vim.lsp.buf.code_action, opts)

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
    "onsails/lspkind.nvim",
  },

  config = function()
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      cmp_lsp.default_capabilities(),
      vim.lsp.protocol.make_client_capabilities()
    )

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "gopls",
        "ruby_lsp",
        "vtsls", -- typescript
        "kotlin_language_server",
        "jdtls", -- java
        "tflint",
        "ltex",  -- markdown
        "html"
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,

        zls = function()
          local lspconfig = require("lspconfig")
          lspconfig.zls.setup({
            root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
            settings = {
              zls = {
                enable_inlay_hints = true,
                enable_snippets = true,
                warn_style = true,
              },
            },
          })
          vim.g.zig_fmt_parse_errors = 0
          vim.g.zig_fmt_autosave = 0
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,

        ["tflint"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.tflint.setup {}
        end,

        ["ruby_lsp"] = function()
          -- Rubocop is not that good of a formatter and can error easily. Instead
          -- of pulling up the error we just log so we can still work on the file
          local function custom_error_handler(err, method, params, client_id)
            if err then
              vim.notify("RuboCop error: " .. err.message, vim.log.levels.WARN)
            end
          end
          local lspconfig = require("lspconfig")
          lspconfig.ruby_lsp.setup {
            capabilities = capabilities,
            filetypes = { "ruby" },
            init_options = {
              formatter = 'rubocop', -- rubocop
            },
            handlers = {
              ["window/showMessage"] = custom_error_handler,
              ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
                -- Optionally, you can modify the diagnostic handler to filter out specific types of errors
                if result.diagnostics then
                  for _, diagnostic in ipairs(result.diagnostics) do
                    if diagnostic.severity == vim.lsp.protocol.DiagnosticSeverity.Error then
                      -- You can choose to ignore certain errors or modify how they are displayed
                    end
                  end
                end

                -- Call the default handler
                vim.lsp.handlers["textDocument/publishDiagnostics"](_, result, ctx, config)
              end,
            },
          }
        end,

        ["vtsls"] = function()
          require("lspconfig").vtsls.setup({
            settings = {
              vtsls = {
                experimental = {
                  completion = {
                    enableServerSideFuzzyMatch = true,
                    entriesLimit = 10,
                  },
                },
              },
              typescript = {
                inlayHints = {
                  parameterNames = { enabled = "literals" },
                  parameterTypes = { enabled = true },
                  variableTypes = { enabled = true },
                  propertyDeclarationTypes = { enabled = true },
                  functionLikeReturnTypes = { enabled = true },
                  enumMemberValues = { enabled = true },
                },
                tsserver = {
                  maxTsServerMemory = 8192,
                  -- log = "terse",
                },
              },
            },
            capabilities = capabilities,
          })
        end,

        ["kotlin_language_server"] = function()
          require("lspconfig").kotlin_language_server.setup {
            capabilities = capabilities,
            filetypes = { "kotlin" },
            settings = {
              kotlin = {
                inlayHints = {
                  includeInlayEnumMemberValueHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                },
                hint = { -- inlay hints
                  enable = true,
                  setType = true,
                  arrayIndex = "Disable", -- too noisy
                  semicolon = "Disable",  -- mostly wrong on invalid code
                },
              },
            },
          }
        end,

      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local lspkind = require('lspkind')

    cmp.setup({
      formatting = {
        format = lspkind.cmp_format({
          with_text = false,
          maxwidth = 50,
          show_labelDetails = true,
        })
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<Enter>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true
        }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ruby_lsp' },
        { name = 'luasnip' },
        { name = 'vtsls' },
        { name = 'kotlin_language_server' },
      }, {
        { name = 'buffer' },
      })
    })
  end
}
