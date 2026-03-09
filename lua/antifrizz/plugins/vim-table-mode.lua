return {
  "dhruvasagar/vim-table-mode",
  ft = { "markdown" },
  config = function()
    -- Use GitHub-Flavored Markdown pipe-table style (| separator)
    vim.g.table_mode_corner = "|"

    -- Keymaps are prefixed with <leader>t by default:
    --   <leader>tm  — toggle table mode
    --   <leader>tdd — delete row
    --   <leader>tdc — delete column
    --   <leader>tic — insert column
    --   <leader>tt  — convert delimiter-separated content to table
    --   <leader>T   — tableize (create table from CSV/TSV)
  end,
}
