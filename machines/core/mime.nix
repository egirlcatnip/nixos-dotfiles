{...}: {
  xdg.terminal-exec = {
    enable = true;
    settings = {
      GNOME = ["com.raggesilver.BlackBox.desktop"];
      KDE = ["org.kde.console.desktop"];
      default = ["com.raggesilver.BlackBox.desktop" "org.gnome.Ptyxis.desktop"];
    };
  };
  xdg.mime = {
    enable = true;

    defaultApplications = {
      "text/plain" = "code.desktop";
      "x-scheme-handler/unknown" = "code.desktop";

      "x-scheme-handler/http" = "google-chrome.desktop";
      "x-scheme-handler/https" = "google-chrome.desktop";
      "x-scheme-handler/about" = "google-chrome.desktop";
    };
  };
}
