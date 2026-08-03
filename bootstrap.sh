#!/usr/bin/env bash
set -e

echo "=== my-configs bootstrap ==="

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
    brew install neovim herdr git ripgrep fd fzf stow lazygit
  else
    # Ubuntu/Debian
    sudo apt-get update
    sudo apt-get install -y git ripgrep fd-find fzf stow

    # fd no Ubuntu chama fdfind, cria alias
    if ! command -v fd &>/dev/null && command -v fdfind &>/dev/null; then
      mkdir -p ~/.local/bin
      ln -sf "$(which fdfind)" ~/.local/bin/fd
    fi

    # herdr: instala via script oficial (não está no apt)
    if ! command -v herdr &>/dev/null; then
      curl -fsSL https://herdr.dev/install.sh | sh
    fi

    # neovim: apt traz versão velha demais pro LazyVim (>= 0.11.2), instala o tarball oficial no /opt
    NVIM_MIN="0.11.2"
    NVIM_CUR=$(nvim --version 2>/dev/null | head -1 | sed -n 's/.*v\([0-9][0-9.]*\).*/\1/p')
    if ! command -v nvim &>/dev/null || ! printf '%s\n' "$NVIM_MIN" "$NVIM_CUR" | sort -V -C; then
      echo "→ Instalando Neovim ($NVIM_MIN+) no /opt..."
      case "$(uname -m)" in
        aarch64 | arm64) NVIM_ARCH="arm64" ;;
        *) NVIM_ARCH="x86_64" ;;
      esac
      curl -fsSLo /tmp/nvim.tar.gz "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${NVIM_ARCH}.tar.gz"
      sudo rm -rf "/opt/nvim-linux-${NVIM_ARCH}"
      sudo tar -C /opt -xzf /tmp/nvim.tar.gz
      sudo ln -sf "/opt/nvim-linux-${NVIM_ARCH}/bin/nvim" /usr/local/bin/nvim
      rm -f /tmp/nvim.tar.gz
    fi

    # lazygit: não está no apt (PPA deprecated), usa o método oficial do README do lazygit
    if ! command -v lazygit &>/dev/null; then
      echo "→ Instalando lazygit..."
      LAZYGIT_VERSION=$(curl -fsSL https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -Po '"tag_name": *"v\K[^"]*')
      LAZYGIT_ARCH=$(uname -m | sed -e 's/aarch64/arm64/')
      curl -fsSLo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"
      tar xzf /tmp/lazygit.tar.gz -C /tmp lazygit
      sudo install /tmp/lazygit -D -t /usr/local/bin/
      rm -f /tmp/lazygit.tar.gz
    fi
  fi
}

echo -n "→ Instalar dependências? (nvim, herdr, rg, fd, fzf, lazygit) [S/n] "
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
