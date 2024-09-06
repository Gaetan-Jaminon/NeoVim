return {
  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",  -- LazyGit depends on this utility library
    },
    config = function()
      -- Optional: map a key to open LazyGit
      vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Set highlights for Git signs (using `vim.api.nvim_set_hl`)
      vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'DiffAdd' })
      vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'DiffChange' })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'DiffDelete' })
  
      -- Setup Gitsigns
      require('gitsigns').setup({
        signs = {
          add          = { text = '▎' },
          change       = { text = '▎' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
        },
        signcolumn = true,  -- Show signs in the sign column
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          follow_files = true  -- Watch for changes in git directory
        },
        current_line_blame = true,  -- Show blame info on current line
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 1000,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        max_file_length = 40000,  -- Disable for files longer than 40,000 lines
        preview_config = {
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
      })
    end
  }
}

