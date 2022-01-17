local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local with_root_file = function(builtin, file)
    return builtin.with({
        condition = function(utils)
            return utils.root_has_file(file)
        end,
    })
end

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.eslint,
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.formatting.prettier,
        with_root_file(null_ls.builtins.formatting.stylua, "stylua.toml"),
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.flake8,
        with_root_file(null_ls.builtins.diagnostics.selene,  "selene.toml"),
        null_ls.builtins.diagnostics.phpcs,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.completion.spell,
    },
})
