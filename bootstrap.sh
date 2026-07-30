#!/usr/bin/env bash
set -e

echo "=== dotfiles bootstrap ==="

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
  OS="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  OS="linux"
else
  echo "OS não suportado: $OSTYPE"
  exit 1
fi
echo "→ SO detectado: $OS"

# ── GNU Stow ──────────────────────────────────
if ! command -v stow &>/dev/null; then
  echo "→ Instalando stow..."
  if [[ "$OS" == "macos" ]]; then
    brew install stow
  else
    sudo apt-get install -y stow
  fi
fi

# ── Deps ───────────────────────────────────────
install_deps() {
  if [[ "$OS" == "macos" ]]; then
    # Homebrew
    if ! command -v brew &>/dev/null; then
      echo "→ Instalando Homebrew..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install neovim herdr git ripgrep fd fzf stow
  else
    # Ubuntu/Debian
    sudo apt-get update
    sudo apt-get install -y neovim git ripgrep fd-find fzf stow

    # fd no Ubuntu chama fdfind, cria alias
    if ! command -v fd &>/dev/null && command -v fdfind &>/dev/null; then
      mkdir -p ~/.local/bin
      ln -sf "$(which fdfind)" ~/.local/bin/fd
    fi

    # herdr: instala via script oficial (não está no apt)
    if ! command -v herdr &>/dev/null; then
      curl -fsSL https://herdr.dev/install.sh | sh
    fi
  fi
}

echo -n "→ Instalar dependências? (nvim, herdr, rg, fd, fzf) [S/n] "
read -r answer
if [[ "$answer" != "n" ]] && [[ "$answer" != "N" ]]; then
  install_deps
fi

# ── Stow symlinks ──────────────────────────────
cd "$(dirname "$0")"

echo "→ Criando symlinks..."
stow nvim   && echo "   ✓ nvim"
stow --no-folding herdr && echo "   ✓ herdr"

echo ""
echo "=== Pronto! ==="
echo "Abra o nvim e deixe o Lazy instalar os plugins."
