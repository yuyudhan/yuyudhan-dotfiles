---
description: Create logical git commits with emoji-prefixed messages and proper branch management
model: anthropic/claude-sonnet-4-5
---

Purpose: Create logical git commits with emoji-prefixed messages and organize work into feature-specific branches.

Scope: Commit only the specific code flow, files, endpoints, or features provided. If no specific context given, commit all staged/unstaged changes that should be committed.

Author: yuyudhan <ankurkumarpandey@gmail.com>

Branch Strategy:
- **Features**: `feat/<feature-name>` - New functionality, enhancements
- **Fixes**: `hotfix/<issue-description>` - Bug fixes, critical patches
- **Refactors**: `refactor/<component-name>` - Code restructuring
- **Docs**: `docs/<topic>` - Documentation updates
- **MANDATORY**: Create separate branches for logically distinct features
- **Multiple branches allowed**: Create as many branches as needed per session
- **Pattern**: Create branch → add files → commit → switch to next branch → repeat
- Branch from `main`, merge back to `main` via PR
- Keep branches focused (one feature/fix per branch)

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
1. Analyze changes - identify logically distinct features/fixes
2. For each logical unit:
   - Create appropriate branch (feat/*, hotfix/*, etc.)
   - Stage related changes for that feature
   - Create focused commits with emoji-prefixed messages
   - Push to remote branch
3. Repeat for all logical units (multiple branches in one session is normal)
4. Return to original branch or main when done
5. Do NOT auto-merge - user creates PRs manually

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

