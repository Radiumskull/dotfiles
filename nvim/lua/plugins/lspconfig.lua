local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig')['solargraph'].setup {
  capabilities = capabilities
}

require('lspconfig')['tsserver'].setup {
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require'lspconfig'.emmet_ls.setup{
  capabilities = capabilities,
}

