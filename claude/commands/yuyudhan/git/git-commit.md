---
description: Create logical git commits with emoji-prefixed messages and proper branch management
model: anthropic/claude-sonnet-4-5
---

Purpose: Create logical git commits with emoji-prefixed messages and organize work into feature-specific branches.

Scope: Analyze all changes and group into logically distinct units. Create separate branches for unrelated features/fixes.

Author: yuyudhan <ankurkumarpandey@gmail.com>

Branch Strategy:
- **NEVER commit to**: `main`, `master`, `develop` branches (protected branches)
- **Features**: `feat/<feature-name>` - New functionality, enhancements
- **Fixes**: `hotfix/<issue-description>` - Bug fixes, critical patches
- **Refactors**: `refactor/<component-name>` - Code restructuring
- **Docs**: `docs/<topic>` - Documentation updates
- **MANDATORY**: Separate branches for logically distinct features (multiple per session is normal)
- **Always branch from main**: Stash if needed, switch to main, create feature branch
- **One feature per branch**: Keep focused, merge back via PR

Format: `<emoji> <imperative verb> <specific description>`

Emojis:
- ✨ New features  ⚡ Performance  🎨 UI/UX  🚀 Deployment
- 🐛 Bug fixes  🔒 Security  🔥 Remove dead code
- ♻️ Refactor  🎯 Scope refinement  🧹 Cleanup
- 🔧 Config  📝 Docs  🧪 Tests  🗑️ Removal
- 💡 Experimental  🤝 Merges

Commit Grouping:
- By purpose (feature/fix together)
- By layer (frontend/backend separate)
- By type (test with code it tests)
- Keep focused (one logical change per commit)

Workflow:
1. Check current branch - if on main/master/develop, MUST create feature branch
2. Analyze changes - identify logically distinct units (features, fixes, docs)
3. For each unit:
   - Stash all changes if mixed
   - Switch to main: `git checkout main`
   - Create branch: `git checkout -b feat/feature-name`
   - Stage only files for this unit
   - Commit with emoji-prefixed message
   - Push: `git push -u origin <branch-name>`
4. Repeat step 3 for remaining units
5. Return to main when complete
6. User creates PRs manually (no auto-merge)

Message Requirements:
- Imperative mood: "Add", "Fix", "Update", "Remove"
- Specific: mention files, functions, features
- Include impact when relevant: "Optimize query (2s → 200ms)"
- NO vague messages: "Update files", "Changes", "WIP"
- NO past tense: "Added", "Fixed"
- NEVER mention: Claude, AI, generated, assistant, automated tools

.gitignore:
- Check and update .gitignore for files that shouldn't be committed (secrets, build artifacts, temp files, IDE configs)
- Never commit: .env files (only .env.example), API keys, credentials, node_modules, build outputs

Output:
- List created commits with emoji, message, and files
- Confirm author: yuyudhan <ankurkumarpandey@gmail.com>
- Confirm no AI tool references in messages

