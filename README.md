# Nix DevShell Flakes

## Usage

Initialize flake in current directory:

```bash
nix flake init -t github:JorgeMayoral/devshells#<name> 
```

Enter the devshell:

```bash
nix develop
```

## Available templates

All templates include `nushell` as shell.

| Name | Description |
|------|-------------|
| [default](./default/) | Default empty template |
| [nodejs](./nodejs/) | Template with Node.js |
| [rust](./rust/) | Simple template with Rust |
