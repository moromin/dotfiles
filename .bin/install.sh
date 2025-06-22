#!/usr/bin/env bash
set -ue

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
  command echo "Install dotfiles by creating symbolic links"
  command echo ""
  command echo "Options:"
  command echo "  --help, -h    Show this help message"
  command echo "  --debug, -d   Enable debug mode"
}

link_to_homedir() {
  command echo "Creating backup directory..."
  if [ ! -d "$HOME/.dotbackup" ]; then
    command echo "$HOME/.dotbackup not found. Creating it..."
    command mkdir "$HOME/.dotbackup"
  fi

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  
  if [[ "$HOME" != "$dotdir" ]]; then
    for f in $dotdir/.??*; do
      [[ `basename $f` == ".git" ]] && continue
      [[ `basename $f` == ".bin" ]] && continue
      [[ `basename $f` == ".claude" ]] && continue
      
      if [[ -L "$HOME/`basename $f`" ]]; then
        command rm -f "$HOME/`basename $f`"
      fi
      
      if [[ -e "$HOME/`basename $f`" ]]; then
        command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
      fi
      
      command ln -snf $f $HOME
      command echo "Linked: $f -> $HOME/`basename $f`"
    done
  else
    command echo "Source and destination are the same"
  fi
}

setup_git() {
  command echo "Setting up git configuration..."
  git config --global include.path "~/.gitconfig"
  git config --global core.excludesfile "~/.gitignore_global"
}

setup_claude() {
  command echo "Setting up Claude Code configuration..."
  if [[ ! -d "$HOME/.claude" ]]; then
    command mkdir -p "$HOME/.claude"
  fi
  
  if [[ -f "$HOME/dotfiles/.claude/settings.json" ]]; then
    command cp "$HOME/dotfiles/.claude/settings.json" "$HOME/.claude/settings.json"
    command echo "Claude Code settings copied"
  fi
}

while [ $# -gt 0 ]; do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 0
      ;;
    *)
      ;;
  esac
  shift
done

command echo "Starting dotfiles installation..."
link_to_homedir
setup_git
setup_claude
command echo -e "\e[1;36m Installation completed! \e[m"
command echo "Please restart your shell or run 'source ~/.zshrc' to apply changes."