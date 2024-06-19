{...}: {
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/plain" = "code.desktop";
      "x-scheme-handler/unknown" = "code.desktop";

      "inode/directory" = "org.gnome.Ptyxis.desktop";

      #"text/html" = "google-chrome.desktop";
      "x-scheme-handler/http" = "google-chrome.desktop";
      "x-scheme-handler/https" = "google-chrome.desktop";
      "x-scheme-handler/about" = "google-chrome.desktop";
    };
  };
}
