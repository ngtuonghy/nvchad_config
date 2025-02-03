return {
  formatters_by_ft = {
    svelte = { "svelte_fmt" },
    lua = { "stylua" },
    c = { "clang-format" },
    cs = { "clang-format" },
    cpp = { "clang-format" },
    java = { "clang-format" },
    sql = { "sqlfluff" },

    -- webdev
    javascript = { "biome" },
    javascriptreact = { "biome" },
    typescript = { "biome" },
    typescriptreact = { "biome" },
    vue = { "prettier" },

    css = { "biome" },
    html = { "prettier" },
    json = { "biome" },
    jsonc = { "biome" },

    sh = { "shfmt" },
    yaml = { "yamlfmt" },
  },
}
