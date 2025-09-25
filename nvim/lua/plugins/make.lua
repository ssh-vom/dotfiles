-- lua/plugins/make.lua
return {
  {
    "tpope/vim-dispatch",         -- async :Make / :Dispatch
    cmd = { "Make", "Dispatch" },
    init = function()
      -- zsh sometimes chokes on default redirs from :make; this makes it predictable
      if vim.o.shell:match("zsh") then
        vim.cmd([[set shellredir=>%s\ 2>&1]])
      end

      local grp = vim.api.nvim_create_augroup("python_make_quickfix", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        group = grp,
        pattern = "python",
        callback = function()
          -- Safe quoting for sh/zsh; always run ruff, then (based)pyright fallback to pyright
          vim.bo.makeprg = [[sh -lc "ruff check --format=unix .; if command -v basedpyright >/dev/null 2>&1; then basedpyright; elif command -v pyright >/dev/null 2>&1; then pyright; else echo 'pyright/basedpyright not found' >&2; fi"]]

          -- Quickfix patterns
          -- ruff:      file:line:col: CODE message
          -- pyright:   file:line:col - error|warning|information: message
          vim.bo.errorformat = table.concat({
            "%f:%l:%c: %m",                  -- ruff (unix)
            "%f:%l:%c - %trror: %m",         -- pyright/basedpyright: error
            "%f:%l:%c - %tarning: %m",       -- pyright/basedpyright: warning
            "%f:%l:%c - %tnformation: %m",   -- pyright/basedpyright: information
            -- Ignore noisy summary/progress lines (harmless if not present)
            "%-G%\\d%# files%#",
            "%-G%\\d%# errors%#",
            "%-G%\\d%# warnings%#",
            "%-GCompleted%#",
            "%-GNo configuration%#",
          }, ",")

          -- Convenient key: async if :Make exists (dispatch), otherwise sync :make
          vim.keymap.set("n", "<leader>m", function()
            if vim.fn.exists(":Make") == 2 then
              vim.cmd("Make!")    -- async build
            else
              vim.cmd("silent make!") -- sync fallback
            end
          end, { buffer = true, desc = "Python make (ruff + pyright)" })
        end,
      })

      -- Auto-open quickfix if there are entries
      vim.api.nvim_create_autocmd("QuickFixCmdPost", {
        group = grp,
        pattern = { "make", "Make" },
        callback = function()
          local qf = vim.fn.getqflist()
          if type(qf) == "table" and not vim.tbl_isempty(qf) then
            vim.cmd("cwindow")
          end
        end,
      })
    end,
  },
}

