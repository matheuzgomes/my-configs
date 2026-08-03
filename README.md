# my-configs

Neovim (LazyVim) + herdr. Linux e macOS.

## Estrutura

```
my-configs/
├── nvim/           → ~/.config/nvim/
├── herdr/          → ~/.config/herdr/
├── tmux/           → ~/.tmux.conf (legado)
├── bootstrap.sh
└── README.md
```

Gerenciado com [GNU Stow](https://www.gnu.org/software/stow/).

## Instalação

```bash
git clone https://github.com/matheuzgomes/my-configs ~/my-configs
cd ~/my-configs
chmod +x bootstrap.sh
./bootstrap.sh
```

O script detecta o SO e instala as dependências (nvim, herdr, rg, fd, fzf, stow, lazygit), além de criar os symlinks. No Linux o neovim vem de um tarball oficial (>= 0.11.2, exigido pelo LazyVim) — o do apt é velho demais.

Depois, abra o `nvim` e deixe o Lazy instalar os plugins no primeiro boot.

## Atualizar

```bash
cd ~/my-configs
git pull
# symlinks já apontam pros arquivos novos, pronto
```

## Adicionar novo pacote

```bash
mkdir -p ~/my-configs/<nome>/.config/<nome>
mv ~/.config/<nome>/* ~/my-configs/<nome>/.config/<nome>/
cd ~/my-configs && stow <nome>
```

## Temas

- **pi-theme**: colorscheme escuro, acento teal, criado sob medida (`nvim/.config/nvim/colors/pi-theme.lua`)
