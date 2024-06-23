{...}: {
  sound.enable = true;
  # Disable pulse-audio
  hardware.pulseaudio.enable = false;

  # Enable pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
