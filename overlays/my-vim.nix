self: super:
{
  my_vim = self.vim_configurable.customize {
    name = "vim";

    vimrcConfig.customRC = ''
      inoremap jk <Esc>
      set guioptions=-t
      set guifont=Terminus\ 10

      syntax on
      filetype on
      set expandtab
      set bs=2
      set tabstop=2
      set shiftwidth=2
      set autoindent
      set smartindent
      set smartcase
      set ignorecase
      set modeline
      set nocompatible
      set encoding=utf-8
      set hlsearch
      set history=700
      set t_Co=256
      set tabpagemax=1000
      set ruler
      set nojoinspaces
      set shiftround

      let mapleader = "\<space>"

      " Disable highlight when <leader><cr> is pressed
      map <silent> <leader><cr> :noh<cr>

      " Smart way to move between windows
      map <C-j> <C-W>j
      map <C-k> <C-W>k
      map <C-h> <C-W>h
      map <C-l> <C-W>l

      vnoremap < <gv
      vnoremap > >gv
      nnoremap n nzzzv
      nnoremap N Nzzzv

      nnoremap ; :Buffers<CR>

      let g:NERDCreateDefaultMappings = 0
      vmap <C-_> <plug>NERDCommenterToggle

      nmap <C-e> :e#<CR>

      vmap v <Plug>(expand_region_expand)
      vmap <C-v> <Plug>(expand_region_shrink)

      let g:fugitive_git_executable = 'LANG=en_US.UTF-8 git'

    '';

    vimrcConfig.vam.knownPlugins = self.vimPlugins;
    vimrcConfig.vam.pluginDictionaries = [
      { names = [
        "Syntastic"
        "Tagbar"
        "fzfWrapper"
        "fzf-vim"
        "vinegar"
        "tmux-navigator"
        "nerdcommenter"
        "vim-expand-region"
        "vim-fugitive"
      ]; }
    ];

  };
}
