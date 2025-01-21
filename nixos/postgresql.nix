{ pkgs, ... }:

{
  services.postgresql = {
    enable = false;
    package = pkgs.postgresql_16;
    settings.port = 6333;
    ensureDatabases = [ "openproject" ];
    extraPlugins = with pkgs.postgresql_16.plugins; [
      pglantern
    ];
  };
}
