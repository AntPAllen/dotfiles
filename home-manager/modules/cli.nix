{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    gcc
    gnumake
    bat
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
    yq-go
    jq
    gh
    gotools
    gopls
    go-outline
    gocode
    gopkgs
    gocode-gomod
    godef
    golint
    graphviz
    sumneko-lua-language-server
    terraform-ls
    terraform
    boundary
    sops
    yarn
    pulumi-bin
    kubie
    terragrunt
    ripgrep
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
    initExtraBeforeCompInit = "
autoload -Uz braceexpand
DISABLE_MAGIC_FUNCTIONS=true
export PATH=\"\${PATH}:/mnt/c/Users/antall/AppData/Local/Programs/Microsoft VS Code/bin:/usr/local/go/bin:$HOME/go/bin\"
source ~/aliases
    ";
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      kubernetes.disabled = false;
      container.disabled = true;
    };
  };

  programs.fzf.enable = true;

  xdg.configFile."tmux/tmux.conf".source = ../configs/tmux/tmux.conf;
}
