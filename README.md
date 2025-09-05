# floating-cmdline.nvim

A floating command line interface for Neovim that provides an interactive terminal-style experience for running commands with persistent output history. Use it as a floating window or integrate it into your window layout.

## How It Works

The plugin creates a shared command buffer where you can type and execute Vim commands. Each command's output is displayed below it with metadata tracking. When you modify a command, its old output is automatically cleared. Long outputs are truncated but can be expanded by pressing Enter on the "... N more lines" indicator.

The same buffer can be displayed either as a floating window or in your own splits/tabs, with full history preserved between modes.

## Usage

### Commands

- `:Fcl open` - Open the command buffer in a floating window
- `:Fcl edit` - Open the command buffer in the current window

### Inside the Command Buffer

- **Enter** - Execute the current line as a command  
- **Ctrl+N** - Trigger command completion (in insert mode)
- **Ctrl+C** - Close floating window (floating mode only)
- **Press Enter on "... N more lines"** - Expand truncated output
- **dd** - Delete command and its output
- **]c / [c** - Jump between commands
- **Normal Vim editing** - Edit commands, navigate with arrow keys, etc.

### Flexible Display Modes

```vim
:Fcl open          " Floating window
:Fcl edit          " Current window
```

All modes use the same buffer - your command history persists when switching between floating and split views!

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
    require('floating-cmdline').setup({
      keybind = '|',              -- Optional: set floating window keybind
      edit_keybind = '<leader>fe', -- Optional: set edit mode keybind  
    })
  end,
  -- Alternative: define keybinds here instead of in config
  keys = {
    { '<leader>fc', '<cmd>Fcl open<cr>', desc = 'Floating Command Line' },
    { '<leader>fe', '<cmd>Fcl edit<cr>', desc = 'Edit Command Buffer' },
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
  keybind = '|',         -- Keybinding to open floating window (optional)
  edit_keybind = '<leader>fe', -- Keybinding to edit buffer in current window (optional)
})
```

### API

```lua
-- Get the shared command buffer for custom display
local buf = require('floating-cmdline').create_command_buffer()
vim.api.nvim_set_current_buf(buf)

-- Open floating window programmatically
require('floating-cmdline').open()

-- Close floating window
require('floating-cmdline').close()
```

## License

MIT License - see LICENSE file for details
