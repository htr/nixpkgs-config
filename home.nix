{ pkgs, ... }:

{
  home.packages = [
    pkgs.htop
    pkgs.ripgrep
    pkgs.my_vim
    pkgs.ag
    pkgs.s3cmd
    pkgs.terminus_font
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;

    initExtra =  ''
          source ${pkgs.grml-zsh-config}/etc/zsh/zshrc

          # Make user colour green in prompt instead of default blue
          zstyle ':prompt:grml:left:items:user' pre '%F{green}%B'                                                                               #
    '';
  };

  home.file = {
    ".tmux.conf".source = ./dotfiles/tmux.conf;
  };
}
