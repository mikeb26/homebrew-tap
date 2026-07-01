# AGENTS.md

## Repository overview
This repository is a Homebrew tap for `mikeb26` projects. The main source of truth is the formula under `Formula/`.

## Working in this repo
- Keep changes minimal and Homebrew-focused.
- When editing a formula, make sure the filename, class name, and `brew install` path stay aligned.
- Prefer Homebrew conventions over custom logic.
- Avoid changing the README unless the user-facing install or tap instructions actually change.
- Do not commit generated build artifacts or vendored dependencies unless the formula explicitly requires them.

## Formula guidance
- Formula files live in `Formula/`.
- If you update a release tarball, also update the `sha256`, versioned URL, and any embedded version strings used by the build.
- Keep the `homepage`, `license`, and `head` metadata accurate.
- Preserve existing test blocks unless you have a specific reason to change them.

## Verification
When possible, verify formula changes with Homebrew tooling, for example:
- `brew audit --strict --online Formula/<name>.rb`
- `brew test Formula/<name>.rb`
- `brew install --build-from-source Formula/<name>.rb`

If the environment does not have Homebrew available, note that in your handoff.
