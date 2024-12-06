return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      ["python"] = { "autopep8" },
      ["css"] = { "prettier" },
      ["html"] = { "html-lsp" },
      ["htmldjango"] = { "html-lsp" },
      ["markdown"] = { "prettier", "markdownlint-cli2" },
      ["markdown.mdx"] = { "prettier", "markdownlint-cli2" },
    },
  },
}