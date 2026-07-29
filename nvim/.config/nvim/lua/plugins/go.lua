return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              staticcheck = true,
              analyses = { nilness = true, unusedparams = true, useany = true },
              hints = { parameterNames = true, variableTypes = true, constantValues = true },
              codelenses = { test = true, tidy = true, generate = true },
            },
          },
        },
      },
    },
  },
}
