local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
    group = augroup("highlight_yank", { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})

-- Equalize splits on resize
autocmd("VimResized", {
    group = augroup("resize_splits", { clear = true }),
    command = "wincmd =",
})

-- Close certain buffers with q
autocmd("FileType", {
    group = augroup("q_close", { clear = true }),
    pattern = { "help", "qf", "lspinfo", "man" },
    callback = function(event)
      vim.bo[event.buf].buflisted = false
      vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- Show different EOL glyphs for LF vs CRLF
autocmd({ "BufReadPost", "BufFilePost" }, {
    group = augroup("eol_marker", { clear = true }),
    callback = function()
      if vim.bo.fileformat == "dos" then
        vim.opt_local.listchars:append({ eol = "␍␊" }) -- CRLF
      else
        vim.opt_local.listchars:append({ eol = "↴" })   -- LF
      end
    end,
})
