{ config, pkgs, lib, ... }: {
  services.syncthing = rec {
    enable = true;
    user = "becca";
    configDir = "/home/${user}/.config/syncthing";
    dataDir = "/home/${user}/Documents";
    declarative = rec {
      devices = {
        cervina-windows.id =
          "76RKFLL-KE56JKM-DA4VUWT-TTDF76A-RSTZ5GR-XLMCJMY-EQR7J6J-G54V7AG";
        aquatica-nixos.id =
          "TA5A7NS-UVQZMCT-7KHNRQQ-N2CRLYT-NAXP77O-R4WGJEK-RZV3OZX-D265ZQ3";
      };
      folders = let allDevices = lib.attrNames devices;
      in {
        "${dataDir}/pdf" = {
          id = "pdf";
          label = "pdf";
          devices = allDevices;
        };
        "${dataDir}/Fonts" = {
          id = "fonts";
          label = "fonts";
          devices = allDevices;
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [ syncthingtray ];
}
