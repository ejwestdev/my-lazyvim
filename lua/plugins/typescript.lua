return {
  -- ESLint integration via LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {},
      },
      setup = {
        eslint = function()
          -- auto-fix on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(event)
              local client = vim.lsp.get_clients({ bufnr = event.buf, name = "eslint" })[1]
              if client then
                local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                if #diag > 0 then
                  vim.cmd("EslintFixAll")
                end
              end
            end,
          })
        end,
      },
    },
  },

  -- Prettier + eslint_d via Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "eslint_d",
        "css-lsp",
      },
    },
  },

  -- Formatting with prettierd
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        markdown = { "prettierd" },
        yaml = { "prettierd" },
        graphql = { "prettierd" },
      },
    },
  },

  -- Extra treesitter parsers for full-stack Next.js
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
        "javascript",
        "html",
        "css",
        "json",
        "json5",
        "jsonc",
        "graphql",
        "prisma",
        "markdown",
        "markdown_inline",
      })
    end,
  },

  -- Auto close and rename JSX/HTML tags
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },
}
