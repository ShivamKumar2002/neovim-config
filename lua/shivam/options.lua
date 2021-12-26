local options = {
    number = true,                -- Enable numbered lines
    numberwidth = 4,              -- Set number column width
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
