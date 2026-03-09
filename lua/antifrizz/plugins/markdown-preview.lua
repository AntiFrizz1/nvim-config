return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    -- Use GitHub-flavored markdown theme
    vim.g.mkdp_theme = "github"

    -- Open preview in a new browser tab
    vim.g.mkdp_open_to_the_world = 0
    vim.g.mkdp_browser = ""

    -- Auto-close preview when leaving markdown buffer
    vim.g.mkdp_auto_close = 1

    -- Refresh only on save or leaving insert mode (less flickering)
    vim.g.mkdp_refresh_slow = 0

    -- Display filename in browser tab
    vim.g.mkdp_page_title = "${name} — Preview"

    -- Enable GitHub-style syntax highlighting in fenced code blocks
    vim.g.mkdp_highlight_css = ""

    vim.keymap.set("n", "<leader>mv", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle markdown preview (browser)" })
  end,
}
