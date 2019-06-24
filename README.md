# My Neovim Config!

### On Linux & macOS
1. `git clone https://github.com/robert-claypool/nvim`

2. Install [vim-plug](https://github.com/junegunn/vim-plug)
```Shell
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

3. Run `./bootstrap.sh`

4. Open Neovim and run `:PlugInstall`.

### On Windows
1. `git clone https://github.com/robert-claypool/nvim`

2. Open PowerShell, run `./bootstrap.ps1`

3. Install [vim-plug](https://github.com/junegunn/vim-plug)
```PowerShell
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\AppData\Local\nvim\autoload\plug.vim"
  )
)
```

4. Open Neovim and run `:PlugInstall`.

If Neovim gives you a TSOnBufEnter error, then run `:UpdateRemotePlugins`,
see https://github.com/mhartington/nvim-typescript/issues/50

### External Dependencies
[Prettier](https://github.com/prettier/prettier) is awesome.
Install it with `npm install -g prettier`.

In Visual mode,
* `<localleader>=j` calls Prettier for JavaScript
* `<localleader>=t` calls Prettier for TypeScript
* `<localleader>=s` calls Prettier for JSON (jSon)
* `<localleader>=c` calls Prettier for PostCSS (CSS/SASS/LESS)
* `<localleader>=m` calls Prettier for Markdown
