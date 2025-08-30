{
config,
pkgs,
inputs,
lib,
...
}: let
  host = config.networking.hostName;
  lockscreen_config = {
    vortex = {
      url = "https://www.desktophut.com/files/9p6ujhVCuVWB0nI_Vvv%202%20Prob4%20Hyp1.mp4";
      sha256 = "0mc0xicsydgvsaj5jgxil9ix3kadsx6zn1nqp2yzin6iykzqwdjh";
      name = "lockscreen-video.mp4";
    };
    maelstrom = {
      url = "";
      sha256 = "";
      name = "lockscreen-video.mp4";
    };
  };

  animated_lock = builtins.fetchurl lockscreen_config.${host};

  # an exhaustive example can be found in flake.nix
  sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
    theme = "rei"; # select the config of your choice
    extraBackgrounds = [ animated_lock ];
  };
in  {
  # include the test package which can be run using test-sddm-silent
  environment.systemPackages = [sddm-theme sddm-theme.test];
  qt.enable = true;
  services.displayManager.sddm = {
    package = pkgs.kdePackages.sddm; # use qt6 version of sddm
    enable = false;
    theme = sddm-theme.pname;
    wayland.enable = true;
    # the following changes will require sddm to be restarted to take
    # effect correctly. It is recomend to reboot after this
    extraPackages = sddm-theme.propagatedBuildInputs;
    settings = {
      # required for styling the virtual keyboard
      General = {
        GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
        InputMethod = "qtvirtualkeyboard";
      };
    };
  };
}
