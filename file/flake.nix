{
  inputs.config = {
    url = "file+file:///dev/null";
    flake = false;
  };


  outputs = { self, nixpkgs, config, ...} :
  {
    packages = with nixpkgs; lib.genAttrs ["x86_64-linux"] (system: {
      default = legacyPackages.${system}.runCommand "asdf" {} ''
          echo xxx
          echo config is: ${if builtins.readFileType config == "directory" then import config else ""}
          echo xxx
          '';
        }) ;
  };
}
