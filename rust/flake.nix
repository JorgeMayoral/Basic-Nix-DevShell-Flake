{
  description = "Basic Nix DevShell Flake for Rust development";

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
        rustup
      ];

      shellHook = ''
        rustup default stable
        rustup update
        echo "----------------------------------------"
        echo "nushell: $(nu --version)"
        echo "rustc: $(rustc --version)"
        echo "cargo: $(cargo --version)"
        exec nu
      '';
    };
  };
}
