local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("shivam.lsp.mason-lspconfig")
require("shivam.lsp.handlers").setup()
