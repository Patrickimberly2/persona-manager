# Content Operations Guide

## Review cadence and ownership
- **Weekly content review (Mondays):** Check landing, role, and gallery pages for freshness, broken links, and accuracy of persona assets. Capture issues in the backlog and assign owners before Tuesday standup.
- **Monthly governance audit (first Monday):** Confirm metadata, accessibility checks, and SEO tags on core pages; rotate through assets to ensure licensing and alt text remain correct.
- **Owners**
  - **Content lead:** Approves page copy, metadata, and publishing schedule; tracks the review calendar.
  - **Design lead:** Owns visual standards and updates to avatars, role cards, and brand assets.
  - **Web lead:** Maintains build/deploy health, link integrity, and performance budgets.
  - **DRIs per page/asset:** Each page (e.g., `index.html`, `role_cards.html`) and asset folder (`brand/assets/`) has a named directly responsible individual recorded in the backlog; they must sign off on changes touching their scope.

## Adding or editing pages
1. Create a feature branch: `git checkout -b feature/<short-description>`.
2. Edit or add HTML pages in the repo root (e.g., `index.html`, `role_cards.html`, `cover.html`). Keep headings, metadata, and CTAs consistent with the site brief.
3. Preview locally with a static file server (e.g., `python -m http.server 8000` from the repo root) and smoke test navigation, links, and forms.
4. Run link and accessibility spot checks (headings order, alt text, color contrast) on changed sections.
5. Update the backlog with what changed and who approved it.

## Managing assets
1. Store new assets under `brand/assets/` using kebab-case names and SVG/WEBP/PNG formats when possible.
2. Reference assets with relative paths; verify dimensions and file weight meet performance budgets before commit.
3. When replacing an asset, keep the previous version for one release (tagged in Git) in case rollback is needed.
4. Document usage notes (purpose, placement, attribution) in the backlog item for the asset change.

## Standard commit and deploy process
1. Ensure a clean working tree: `git status`.
2. Stage and commit with a clear, imperative message: `git add <files>` then `git commit -m "Update <scope>"`.
3. Push your branch and open a PR; require at least one approval from another owner (content/design/web depending on the change).
4. Merge to `work` after approval; deployments are sourced from `work` → publish to the static host (e.g., GitHub Pages/Netlify) via the repo’s configured pipeline.
5. Post-deploy smoke test: load the homepage, one persona page, and an assets-heavy page to confirm images and links resolve.

## Backups and versioning
- **Git as source of truth:** Every content and asset change is committed; do not edit production directly.
- **Release tags:** Tag deploy-ready snapshots as `release-YYYYMMDD` to capture the exact version deployed.
- **Asset rollback:** Keep the prior release tag available for quick revert; restoring an asset means checking out the tagged file and recommitting it.
- **Off-repo backup (weekly):** Export a ZIP of the repo (including `brand/assets/`) to the team drive or S3 bucket each Friday.
- **Change log:** Maintain a brief entry in the PR description summarizing page and asset changes to aid audit trails.
