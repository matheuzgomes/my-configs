return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 300 },
        menu = {
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
          },
        },
      },
      signature = { enabled = true },
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
    },
  },
}
