# Git Commit with Emotional Context

Create meaningful git commits for all changed files, organized logically with emoji-prefixed commit messages that reflect the nature of changes.

## ⚠️ CRITICAL REQUIREMENTS

**NEVER mention Claude, Claude Code, AI, assistants, code generation tools, or any automated tools in commit messages.**

Commit messages must appear as if written by a human developer working on the code naturally. This is NON-NEGOTIABLE.

## Author Configuration

Before creating commits, set git author configuration:

```bash
git config --global user.name "yuyudhan"
git config --global user.email "ankurkumarpandey@gmail.com"
```

All commits must be authored by:
- Name: yuyudhan (Display: Ankur Pandey)
- Email: ankurkumarpandey@gmail.com

## Commit Message Format

**Exact format** for every commit message:

```
<emotion-emoji> <imperative verb> <specific description of what changed>
```

**Examples of proper format:**
- ✨ Add user authentication with JWT and refresh tokens
- 🐛 Fix race condition in WebSocket connection handler
- ♻️ Extract validation logic into reusable middleware

### Emotion Emojis - Choose ONE per commit

Select the emoji that BEST represents the primary change type:

**Features & Improvements:**
- ✨ New features, capabilities, or functionality added
- ⚡ Performance improvements or optimizations
- 🎨 UI/UX improvements, styling, or visual changes
- 🚀 Deployment, releases, or production-related changes

**Fixes & Corrections:**
- 🐛 Bug fixes or error corrections
- 🔒 Security fixes or improvements
- 🔥 Remove problematic, dead, or deprecated code

**Code Quality:**
- ♻️ Refactoring (no behavior change)
- 🎯 Focus improvements or scope refinement
- 🧹 Code cleanup or formatting

**Infrastructure:**
- 🔧 Configuration or settings changes
- 📝 Documentation updates (README, comments, guides)
- 🧪 Tests added, modified, or fixed
- 🗑️ File or code removal

**Other:**
- 💡 Experimental features or proof-of-concepts
- 🤝 Merges or integration work

## Commit Organization Rules

### 1. Logical Grouping
Organize changed files into cohesive, logical commits:
- **Group by purpose**: Files serving the same feature/fix go together
- **Group by layer**: Frontend changes separate from backend changes
- **Group by type**: Tests with the code they test, configs with affected code
- **Keep focused**: One logical change per commit (e.g., "Add user login" not "Add login and fix typos and update config")

### 2. Commit Size Guidelines
Find the balance between atomic and meaningful:

**Good commit sizes:**
- A complete feature component (controller + routes + tests)
- A bug fix with its test
- Related configuration changes
- A full refactoring of a module

**Too small (avoid):**
- Single line typo fix as separate commit
- Each file in a feature as separate commit
- Formatting-only changes (unless that's the explicit goal)

**Too large (avoid):**
- Entire feature with multiple components in one commit
- Multiple unrelated bug fixes together
- Mix of features, fixes, and refactoring

### 3. Message Quality Standards

**Required characteristics:**
- Use imperative mood: "Add", "Fix", "Update", "Remove", "Refactor"
- Be specific about WHAT changed: mention file names, functions, features
- Include WHY when not obvious: "Fix memory leak by clearing event listeners"
- Show impact: "Optimize query performance from 2s to 200ms"

**Forbidden characteristics:**
- ❌ Generic: "Update files", "Fix stuff", "Changes", "WIP"
- ❌ Past tense: "Added", "Fixed", "Updated"
- ❌ Vague: "Improve code", "Make better", "Various updates"
- ❌ Tool mentions: "Generated with...", "AI-assisted...", "Claude created..."

## ⛔ STRICTLY FORBIDDEN

**NEVER include these in commit messages:**
- "Claude" or "Claude Code"
- "AI", "AI-generated", "AI-assisted"
- "Generated", "auto-generated" (in context of AI tools)
- "Assistant" or "bot"
- Any other references to automated code generation tools

**Write commit messages as a human developer would.** No exceptions.

## Examples

### ✅ EXCELLENT Commit Messages

```
✨ Add JWT-based authentication with refresh token support
🐛 Fix race condition in WebSocket reconnection handler
♻️ Extract validation logic into shared middleware module
⚡ Optimize database queries with connection pooling (2s → 200ms)
🔧 Configure Redis cache with 1-hour TTL for session data
🧪 Add integration tests for payment processing flow
🔒 Sanitize user input to prevent XSS attacks
📝 Document API endpoints in OpenAPI specification
🎨 Redesign dashboard layout with responsive grid system
🗑️ Remove deprecated Python 2 compatibility shims
```

### ❌ UNACCEPTABLE Commit Messages

```
❌ Update files                              (too vague)
❌ Fix bug                                   (no context)
❌ Changes                                   (meaningless)
❌ WIP                                       (not descriptive)
❌ Various updates                           (too generic)
❌ Added feature with Claude                 (mentions AI tool)
❌ AI-generated authentication module        (mentions AI)
❌ Fix stuff                                 (too vague)
❌ Updated code                              (past tense, vague)
❌ Refactor                                  (incomplete - refactor what?)
```

## Execution Workflow

When running this command, follow these steps:

1. **Review changes**: Use `git status` and `git diff` to understand all modifications
2. **Set author**: Run the git config commands to set proper author credentials
3. **Group logically**: Identify related changes and group them into cohesive commits
4. **Create commits**: For each logical group:
   - Stage the relevant files with `git add <files>`
   - Create commit with proper emoji and message
   - Use author: yuyudhan <ankurkumarpandey@gmail.com>
5. **Verify**: Run `git log --oneline` to show created commits

## Output Format

After creating all commits, provide:

```
Created X commits:

1. ✨ Add user authentication with JWT and refresh tokens
   Files: src/auth/jwt.ts, src/middleware/auth.ts, tests/auth.test.ts

2. 🔧 Configure Redis for session caching
   Files: config/redis.ts, docker-compose.yml

3. 📝 Document authentication endpoints
   Files: docs/api.md, README.md

✓ All commits authored by: yuyudhan <ankurkumarpandey@gmail.com>
✓ Commit messages follow human developer style (no AI tool references)
```

