vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.ts = 4
vim.opt.et = true
vim.opt.ai = true
vim.opt.lbr = true
vim.opt.syntax = "on"
vim.opt.signcolumn = "yes"
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 1
vim.opt.ttyfast = true
vim.opt.winborder = "rounded"
-- vim.opt.foldmethod = "indent"
vim.cmd("colorscheme dark2026")
vim.o.guifont = "Cascadia Code:h14"
vim.g.neovide_cursor_animation_length = 0

vim.g.mapleader = " "
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)

vim.keymap.set('n', '<leader>bp', function() vim.cmd('bp') end)
vim.keymap.set('n', '<leader>bn', function() vim.cmd('bn') end)
vim.keymap.set('n', '<leader>ww', function() print(vim.fn.wordcount().words) end)

vim.cmd[[set completeopt+=menuone,noinsert,popup]]
vim.keymap.set('i', '<C-space>', function()
    vim.lsp.completion.get()
end)
--
-- vim.keymap.set('i', '<Tab>', function()
--     vim.lsp.completion.get()
-- end)

vim.keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<Tab>"
end, { expr = true })


vim.lsp.config("rust-analyzer", {
    filetypes = { "rust" },
    cmd = {"rust-analyzer"},
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
        },
    },
    on_attach = function(client, bufnr)
        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true,
        })
    end
})
vim.lsp.config("python-lsp-server", {
    filetypes = { "python" },
    cmd = {"pylsp"},
    on_attach = function(client, bufnr)
        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true,
        })
    end
})
vim.lsp.config("svls", {
    filetypes = { "verilog", "systemverilog" },
    cmd = {"svls"},
    on_attach = function(client, bufnr)
        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true,
        })
    end
})
vim.lsp.config("clangd", {
    filetypes = { "c", "cpp" },
    cmd = {"clangd", "--experimental-modules-support"},
    on_attach = function(client, bufnr)
        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true,
        })
    end
})
vim.lsp.config("uiua", {
    filetypes = { "uiua" },
    cmd = {"uiua", "lsp"},
    root_markers = { 'main.ua', '.fmt.ua', '.git' },
    on_attach = function(client, bufnr)
        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true,
        })
    end
})
vim.lsp.enable({
    "rust-analyzer",
    "python-lsp-server",
    "svls",
    "clangd",
    "uiua",
})

vim.pack.add({
    "https://github.com/Julian/lean.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
})

require("lean").setup{
    abbreviations = { builtin = true },
    mappings = true,
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
