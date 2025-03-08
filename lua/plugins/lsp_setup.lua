return {
  {
    "williamboman/mason.nvim",
    config = true
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = { "lua_ls", "pico8_ls" } }
  },
  {
    "neovim/nvim-lspconfig",
    init = function ()
      local lspconfig = require("lspconfig")

      local on_attach = function(client, bufnr)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set({ 'n', 'v' }, "<leader>ca", vim.lsp.buf.code_action, {})
      end

      lspconfig.lua_ls.setup({ on_attach = on_attach })
      lspconfig.pico8_ls.setup({ on_attach = on_attach })

      lspconfig.clangd.setup({
        cmd = { "clangd", "--header-insertion=never" },
        on_attach = on_attach
      })
    end
  }
}
