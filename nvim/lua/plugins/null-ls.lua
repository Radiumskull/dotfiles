require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.rubocop,
        require("null-ls").builtins.formatting.rubocop,
        require("null-ls").builtins.code_actions.eslint_d,
        require("null-ls").builtins.diagnostics.eslint_d,
        require("null-ls").builtins.formatting.eslint_d
    },
})
