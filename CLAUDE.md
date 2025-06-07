# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on the LazyVim framework. It provides a complete IDE-like experience with support for multiple programming languages.

## Architecture

The configuration follows LazyVim's modular architecture:

1. **Entry Point**: `init.lua` bootstraps lazy.nvim and loads the LazyVim framework with custom extensions
2. **Plugin Loading**: LazyVim loads its defaults first, then language extras, then custom plugins from `lua/plugins/`
3. **Configuration Loading**: Config files in `lua/config/` are loaded by LazyVim at appropriate lifecycle points

Key architectural decisions:
- Built on LazyVim rather than from scratch - provides battle-tested defaults
- Plugins are organized by concern (coding, editor, lsp, ui)
- Each plugin file returns a table of plugin specifications that extend/override LazyVim defaults
- Heavy use of lazy loading for fast startup

## Common Commands

### Configuration Management
- `:Lazy` - Open lazy.nvim UI for plugin management
- `:Lazy sync` - Update all plugins
- `:Mason` - Manage LSP servers, formatters, and linters
- `:LazyExtras` - Enable/disable LazyVim extras (language packs)

### Development Commands
- `<leader>cf` - Format current file (uses conform.nvim)
- `:ConformInfo` - Show active formatters for current buffer
- `:LspInfo` - Show attached LSP clients
- `:LspLog` - View LSP client logs

### Debugging Issues
- `:checkhealth` - Run health checks for Neovim and plugins
- `:Lazy profile` - Profile plugin load times
- `:messages` - View Neovim messages

## Language Support Configuration

Language support is configured in multiple places:

1. **init.lua**: Imports LazyVim language extras (e.g., `lazyvim.plugins.extras.lang.rust`)
2. **lua/plugins/lsp.lua**: Configures LSP servers, formatters, and linters
3. **Mason**: Runtime installation of language tools

To add a new language:
1. Check if LazyVim has an extra for it (`:LazyExtras`)
2. Configure the LSP server in `lua/plugins/lsp.lua`
3. Add formatters/linters to conform.nvim and nvim-lint configurations
4. Install required tools via Mason or system package manager

## Plugin Modification Pattern

When modifying plugin behavior:

```lua
-- lua/plugins/example.lua
return {
  {
    "plugin/name",
    opts = function(_, opts)
      -- Extend existing options
      opts.new_option = "value"
      return opts
    end,
  },
}
```

This pattern ensures LazyVim defaults are preserved while adding customizations.

## File Structure Notes

- `lazy-lock.json` - Tracked by git for reproducible installs
- `stylua.toml` - Formats the Lua configuration files themselves
- `.luarc.json` - Lua language server configuration for editing this config