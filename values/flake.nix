{
  description = "A string as an input argument";
  inputs.thing.value = "mething233";

  outputs = { self, nixpkgs, thing }: with nixpkgs.legacyPackages.x86_64-linux; {
    defaultPackage.x86_64-linux = runCommand "something" {} ''
      echo xxx
      echo value is: ${builtins.readFile thing}
      echo xxx
      '';
  };
}
