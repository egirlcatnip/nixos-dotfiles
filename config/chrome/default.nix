{
  username,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (chromium.override {
      commandLineArgs = [
        "--enable-features=VaapiVideoDecodeLinuxGL"
        "--ignore-gpu-blocklist"
        "--enable-zero-copy"
      ];
    })
  ];

  programs.chromium = {
    enable = true;
    extraOpts = {
      "DefaultSearchProviderEnabled" = true;
      "DefaultSearchProviderName" = "DuckDuckGo";
      "DefaultSearchProviderSearchURL" = "https://duckduckgo.com/?q={searchTerms}";
    };
  };

  home-manager.users.${username} = {
    programs.chromium = {
      enable = true;

      extensions = [
        {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock-origin
        {id = "dcpihecpambacapedldabdbpakmachpb";} # bypass-paywalls
        {id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";} # dark-reader
        {id = "apmmpaebfobifelkijhaljbmpcgbjbdo";} # stylus
        {id = "hcihcignkpajeehfnomlncinacagapdf";} # open-selected-links
        {id = "cbghhgpcnddeihccjmnadmkaejncjndb";} # vencord-web
        {id = "gebbhagfogifgggkldgodflihgfeippi";} # return-yt-dislike
        {id = "mnjggcdmjocbbbhaepdhchncahnbgone";} # sponsor-block
        {id = "pbegadjnjekcbdehmfljcnjohjiljpji";} # ddg-bangs
        {id = "keiknnbdamnhdmcfboleaampkihpdjbd";} # instant-ddg
        {id = "pbegadjnjekcbdehmfljcnjohjiljpji";} # ddg-bangs
        {id = "cpbniogoilfagmcoipghkgnpmdglfmjm";} # flatline-flathub
        {id = "ehgbadgnkmeeldglkmnplolneidgpbcm";} # xkit-tumblr
        {id = "emffkefkbkpkgpdeeooapgaicgmcbolj";} # wikiwand
        {id = "jinjaccalgkegednnccohejagnlnfdag";} # violent-monkey
        {id = "dnhpnfgdlenaccegplpojghhmaamnnfp";} # augmented-steam
        {id = "kdbmhfkmnlmbkgbabkdealhhbfhlmmon";} # steam-db
        {id = "cngoemokfjekjkmajenlaokhnmmiinca";} # wiki-gg-redirect
        {id = "lnjaiaapbakfhlbjenjkhffcdpoompki";} # catppuccin-github-icons
      ];
    };
  };
}
