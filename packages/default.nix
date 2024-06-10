{ pkgs, inputs, ... }:
let

  packages = with pkgs; [
    google-chrome
    youtube-music
    ];

in
packages