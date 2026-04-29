# Scarfacedeb's dotfiles

Take 4. Work in Progress.

Dotfiles are managed by [dotbot](https://github.com/anishathalye/dotbot).

## Scripts

| Script | Description |
|---|---|
| `./prepare.sh` | Run on the **old machine**. Exports your GPG private key to `~/Desktop/gpg.asc` for transfer. |
| `./bootstrap.sh` | Run on the **new machine**. Handles SSH key, Homebrew, git-secret, GPG import, secret decryption, deps, and dotfiles install. |

## Migration: old machine

```sh
./prepare.sh
```

Transfer `~/Desktop/gpg.asc` securely to the new machine (AirDrop, 1Password note, etc.).

---

## Migration: new machine

1. **Install 1Password** and sign in.

2. **Clone the dotfiles** (via HTTPS if SSH isn't set up yet):

```sh
git clone https://github.com/scarfacedeb/dotfiles.git ~/.dotfiles && cd ~/.dotfiles
```

3. **Drop your exported GPG key** at `~/Desktop/gpg.asc`.

4. **Run bootstrap:**

```sh
./bootstrap.sh
```

---

## Fonts

Nerd fonts were downloaded from [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts#patched-fonts).
