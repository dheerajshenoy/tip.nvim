<div align="center">
  <p><strong>A simple plugin to greet you with a tip when you launch Neovim</strong></p>
</div>

![Demo](./static/demo.gif)

`tip.nvim` shows a tip every time a new neovim window is opened. You can recall the tip shown at a later point using the user command `:Tip`.

## Why the fork ?

I didn't like the default [`Tip.nvim`](https://github.com/TobinPalmer/Tip.nvim) plugin and wanted to remove the dependency on [`nvim-notify`](https://github.com/rcarriga/nvim-notify) and use the builtin notify ui library in neovim. 

## Requirements

- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

## Installation

- I have shown the snippet of code for installing using `lazy.nvim`. Snippet can easily be adapted for other package manager.
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
