# dotfiles
## About
This repo is inspired by the post from the [Hacker News
thread](https://news.ycombinator.com/item?id=11070797) and
[article](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
created afterwadrs.

## How to start use it
Add `config` alias to the `.zshrc` and run it in the current terminal:
```bash
alias config='$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
Clone bare repo into `.dotfiles` directory:
```bash
git clone --bare https://github.com/panurg/dotfiles $HOME/.dotfiles
```
Checkout any suitable branch (one branch per host, one common branch for new and
reference installations).
```bash
config checkout common
```
>You may need to delete and/or move some existing files from your `HOME`
>directory before checking out.

Disable showing untracked files:
```bash
config config --local status.showUntrackedFiles no
```
Use like a usual git repo with special command:
```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```
Download vim-plug for vim:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Dependencies list
1. polybar
1. rofi
1. urxvtd
1. i3lock
1. transmission-gtk
