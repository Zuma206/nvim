local lspconfig = require("lspconfig")
local lsp_servers = require("lsp_servers")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local keybinds = require("keybinds")

local capabilities = cmp_nvim_lsp.default_capabilities()

for lsp_server, conf in pairs(lsp_servers) do
    if (conf["formatter"] or false) == false then
        local opts = conf["lspconfig"] or {}
        opts.capabilities = capabilities
        lspconfig[lsp_server].setup(opts)
    end
end

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        keybinds.lsp(opts)
    end,
})
