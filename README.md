# dotfiles

Personal dotfiles for development environment setup and productivity enhancement.

## Contents

- **Shell Configuration** (`.zshrc`) - Zsh setup with history management, aliases, and productivity features
- **Git Configuration** (`.gitconfig`, `.gitignore_global`) - Git settings with useful aliases and global ignore patterns
- **Claude Code Settings** (`.claude/settings.json`) - Configuration for Claude Code CLI tool
- **Installation Script** (`.bin/install.sh`) - Automated setup script for quick deployment

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Run the installation script:
   ```bash
   ./.bin/install.sh
   ```

3. Update Git user information:
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

4. Restart your shell or reload configuration:
   ```bash
   source ~/.zshrc
   ```

## Features

### Shell (Zsh)
- Smart history management with deduplication
- Productive aliases for common commands
- Git aliases for faster workflow
- Color-coded directory listings
- Auto-completion enhancements

### Git
- Useful aliases (st, co, br, ci, etc.)
- Color-coded output
- Global gitignore for common unwanted files
- Sensible default settings

### Claude Code
- Auto-confirmation for safe commands
- Memory management enabled
- Security settings to protect sensitive data
- Project-specific conventions

## Customization

Create local configuration files for environment-specific settings:
- `~/.zshrc.local` - Local shell configuration
- Add personal modifications without affecting the main dotfiles

## Installation Details

The install script will:
1. Create a backup directory (`~/.dotbackup`) for existing configurations
2. Create symbolic links from dotfiles to your home directory
3. Set up Git configuration includes
4. Copy Claude Code settings

## File Structure

```
dotfiles/
├── .bin/
│   └── install.sh          # Installation script
├── .claude/
│   └── settings.json       # Claude Code configuration
├── .gitconfig              # Git configuration
├── .gitignore              # Repository gitignore
├── .gitignore_global       # Global gitignore patterns
├── .zshrc                  # Zsh configuration
├── CLAUDE.md               # Claude Code guidance
└── README.md               # This file
```
