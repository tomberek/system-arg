rec {
  description = "System as an input argument";
  inputs.systemsF = {
    url = "./flake.nix?revCount=x86_64-linux";
    flake = false;
  };


  outputs = { self, nixpkgs ,systemsF} : with nixpkgs; with builtins; let
    systems =
    let val = (match "../inputs/[?]revCount=(.*)" inputs.systemsF.url);
    in builtins.trace systemsF val;
    # ["x86_64-linux"];
  in {
    packages = lib.genAttrs systems (system: {
      hello = legacyPackages.${system}.runCommand "asdf" {} ''
          echo xxx
          echo system is: ${system}
          echo description is: ${description}
          echo xxx
          '';
        }) ;
    defaultPackage = lib.genAttrs systems (system:
      self.packages.${system}.hello
    );
  };
}
