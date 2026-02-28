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
      ensure_installed = { "lua_ls", "ts_ls", "gopls", "html", "elixir-ls", "markdown_oxide" },
      automatic_installation = false,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Capabilities (e.g. for nvim-cmp); fallback if cmp_nvim_lsp not loaded
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok and cmp_lsp then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- Global default: all configs get these capabilities
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Server-specific overrides (nvim-lspconfig provides base configs via lsp/*.lua)
      vim.lsp.config("ts_ls", {})
      vim.lsp.config("eslint", {})
      vim.lsp.config("solargraph", {})
      vim.lsp.config("gopls", {})
      vim.lsp.config("emmet_language_server", {
        filetypes = { "html", "heex" },
      })
      vim.lsp.config("html", {
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
      vim.lsp.config("elixirls", {
        cmd = { "elixir-ls" },
        settings = {
          elixirLS = {
            dialyzerEnabled = true,
            fetchDeps = true,
            suggestSpecs = true,
            mixEnv = "dev",
          },
        },
      })
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = {
              globals = { "vim", "require" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
          },
        },
      })
      vim.lsp.config("clangd", {
        init_options = {
          fallbackFlags = {
            "-I/opt/homebrew/include",
            "-I/usr/local/include",
          },
        },
      })
      vim.lsp.config("sourcekit", {})

      -- markdown-oxide: PKM Markdown LSP (Obsidian-compatible; link resolution, backlinks, etc.)
      -- https://github.com/Feel-ix-343/markdown-oxide
      vim.lsp.config("markdown_oxide", {
        capabilities = vim.tbl_deep_extend("force", capabilities, {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        }),
      })

      -- Enable all configured servers (uses filetypes from nvim-lspconfig's lsp/*.lua)
      for _, name in ipairs({
        "ts_ls",
        "eslint",
        "solargraph",
        "gopls",
        "emmet_language_server",
        "html",
        "elixirls",
        "lua_ls",
        "clangd",
        "sourcekit",
        "markdown_oxide",
      }) do
        vim.lsp.enable(name)
      end

      -- Keymaps (optional; Neovim 0.11+ sets K, grr, gra, etc. by default)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
