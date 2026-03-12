return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    local ls = require("luasnip")

    ls.setup({
      update_events = { "TextChanged", "TextChangedI" },
      enable_autosnippets = true, -- Enabled globally, but we choose which ones are auto
    })

    -- FIX TAB: This makes Tab expand snippets OR jump forward
    vim.keymap.set({ "i", "s" }, "<Tab>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
      end
    end, { silent = true })

    -- JUMP BACK: Ctrl+k to go to previous placeholder
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })

    -- Load your custom Lua snippets
    require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/lua/snippets" } })
    -- Load standard library snippets (Python, etc.)
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
