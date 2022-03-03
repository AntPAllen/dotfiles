{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    gcc
    gnumake
    bat
    nerdfonts
    bottom
    curl
    fzf
    gawk
    gnupg
    gnused
    gnutls
    keychain
    nix-zsh-completions
    nmap
    rclone
    ripgrep
    rsync
    sd
    socat
    termshark
    tmux
    tree
    universal-ctags
    unzip
    watch
    watchman
    xsv
    zoxide
    zsh
    argocd
    kubectl
    azure-cli
    kubernetes-helm
    yq
    jq
    gh
    go_1_17
    gotools
    gopls
    go-outline
    gocode
    gopkgs
    gocode-gomod
    godef
    golint
    python310
    nodejs-16_x
    nodePackages.yaml-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.pyright
    sumneko-lua-language-server
    terraform-ls
    boundary
    cue
  ];


  programs.direnv = {
    enable = true;
    enableZshIntegration = false;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    sessionVariables = {
      TERM = "xterm-256color";
      COLORTERM = "truecolor";
    };
    shellAliases = {
      vim = "nvim";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "npm" "kubectl"];
      theme = "robbyrussell";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      kubernetes.disabled = false;
    };
  };

  programs.fzf.enable = true;

  xdg.configFile."tmux/tmux.conf".source = ../configs/tmux/tmux.conf;
}
