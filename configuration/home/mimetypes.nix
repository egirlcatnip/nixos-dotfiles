{...}: {
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/plain" = "code.desktop";
      "x-scheme-handler/unknown" = "code.desktop";

      #"text/html" = "google-chrome.desktop";
      "x-scheme-handler/http" = "google-chrome.desktop";
      "x-scheme-handler/https" = "google-chrome.desktop";
      "x-scheme-handler/about" = "google-chrome.desktop";
    };
  };
  xdg.terminal-exec = {
    enable = true;
    package = "org.gnome.Ptyxis.desktop";
  };
}
