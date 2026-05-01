return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      win_options = {
        conceallevel = {
          default = 0,
          rendered = 3,
        },
      },
      bullet = {
        icons = {},
      },
    },
  },
}
