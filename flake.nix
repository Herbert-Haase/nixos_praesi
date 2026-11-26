# nix develop
# pnpm install
# pnpm run dev
# pnpm exec slidev build
{
  description = "Slidev presentation with pnpm";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forEachSupportedSystem = f:
      nixpkgs.lib.genAttrs supportedSystems (system:
        f {
          pkgs = import nixpkgs {inherit system;};
        });
  in {
    devShells = forEachSupportedSystem ({pkgs}: {
      default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          nodejs
          pnpm
          chromium
        ];
        shellHook = ''
        alias npm="pnpm"
        '';

        env = {
          PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH = pkgs.lib.getExe pkgs.chromium;
          PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD = "1";
        };
      };
    });
  };
}
