rec {
  description = "System as an input argument";
  nixConfig.systems = ["x86_64-linux" "aarch64-linux"];

  outputs = { self, nixpkgs }: with nixpkgs; {
    packages = lib.genAttrs nixConfig.systems (system: {
      hello = legacyPackages.${system}.runCommand "asdf" {} ''
          echo xxx
          echo system is: ${system}
          echo description is: ${description}
          echo xxx
          '';
        }) ;
    defaultPackage = lib.genAttrs nixConfig.systems (system:
      self.packages.${system}.hello
    );
  };
}
