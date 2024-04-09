return {
  'nvim-neo-tree/neo-tree.nvim',
  opts = {
    filesystem = {
      filtered_items = {
        visible = false,
        show_hidden_count = true,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          '.git',
          'node_modules',
          'bun.lockb',
        },
      },
    },
  },
}
