{
  description = "A basic Nix DevShell flake template";

  outputs = {self}: {
    templates = {
      default = {
        path = ./default;
        description = "Basic Nix DevShell Flake";
      };
    };

    defaultTemplate = self.templates.default;
  };
}
