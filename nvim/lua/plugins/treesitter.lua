return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = {
      'html',
      'css',
      'scss',
      'java',
      'kotlin',
      'go',
      'javascript',
      'typescript',
      'tsx',
      'sql',
      'gitignore',
      'vimdoc',
      'markdown',
      'lua',
      'javascript',
      'typescript',
      'vue',
      'python',
    },
    incremental_selection = {
      enable = true,
      -- keymaps = {
      --   init_selection = ',',
      --   node_incremental = ',',
      --   scope_incremental = false,
      --   node_decremental = '.',
      -- },
    },
  },
}
