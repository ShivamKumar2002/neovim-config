local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

mason_lspconfig.setup({
    ensure_installed = {},
    automatic_installation = true,
})

local opts = {
	on_attach = require("shivam.lsp.handlers").on_attach,
	capabilities = require("shivam.lsp.handlers").capabilities
}

mason_lspconfig.setup_handlers {
    -- The first entry (without a key) will be the default handler and will be called for each installed server that doesn't have a dedicated handler.

	-- default handler
    function (server_name)
		local require_ok, conf_opts = pcall(require, "shivam.lsp.settings." .. server_name)
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end
        require("lspconfig")[server_name].setup(opts)
    end,
}
