# man 5 configuration.nix
# nixos-help
{ config, pkgs, lib, ... }:
let base = import ./base.nix { inherit pkgs lib; };
in {
  imports = [ ./hardware-configuration.nix

              ./git.nix
              ./i3.nix
              ./yubikey.nix
              ./this.nix
            ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.configurationLimit = 10;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware.enableRedistributableFirmware = true;

  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.printing.enable = true;
  services.thermald.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  i18n = {
    # Note: We don't set a font because sometimes the generated
    # hardware-configuration.nix picks a better (larger) one for high-DPI displays.
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "America/New_York";

  # Don't forget to set a password with ‘passwd’.
  users.users.becca = {
    isNormalUser = true;
    extraGroups = [
      "wheel"  # Enable ‘sudo’ for the user.
      "audio" "sound"  # Not sure if these are necessary.
      "video"  # Not sure if this is necessary.
      "networkmanager"
    ];
  };

  # Passwordless sudo
  security.sudo.extraConfig = ''
    %wheel ALL=(ALL:ALL) NOPASSWD: ALL
    '';

  services.emacs = {
    enable = true;
    defaultEditor = true;
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = base.packages;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you

  system.stateVersion = "19.09"; # Did you read the comment?
}
