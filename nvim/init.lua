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
-- vim.cmd("colorscheme retrobox")
vim.cmd("colorscheme vim")

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)

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
vim.lsp.enable({
    "rust-analyzer",
    "python-lsp-server",
    "svls",
})
