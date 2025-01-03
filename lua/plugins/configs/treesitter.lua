require("nvim-treesitter.configs").setup {
  -- ensure_installed = { "lua", "vim", "vimdoc", "html", "css", "typescript", "javascript" },
  auto_install = true,

  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
}
