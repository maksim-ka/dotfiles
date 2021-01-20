{ ... }:
{
  imports = [
    ../personal.nix
    ./hardware-configuration.nix
  ];

  ## Modules
  modules = {
    desktop = {
      bspwm.enable = true;
      apps = {
        discord.enable = true;
        rofi.enable = true;
        # godot.enable = true;
      };
      browsers = {
        default = "firefox";
        firefox.enable = true;
      };
      gaming = {
        # steam.enable = true;
        # emulators.enable = true;
        # emulators.psx.enable = true;
      };
      media = {
        # daw.enable = true;
        documents.enable = true;
        graphics.enable = true;
        mpv.enable = true;
        recording.enable = true;
        spotify.enable = true;
      };
      term = {
        default = "xst";
        st.enable = true;
      };
      vm = {
        qemu.enable = true;
	virtualbox.enable = true;
      };
    };
    editors = {
      default = "nvim";
      emacs.enable = true;
      vim.enable = true;
    };
    dev = {
      cc.enable = true; 
      python.enable = true;
      shell.enable = true;
    };
    hardware = {
      audio.enable = true;
      fs = {
        enable = true;
        ssd.enable = true;
      };
      nvidia.enable = true;
      sensors.enable = true;
    };
    shell = {
      direnv.enable = true;
      git.enable    = true;
      gnupg.enable  = true;
      pass.enable   = true;
      tmux.enable   = true;
      zsh.enable    = true;
    };
    services = {
      ssh.enable = true;
      # Needed occasionally to help the parental units with PC problems
      # teamviewer.enable = true;
    };
    theme.active = "alucard";
  };


  ## Local config
  programs.ssh.startAgent = true;
  services.openssh.startWhenNeeded = true;

  networking.networkmanager.enable = true;
  # The global useDHCP flag is deprecated, therefore explicitly set to false
  # here. Per-interface useDHCP will be mandatory in the future, so this
  # generated config replicates the default behaviour.
  networking.useDHCP = false;
  networking.wireless.enable = true;

  hardware.opengl.enable = true;

  i18n.extraLocaleSettings = {
    LC_TIME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_MEASUREMENTS = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
  };
}
