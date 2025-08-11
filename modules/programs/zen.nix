{ inputs, ...}:
let
  profileName = "Iván";
in
{
  imports = [ inputs.zen-browser.homeModules.beta ];
  programs.zen-browser = {
    enable = true;
    profiles.${profileName} = {
      isDefault = true;
      settings = {
        "zen.welcome-screen.seen" = true;
      };
    };
  };

  stylix.targets.zen-browser = {
    enable = true;
    profileNames = [ profileName ];
  };
}
