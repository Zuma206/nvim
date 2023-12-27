local mason_lspconfig = require("mason-lspconfig")
local lsp_servers = require("lsp_servers")

local ensure_installed = {}

for lsp_server, conf in pairs(lsp_servers) do
	if (conf["formatter"] or false) == false then
		table.insert(ensure_installed, lsp_server)
	end
end

local opts = {
	ensure_installed = ensure_installed
}

mason_lspconfig.setup(opts)
