{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tan";
  home.homeDirectory = "/home/tan";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tan/etc/profile.d/hm-session-vars.sh
  #
  
  # home.sessionVariables = {
  #   # EDITOR = "emacs";
  # };

  # programs.emacs = {
  #   enable = true;
  #   # package = pkgs.emacs29-gtk3;  # Use the desired Emacs package

  #   extraConfig = ''
  #     (setq standard-indent 2)

  #     ;; Disable startup screen
  #     (setq inhibit-startup-screen t)

  #     ;; Set initial scratch message to empty
  #     (setq initial-scratch-message "")

  #     ;; Set up MELPA package repository
  #     (require 'package)
  #     (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  #     (package-initialize)
  #     (setq package-check-signature nil)

  #     (setq bookmark-default-file "~/.emacs.d/bookmarks")  ; Set the bookmark file
  #     (setq bookmark-save-flag 1)                         ; Save bookmarks after every change

  #     ;; Basic modes
  #     (tool-bar-mode -1)
  #     (menu-bar-mode -1)
  #     (scroll-bar-mode -1)
  #     (blink-cursor-mode -1)
  #     (column-number-mode +1)
  #     (global-visual-line-mode +1)
  #     (delete-selection-mode +1)
  #     (save-place-mode +1)
  #     (display-time-mode 1)
  #     (winner-mode 1)
  #     (global-goto-address-mode 1)
  #     (savehist-mode 1)
  #     (repeat-mode 1)
  #     (context-menu-mode 1)
  #     (recentf-mode 1)
  #   '';

  #   # Specify additional Emacs packages
  #   extraPackages = epkgs: [
  #     # List additional packages here, e.g., (epkgs.melpaStablePackages.use-package)
  #   ];
  # };
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
