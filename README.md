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
1. `git clone git@github.com:robert-claypool/nvim.git`

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



### External Dependencies
[Prettier](https://github.com/prettier/prettier) is awesome.
Install it with `npm install -g prettier`.

In Visual mode,
* `<localleader>=j` calls Prettier for JavaScript
* `<localleader>=t` calls Prettier for TypeScript
* `<localleader>=c` calls Prettier for PostCSS (CSS/SASS/LESS)
