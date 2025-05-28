{ pkgs, config, lib, ... }:

{
  services.glance = {
    enable = true;
    settings = {
        pages = [
          {
            columns = [
              {
                size = "full";
                widgets = [
                  {
                    type = "calendar";
                  }
                  {
                    location = "Posadas, Argentina";
                    type = "weather";
                  }
                ];
              }
            ];
            name = "Home";
          }
        ];
        server = {
          port = 5678;
        };
    };
  };
}
