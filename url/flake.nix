{
  description = "A very basic flake";
  inputs.example = {
    url = "https://example.com";
    flake = false;
  };

  outputs = { self, example, nixpkgs }: {
    packages.x86_64-linux.example = nixpkgs.legacyPackages.x86_64-linux.runCommand "ex" {} ''
      cp ${example} $out

      '';
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.example;

  };
}
