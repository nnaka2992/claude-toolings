# Git Workflow

- Use conventional prefixes (`feat`, `fix`, `chore`, `docs`, `refactor`, `test`, `ci`) for both branch names (e.g., `feat/add-cache`) and commit messages (e.g., `feat: add cache layer`).
- Before starting any work, create a proper branch from main with a conventional prefix matching the work type.
- Write concise commit messages focused on the "why" rather than the "what".
- Never use `git push --force`. Use `--force-with-lease` only if absolutely necessary.
- Never add `Co-Authored-By` lines to commit messages. This is strictly not allowed.
- Never push directly to main/master. Always work on a branch and open a PR.
