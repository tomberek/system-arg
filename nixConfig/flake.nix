rec {
  description = "System as an input argument";
  nixConfig.systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin"];

  outputs = { self, nixpkgs }: with nixpkgs;
  let
    getPlatforms = d: if d?meta && d.meta?platforms
              then d.meta.platforms
              else throw "bad"; # nixConfig.systems;
    smartPlatforms = lib.attrsets.mapAttrs (system: d:
        lib.filterAttrs (_: v: builtins.any (x: x == system) (getPlatforms v)) d
    );
  in {
    packages = smartPlatforms
      (lib.genAttrs nixConfig.systems
      (system: {
        default = derivation {
          name = "default";
          inherit system;
          builder = "/bin/sh";
          args = ["-c" "echo hi > $out" ];
          meta.platforms = lib.platforms.x86;
        };
        hello = legacyPackages.${system}.runCommand "asdf" {
          meta.platforms = lib.platforms.linux;
        } ''
          echo xxx
          echo system is: ${system}
          echo description is: ${description}
          echo xxx
        '';
      }));
  };
}
