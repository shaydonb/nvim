-- Change some options of the parent config of neo-cmp (autocompletion).
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping = cmp.mapping({
      -- Prevent enter from being anything besides newline/carriage return.
      ["<CR>"] = cmp.config.disable,
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-y>"] = cmp.mapping.confirm(), -- Select setting can be made inside the parentheses per: { select = true/false }...
      -- Below options disabled in order to prevent messing with the tmux binding for <C-b>.
      -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
    })
  end,
}
