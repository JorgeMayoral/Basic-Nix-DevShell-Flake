{
  description = "Basic Nix DevShell Flake for Node.js development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        nushell
        nodejs_21
      ];

      shellHook = ''
        echo "nushell: $(nu --version)"
        echo "nodejs: $(node --version)"
        exec nu
      '';
    };
  };
}
