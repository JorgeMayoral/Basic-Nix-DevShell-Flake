{
  description = "Basic Nix DevShell Flake";

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
      nativeBuildInputs = with pkgs; [
        # Add your devShell dependencies here
        nushell
      ];

      shellHook = ''
        # Add your shellHook commands here
        echo "Hello from Nix DevShell!"
        echo "nushell: $(nu --version)"
        exec nu
      '';
    };
  };
}
