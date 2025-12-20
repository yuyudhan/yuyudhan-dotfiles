Model: claude-3-5-haiku-20241022

Purpose: Create logical git commits with emoji-prefixed messages for changed files.

Scope: Commit only the specific code flow, files, endpoints, or features provided. If no specific context given, commit all staged/unstaged changes that should be committed.

Author: yuyudhan <ankurkumarpandey@gmail.com>

Format: `<emoji> <imperative verb> <specific description>`

Emojis:
- ✨ New features  ⚡ Performance  🎨 UI/UX  🚀 Deployment
- 🐛 Bug fixes  🔒 Security  🔥 Remove dead code
- ♻️ Refactor  🎯 Scope refinement  🧹 Cleanup
- 🔧 Config  📝 Docs  🧪 Tests  🗑️ Removal
- 💡 Experimental  🤝 Merges

Grouping:
- By purpose (feature/fix together)
- By layer (frontend/backend separate)
- By type (test with code it tests)
- Keep focused (one logical change per commit)

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

