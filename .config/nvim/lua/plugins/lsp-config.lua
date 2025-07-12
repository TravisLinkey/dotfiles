return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "gopls", "html", "elixir-ls" },
      automatic_installation = false,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      lspconfig.eslint.setup({
        capabilities = capabilities
      })
      lspconfig.solargraph.setup({
        capabilities = capabilities
      })
      lspconfig.gopls.setup({
        capabilities = capabilities
      })
      lspconfig.emmet_language_server.setup({
        capabilities = capabilities,
        filetypes = { "html", "heex" },
      })
      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = { "html", "heex" },
        settings = {
          html = {
            format = {
              templating = true,
              wrapLineLength = 120,
              wrapAttributes = "auto",
            },
            suggest = {
              html5 = true,
            },
          },
        },
      })
      lspconfig.elixirls.setup({
        capabilities = capabilities,
        settings = {
          elixirLS = {
            dialyzerEnabled = true,
            fetchDeps = true,
            suggestSpecs = true,
            mixEnv = "dev",
          },
        },
      })
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {
                'vim',
                'require'
              },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.sourcekit.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
