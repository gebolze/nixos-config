{
  # enable RealtimeKit to allow pipewire to acquire realtime priority
  security.rtkit.enable = true;

  # enable pipewire with Alsa and PulseAudio support
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
