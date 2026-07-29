# dotfiles

Neovim (LazyVim) + tmux. Linux e macOS.

## Estrutura

```
dotfiles/
├── nvim/           → ~/.config/nvim/
├── tmux/           → ~/.tmux.conf
├── bootstrap.sh
└── README.md
```

Gerenciado com [GNU Stow](https://www.gnu.org/software/stow/).

## Instalação

```bash
git clone https://github.com/<seu-user>/dotfiles ~/dotfiles
cd ~/dotfiles
chmod +x bootstrap.sh
./bootstrap.sh
```

O script detecta o SO, instala dependências (nvim, tmux, rg, fd, fzf, stow), cria os symlinks e clona o TPM.

Depois:
- `nvim` — Lazy.nvim instala os plugins no primeiro boot
- `tmux` — `prefix + I` instala os plugins (floax, etc)

## Atualizar

```bash
cd ~/dotfiles
git pull
# symlinks já apontam pros arquivos novos, pronto
```

## Adicionar novo pacote

```bash
mkdir -p ~/dotfiles/<nome>/.config/<nome>
mv ~/.config/<nome>/* ~/dotfiles/<nome>/.config/<nome>/
cd ~/dotfiles && stow <nome>
```

## Temas

- **pi-theme**: colorscheme escuro, acento teal, criado sob medida (`nvim/.config/nvim/colors/pi-theme.lua`)
