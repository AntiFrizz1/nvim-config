-- Markdown-specific settings applied when entering a markdown buffer

-- Auto-download missing spell files
vim.api.nvim_create_autocmd("SpellFileMissing", {
  callback = function(ev)
    local lang = ev.match
    local base = "https://raw.githubusercontent.com/me-vlad/spellfiles.vim/master/spell/"
    local spell_dir = vim.fn.stdpath("data") .. "/site/spell/"
    vim.fn.mkdir(spell_dir, "p")
    for _, ext in ipairs({ ".spl", ".sug" }) do
      local fname = lang .. ".utf-8" .. ext
      local dest = spell_dir .. fname
      if vim.fn.filereadable(dest) == 0 then
        vim.notify("Downloading spell file: " .. fname, vim.log.levels.INFO)
        vim.fn.system({ "curl", "-fsSL", base .. fname, "-o", dest })
      end
    end
    vim.cmd("silent! set spelllang=" .. vim.o.spelllang)
  end,
})

local augroup = vim.api.nvim_create_augroup("MarkdownSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "markdown",
  callback = function()
    local opt = vim.opt_local

    -- Soft-wrap at word boundaries for comfortable prose editing
    opt.wrap = true
    opt.linebreak = true
    opt.breakindent = true

    -- Spell checking (English + Russian)
    opt.spell = true
    opt.spelllang = "en_us,ru"

    -- Indentation: 2 spaces (GFM list continuation)
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.expandtab = true

    -- Conceal (render-markdown.nvim needs conceallevel >= 2)
    opt.conceallevel = 2
    opt.concealcursor = "" -- reveal syntax under cursor in all modes

    -- Wide enough text column for comfortable reading
    opt.textwidth = 0 -- don't hard-wrap automatically
    opt.colorcolumn = "120"

    -- Navigate visual (wrapped) lines with j/k
    vim.keymap.set("n", "j", "gj", { buffer = true, desc = "Move down (visual line)" })
    vim.keymap.set("n", "k", "gk", { buffer = true, desc = "Move up (visual line)" })

    -- Toggle GFM task-list checkbox under cursor: [ ] <-> [x]
    vim.keymap.set("n", "<leader>mx", function()
      local line = vim.api.nvim_get_current_line()
      local new_line
      if line:match("%- %[x%]") then
        new_line = line:gsub("%- %[x%]", "- [ ]", 1)
      elseif line:match("%- %[ %]") then
        new_line = line:gsub("%- %[ %]", "- [x]", 1)
      end
      if new_line then
        vim.api.nvim_set_current_line(new_line)
      end
    end, { buffer = true, desc = "Toggle GFM checkbox" })
  end,
})
