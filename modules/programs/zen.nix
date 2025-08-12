{ config, inputs, ...}:
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
    policies = {
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      SearchEngines = {
        Add = {
          Name = "DuckDuckGo";
          URLTemplate = "https://duckduckgo.com/q={searchTerms}";
          IconURL = "https://duckduckgo.com/favicon.ico";
        };
        # Default = "DuckDuckGo";
      };
      Cookies = {
        Behavior = "allow";
        BehaviorPrivateBrowsing = "allow";
      };
      DefaultDownloadDirectory = "${config.home.homeDirectory}/Downloads";
    };
  };

  stylix.targets.zen-browser = {
    enable = true;
    profileNames = [ "${profileName}" ];
  };
}
