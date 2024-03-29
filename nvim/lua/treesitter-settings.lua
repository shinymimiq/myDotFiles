require'nvim-treesitter.configs'.setup {
    ensure_installed = all, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {"haskell"},
    matchup = {
        enable = true,              -- mandatory, false will disable the whole extension
        -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    },
    highlight = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        config = {
          css = '// %s'
        }
      },
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
    indent = {enable = {"javascriptreact"}},
    autotag = {enable = true},
}
