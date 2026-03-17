# Nix for External Dependencies

- Use Nix whenever an external dependency, tool, or runtime is needed.
- Never install dependencies via `apt`, `brew`, `npm -g`, `pip install --user`, or any other system-level package manager.
- Define all dependencies in Nix expressions (e.g., `shell.nix`, `flake.nix`, or `devShell`).
- Ensure reproducible environments: anyone with Nix can replicate the setup from the repository alone.
- If a dependency cannot be installed via Nix, ask the user how to proceed before taking any other action.
