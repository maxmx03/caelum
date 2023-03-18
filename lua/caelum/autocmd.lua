if vim.fn.has("nvim-0.8.3") then
	vim.api.nvim_create_autocmd("Colorscheme", {
		callback = function()
			local set_hl = function(name, val)
				vim.api.nvim_set_hl(0, name, val)
			end

			set_hl("@lsp.type.parameter", { link = "@parameter" })
			set_hl("@lsp.typemod.parameter.readyonly", { italic = true })
			set_hl("@lsp.typemod.variable.readonly", { link = "@variable.builtin" })
			set_hl("@lsp.typemod.variable.defaultLibrary.typescript", { link = "@variable.builtin" })
			set_hl("@lsp.type.class", { link = "@type" })
		end,
	})

	vim.api.nvim_create_autocmd("LspTokenUpdate", {
		callback = function(args)
			local token = args.data.token

			if token.type ~= "variable" or token.modifiers.readonly then
				return
			end

			local text =
				vim.api.nvim_buf_get_text(args.buf, token.line, token.start_col, token.line, token.end_col, {})[1]

			if text ~= string.upper(text) then
				return
			end

			vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, "@constant")
		end,
	})
end
