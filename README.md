<div align="center">
  <p><strong>A simple plugin to greet you with a tip when you launch Neovim</strong></p>
</div>

![Demo](./static/demo.gif)

## Requirements

- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

## Installation

```lua
-- Lazy.nvim
return {
    "dheerajshenoy/tip.nvim",
    event = "VimEnter",
    init = function()
        -- Default config
        --- @type Tip.config
        require("tip").setup({
            prefix = "Tip! ",
            url = "https://vtip.43z.one"
        })
    end,
}
```
