rec {
  description = "System as an input argument";
  inputs.systemFile = {
    url="path:./systems";
    flake=false;
  };

  outputs = { self, nixpkgs, systemFile }: with nixpkgs; let
    systems = import systemFile;
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
