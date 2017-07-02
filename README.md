# My Neovim Config!

### On Linux
1. `git clone git@github.com:robert-claypool/nvim.git`

2. Install [vim-plug](https://github.com/junegunn/vim-plug)
```Shell
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

3. Run `./bootstrap.sh`

### On Windows
Good luck.

### External Dependencies
[Prettier](https://github.com/prettier/prettier) is awesome.
Install it with `npm install -g prettier`.

In Visual mode,
* `<localleader>jj` calls Prettier for JavaScript
* `<localleader>tt` calls Prettier for TypeScript
* `<localleader>cc` calls Prettier for PostCSS (CSS/SASS/LESS)
