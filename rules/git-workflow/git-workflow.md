# Git Workflow

- Use conventional branch naming: `feat/`, `fix/`, `chore/`, `docs/`, `refactor/`, `test/` prefixes.
- Before starting any work, create a proper branch from main with a conventional prefix matching the work type.
- Never use `git push --force`. Use `--force-with-lease` only if absolutely necessary.
- Never add `Co-Authored-By` lines to commit messages. This is strictly not allowed.
- Never push directly to main/master. Always work on a branch and open a PR.
