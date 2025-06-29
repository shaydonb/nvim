-- Configure `clangd` with a nicer-than-default style.
require('lspconfig').clangd.setup({
  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose', '--fallback-style=google'},
  init_options = {
    fallbackFlags = { '-std=c++11' },
  },
})
