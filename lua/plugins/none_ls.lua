return {
	"nvimtools/none-ls.nvim",
	init = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.clang_format,
			},
			on_attach = function(client, bufnr)
--[[ **TEMPORARILY DISABLING FORMAT ON SAVE**
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
--]]
			end,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
