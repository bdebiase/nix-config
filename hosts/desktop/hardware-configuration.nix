# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/25186290-ccca-4758-9ca3-bca0b72790da";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/CA11-25AB";
      fsType = "vfat";
    };

  fileSystems."/mnt/LinuxExpansion" =
    {
      device = "/dev/disk/by-uuid/3441c4de-e929-48b0-ac42-06290f4824ca";
      fsType = "ext4";
    };

  swapDevices =
    [
      { device = "/dev/disk/by-uuid/635dd7c6-377f-4d4d-bb5b-4ce5eb547ecd"; }
    ];

  networking.useDHCP = lib.mkDefault true;
  #networking.interfaces.enp0s20f0u3.useDHCP = lib.mkDefault true;
  #networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
