return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = {
          severity = {
            min = vim.diagnostic.severity.ERROR,
          },
        },
      },
      servers = {
        yamlls = {
          settings = {
            yaml = {
              format = {
                enable = false,
              },
              keyOrdering = false,
            },
          },
        },
      },
    },
  },
}
