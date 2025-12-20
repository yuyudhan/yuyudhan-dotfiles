---
description: Organize markdown files into proper structure
model: anthropic/claude-haiku-4-5
---

Purpose: Organize markdown files scattered across the repository into proper documentation structure.

Scope: Find and organize markdown files in the provided context (specific directories or entire repository if not specified).

Target Structure:
- Only README.md and CONTRIBUTING.md stay at repository root
- All other markdown files must be organized into proper structure:
  - Documentation: docs/ directory
  - Internal/private docs: internal-docs/ directory
  - API docs: docs/api/
  - Guides/tutorials: docs/guides/
  - Component/module-specific: near their code or in docs/components/
- Move LICENSE.md, CHANGELOG.md, and all other .md files to docs/ or appropriate subdirectory

Discovery:
- Find all .md files in repository
- Exclude: node_modules/, vendor/, build/, dist/, .git/
- Categorize by purpose: README, API, guides, internal, misc
- Identify misplaced files (docs at root, scattered locations)

Organization Rules:
- Group related docs together
- Maintain logical hierarchy (parent/child topics)
- Preserve git history (use git mv, not delete+create)
- Update all internal links after moving
- Create directory structure if missing

Link Updates:
- Fix all relative links broken by moves
- Update references in code comments if applicable
- Check README links to moved documentation
- Verify anchor links still work

.gitignore:
- Ensure docs directories are tracked
- Add build output docs to .gitignore if generated

Output:
- List of files moved with old → new paths
- Directory structure created
- Links updated with file:line locations
- Summary: total files organized by category
- Updated .gitignore if needed

