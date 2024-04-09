local vue_language_server_path = '/opt/homebrew/lib/node_modules/@vue/language-server'

local function organize_imports()
  local params = {
    command = '_typescript.organizeImports',
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end
return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'stylua',
        'luacheck',
        'kotlin-language-server',
        'gradle-language-server',
        'html-lsp',
        'css-lsp',
        'emmet-language-server',
        'vue-language-server',
      })
    end,
  },
  -- lsp servers
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'jose-elias-alvarez/typescript.nvim',
      init = function()
        require('lazyvim.util').lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set('n', '<leader>cR', 'TypescriptRenameFile', { desc = 'Rename File', buffer = buffer })
        end)
      end,
    },
    -- keys = {
    --   { '<Leader>ce', '<Cmd>EslintFixAll<Return>', desc = 'Eslint FixAll' },
    --   { 'gd', '<Cmd>Telescope lsp_definitions<Return>', desc = 'Goto Definition' },
    --   { 'gi', '<Cmd>Telescope lsp_implementations<Return>', desc = 'Goto Definition' },
    -- },
    opts = {
      servers = {
        cssls = {
          settings = {
            css = {
              validate = true,
              lint = {
                unknownAtRules = 'ignore',
              },
            },
            scss = {
              validate = true,
              lint = {
                unknownAtRules = 'ignore',
              },
            },
            less = {
              validate = true,
              lint = {
                unknownAtRules = 'ignore',
              },
            },
          },
        },
        tailwindcss = {
          root_dir = function(...)
            return require('lspconfig.util').root_pattern('tailwind.config.*')(...)
          end,
        },
        tsserver = {
          commands = {
            OrganizeImports = {
              organize_imports,
              description = 'Organize Imports',
            },
          },
          keys = {
            { '<leader>co', '<cmd>OrganizeImports<CR>', desc = 'Organize Imports' },
            { '<leader>cR', '<cmd>TypescriptRenameFile<CR>', desc = 'Rename File' },
            { '<Leader>ce', '<Cmd>EslintFixAll<Return>', desc = 'Eslint FixAll' },
          },
          init_options = {
            plugins = {
              {
                name = '@vue/typescript-plugin',
                location = vue_language_server_path,
                languages = { 'vue' },
              },
            },
          },
          filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        },
        volar = {},
        -- volar = {
        --   init_options = {
        --     vue = {
        --       hybridMode = false,
        --     },
        --   },
        -- },
      },
    },
  },
}
