# floating-cmdline.nvim

A floating command line interface for Neovim that provides an interactive terminal-style window for running commands with persistent output history.

## Features

- **Floating command window** with configurable size and border
- **Interactive command execution** - run any Vim command or shell command
- **Persistent output history** - see results of previous commands
- **Smart output truncation** - long outputs are collapsed with expandable "... N more lines"
- **Change detection** - automatically clears outdated output when commands are modified
- **Syntax highlighting** for commands, output, errors, and metadata
- **Command history integration** with Vim's native command history

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

## Usage

### Commands

- `:FloatingCmdline` or `:FloatingCmdlineToggle` - Toggle the floating command line
- `:FloatingCmdlineOpen` - Open the floating command line
- `:FloatingCmdlineClose` - Close the floating command line

### Default Keybinding

- `<leader>fc` - Toggle floating command line (can be disabled with `g:floating_cmdline_no_default_bindings = 1`)

### Inside the Floating Window

- **Enter** - Execute the current line as a command
- **Ctrl+C** or **Escape** - Close the window
- **Click on "... N more lines"** - Expand truncated output
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

## Configuration

```lua
require('floating-cmdline').setup({
  width_ratio = 0.8,     -- Width relative to screen (0.0 to 1.0)
  height_ratio = 0.6,    -- Height relative to screen (0.0 to 1.0)  
  border = 'rounded',    -- Border style: 'none', 'single', 'double', 'rounded', 'solid', 'shadow'
})
```

## How It Works

The plugin creates a floating window where you can type and execute Vim commands. Each command's output is displayed below it with metadata tracking. When you modify a command, its old output is automatically cleared. Long outputs are truncated but can be expanded by clicking the "... N more lines" indicator.

## License

MIT License - see LICENSE file for details