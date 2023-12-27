local null_ls = require("null-ls")
local lsp_servers = require("lsp_servers")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {}
for server_name, opts in pairs(lsp_servers) do
	if opts["formatter"] == true then
		local source = null_ls.builtins.formatting[server_name]
		table.insert(sources, source)
	end
end

local opts = {
	sources = sources,
	on_attach = function (client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function ()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
}

null_ls.setup(opts)

