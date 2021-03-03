# Dotfiles

Dotfiles for Linux environment

```
dnf install stow
```

```
cd  /opt
git clone --recursive-submodules git@gitlab.com:sourcecodere/dotfiles.git
cd dotfiles
```

```
./bin/install-dotfiles
```

```
update-dotfiles
```

```
git pull --recurse-submodules

# Initialize new submodules (only needed once when the submodule is added)
git submodule update --init

# If you want to update all submodules to the latest upstream versions
git submodule update --remote

# Remove a submodule
git rm <path-to-submodule>
```

Add vim plugin
```
git submodule add https://github.com/tpope/vim-surround.git vim/.vim/pack/plugins/start/vim-surround

# Remember to generate helptags for new modules, and update them if the
# modules are updated
vim -c "helptags ALL" -c q

```
