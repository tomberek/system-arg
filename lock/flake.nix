rec {
  description = "System as an input argument";
  inputs."systems@x86_64-linux@x86_64-darwin".url = "nixpkgs";

  outputs = { self, nixpkgs ,...}@inputs : with nixpkgs; let
    # requires the special input to be the only unspecified input in inputs
    systems = with builtins;
    tail (filter (x: ! isList x) (split "@" (lib.last (attrNames inputs))));
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
