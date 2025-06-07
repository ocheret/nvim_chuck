# Neovim Configuration

A modern Neovim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim) with extensive language support and developer-friendly features.

## Features

- **Framework**: Built on LazyVim for a solid foundation
- **Plugin Management**: Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for fast startup
- **Language Support**: Comprehensive LSP configuration for multiple languages
- **UI Enhancements**: Modern UI with Noice, Dashboard, and custom statusline
- **Developer Tools**: Git integration, fuzzy finding, code completion, and more

## Supported Languages

### Primary Languages
- **Rust** - Full LSP support with rust-analyzer, clippy integration
- **Go** - gopls with advanced features like code lenses and semantic tokens
- **Python** - Pyright and Ruff for type checking and linting
- **JavaScript/TypeScript** - TSServer with inlay hints
- **Java** - JDTLS for comprehensive Java development
- **C/C++** - Clangd with header switching and code completion
- **Shell** - Bash language server with shellcheck linting

### Additional Formats
- HTML/CSS - Full LSP and formatting support
- JSON/YAML - Schema validation and formatting
- Markdown - Marksman LSP with preview support
- Docker - Dockerfile and docker-compose support
- Lua - Configured specifically for Neovim development

## Installation

### Prerequisites

1. **Neovim** >= 0.9.0
2. **Git** - For plugin management
3. **Node.js** - Required for many LSP servers
4. **ripgrep** - For fast searching
5. **fd** - For file finding
6. A **Nerd Font** - For icons (recommended: JetBrainsMono Nerd Font)

### Language-specific requirements

Install the following based on your needs:

```bash
# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer

# Go
# Install from https://golang.org/dl/

# Python
pip install pyright black isort pylint mypy

# Node.js (for JS/TS and many LSP servers)
# Install from https://nodejs.org/

# Java
# Install JDK 11 or later

# C/C++
# Install clang/LLVM

# Additional tools
npm install -g typescript typescript-language-server
npm install -g prettier markdownlint
npm install -g @fsouza/prettierd eslint_d
```

### Setup

1. **Backup your existing configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. **Clone this configuration**:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

   LazyVim will automatically install all plugins on first launch.

4. **Install LSP servers**:
   Once Neovim starts, run:
   ```vim
   :Mason
   ```
   Install any additional language servers you need.

## Key Mappings

### General
- **Leader key**: `Space`
- **Local leader**: `\`

### Essential Mappings
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Browse buffers
- `<leader>fh` - Help tags

### Window Management
- `<C-h/j/k/l>` - Navigate between windows
- `<leader>-` - Split window below
- `<leader>|` - Split window right

### Code Actions
- `<leader>cf` - Format code
- `<leader>cr` - Rename symbol
- `<leader>ca` - Code actions
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation

### Git
- `<leader>gg` - Open lazygit
- `<leader>ghs` - Stage hunk
- `<leader>ghr` - Reset hunk
- `]h` - Next hunk
- `[h` - Previous hunk

### Diagnostics
- `<leader>cd` - Line diagnostics
- `]d` - Next diagnostic
- `[d` - Previous diagnostic
- `]e` - Next error
- `[e` - Previous error

## Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Entry point, bootstraps lazy.nvim
├── lua/
│   ├── config/             # Core configuration
│   │   ├── autocmds.lua    # Auto commands
│   │   ├── keymaps.lua     # Key mappings
│   │   ├── lazy.lua        # Lazy.nvim setup
│   │   └── options.lua     # Vim options
│   └── plugins/            # Plugin configurations
│       ├── coding.lua      # Completion, snippets, etc.
│       ├── editor.lua      # Editor enhancements
│       ├── lsp.lua         # Language server configs
│       └── ui.lua          # UI improvements
└── README.md               # This file
```

## Customization

### Adding Plugins

Create a new file in `lua/plugins/` or add to existing files:

```lua
-- lua/plugins/my-plugin.lua
return {
  {
    "username/plugin-name",
    event = "VeryLazy",  -- Lazy load
    config = function()
      require("plugin-name").setup({
        -- your config
      })
    end,
  },
}
```

### Modifying LSP Settings

Edit `lua/plugins/lsp.lua` to add or modify language server configurations:

```lua
servers = {
  your_lsp = {
    settings = {
      -- LSP specific settings
    },
  },
}
```

### Changing Keymaps

Add custom keymaps to `lua/config/keymaps.lua`:

```lua
local map = vim.keymap.set
map("n", "<leader>xx", "<cmd>YourCommand<cr>", { desc = "Description" })
```

## Troubleshooting

### Common Issues

1. **Icons not displaying**: Install a Nerd Font and configure your terminal
2. **LSP not working**: Run `:checkhealth` and ensure language servers are installed
3. **Slow startup**: Check `:Lazy profile` to identify slow plugins

### Health Check

Run `:checkhealth` to diagnose issues with:
- Neovim version compatibility
- Required external tools
- Plugin status
- LSP configuration

### Debugging

1. Check messages: `:messages`
2. View LSP log: `:LspLog`
3. Lazy.nvim log: `:Lazy log`

## Updates

### Update Plugins
```vim
:Lazy sync
```

### Update Language Servers
```vim
:Mason
```
Then press `U` to update all.

## Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

## License

This configuration is released under the MIT License. See individual plugin repositories for their respective licenses.