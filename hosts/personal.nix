{ config, lib, ... }:

with lib;
{
  networking.hosts =
    let hostConfig = {
          "192.168.1.2"  = [ "nixlos" ];
          "192.168.1.3"  = [ "kiiro" ];
          "192.168.1.10" = [ "kuro" ];
          "192.168.1.11" = [ "shiro" ];
          "192.168.1.12" = [ "midori" ];
        };
        hosts = flatten (attrValues hostConfig);
        hostName = config.networking.hostName;
    in mkIf (builtins.elem hostName hosts) hostConfig;

  ## Location config -- since Toronto is my 127.0.0.1
  time.timeZone = mkDefault "Europe/Berlin";
  i18n.defaultLocale = mkDefault "en_US.UTF-8";
  # For redshift, mainly
#TODO: set loctions for hq's - consider useing other variable than timeZone
  location = (if config.time.timeZone == "Europe/Berlin" then {
    latitude = 49.88240;
    longitude = 8.67044;
  } else if config.time.timeZone == "Europe/Copenhagen" then {
    latitude = 55.88;
    longitude = 12.5;
  } else {});

  ##
  modules.shell.bitwarden.config.server = "p.v0.io";
}
