# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository for managing personal configuration files and development environment setup.

## Architecture

The repository is organized as follows:
- `.zshrc` - Main shell configuration with aliases, history settings, and productivity features
- `.gitconfig` / `.gitignore_global` - Git configuration and global ignore patterns
- `.claude/settings.json` - Claude Code configuration for optimal workflow
- `.bin/install.sh` - Installation script for automatic setup
- Local configuration support (`.zshrc.local` files)

## Common Commands

### Installation
```bash
./.bin/install.sh  # Install all dotfiles with symbolic links
```

### Testing Changes
```bash
source ~/.zshrc    # Reload shell configuration
```

### Managing Configuration
- Edit configuration files directly in the dotfiles directory
- Changes are immediately reflected via symbolic links
- Use `.local` files for environment-specific customizations

## Development Guidelines

1. **Backup Strategy**: The install script automatically backs up existing configurations to `~/.dotbackup`
2. **Symbolic Links**: All dotfiles are linked, not copied, for easy maintenance
3. **Local Overrides**: Support `.local` files for environment-specific settings
4. **Security**: Never commit sensitive information like API keys or passwords