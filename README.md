# Scarfacedeb's dotfiles

Take 4. Work in Progress.

Dotfiles are managed by [dotbot](https://github.com/anishathalye/dotbot).

## Setup

- Install 1Password.
- Sign into GitHub.

- Generate a new SSH key:

```
ssh-keygen -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | pbcopy
```

- Add the new key on github: https://github.com/settings/ssh/new

- Clone dotfiles and run install

```
git clone git@github.com:scarfacedeb/dotfiles.git ~/.dotfiles && cd ~/.dotfiles
./install
```
