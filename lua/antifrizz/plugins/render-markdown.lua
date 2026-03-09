return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  ft = { "markdown", "md" },
  config = function()
    require("render-markdown").setup({
      -- Render markdown in normal mode only (disable in insert to keep editing clean)
      render_modes = { "n", "c" },
      heading = {
        -- Different signs/icons per heading level
        signs = { "󰫎 " },
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        -- Highlight backgrounds per level
        backgrounds = {
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "RenderMarkdownH3Bg",
          "RenderMarkdownH4Bg",
          "RenderMarkdownH5Bg",
          "RenderMarkdownH6Bg",
        },
      },
      code = {
        -- Show the language icon in fenced code blocks
        sign = true,
        style = "full",
        border = "thin",
      },
      -- GFM: task list checkboxes
      checkbox = {
        enabled = true,
        unchecked = {
          icon = "󰄱 ",
          highlight = "RenderMarkdownUnchecked",
        },
        checked = {
          icon = "󰱒 ",
          highlight = "RenderMarkdownChecked",
        },
        custom = {
          todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
        },
      },
      -- GFM: tables
      pipe_table = {
        enabled = true,
        style = "full",
        cell = "padded",
      },
      -- Bullet list icons per level
      bullet = {
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
      },
      -- Blockquotes and callouts (GitHub callouts: > [!NOTE] etc.)
      quote = {
        enabled = true,
        icon = "▋",
      },
      callout = {
        note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
        tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
        important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
        warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
        caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
      },
      -- Horizontal rules
      dash = {
        enabled = true,
        icon = "─",
      },
      link = {
        enabled = true,
        image = "󰥶 ",
        hyperlink = "󰌹 ",
      },
    })

    -- Toggle rendering on/off
    vim.keymap.set("n", "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", { desc = "Toggle markdown render" })
  end,
}
