# floating-cmdline.nvim

A floating command line interface for Neovim that provides an interactive terminal-style window for running commands with persistent output history.

## How It Works

The plugin creates a floating window where you can type and execute Vim commands. Each command's output is displayed below it with metadata tracking. When you modify a command, its old output is automatically cleared. Long outputs are truncated but can be expanded by pressing Enter on the "... N more lines" indicator.

## Usage

### Commands

- `:FloatingCmdline` - Open the floating command line

### Inside the Floating Window

- **Enter** - Execute the current line as a command
- **Ctrl+C** - Close the window
- **Press Enter on "... N more lines"** - Expand truncated output
- **Normal Vim editing** - Edit commands, navigate with arrow keys, etc.

### Examples

```
echo "Hello World"
  --CMD:echo "Hello World"|ID:1
  Hello World

!ls -la
  --CMD:!ls -la|ID:2
  total 8
  drwxr-xr-x  3 user  staff   96 Jan  1 12:00 .
  drwxr-xr-x  4 user  staff  128 Jan  1 12:00 ..
  -rw-r--r--  1 user  staff   45 Jan  1 12:00 README.md

set number
  --CMD:set number|ID:3

version
  --CMD:version|ID:4
  NVIM v0.9.0
  ... 25 more lines
```

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
  'noelr/floating-cmdline.nvim',
  config = function()
    require('floating-cmdline').setup()
  end,
  keys = {
    { '<leader>fc', '<cmd>FloatingCmdline<cr>', desc = 'Floating Command Line' },
  },
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use {
  'noelr/floating-cmdline.nvim',
  config = function()
    require('floating-cmdline').setup()
  end
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'noelr/floating-cmdline.nvim'

lua << EOF
require('floating-cmdline').setup()
EOF
```

## Configuration

```lua
require('floating-cmdline').setup({
  width_ratio = 0.8,     -- Width relative to screen (0.0 to 1.0)
  height_ratio = 0.6,    -- Height relative to screen (0.0 to 1.0)  
  border = 'rounded',    -- Border style: 'none', 'single', 'double', 'rounded', 'solid', 'shadow'
  keybind = '<leader>fc', -- Set a keybinding to open the floating command line (optional)
})
```

## License

MIT License - see LICENSE file for details