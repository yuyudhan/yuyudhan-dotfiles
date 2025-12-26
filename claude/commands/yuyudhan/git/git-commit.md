---
description: Create logical git commits with emoji-prefixed messages
model: anthropic/claude-sonnet-4-5
---

Author: yuyudhan <ankurkumarpandey@gmail.com>

## Task

Create git commits for all staged and unstaged changes, organizing them into separate feature branches by logical grouping.

**CRITICAL**: Ensure NO changes are lost - all modifications must be committed and pushed.

## Step-by-Step Workflow

### Step 1: Analyze All Changes

First, run `git status` and `git diff` to see ALL changes (staged and unstaged).

Group the changes into logical units based on:
- Feature/functionality they belong to
- Type of change (new feature, bugfix, refactor, docs, config)
- Related files that should be committed together

**Output a plan** listing each logical group with:
- Branch name to create
- Files belonging to this group
- Commit message for this group

### Step 2: Store Current Branch

```bash
ORIGINAL_BRANCH=$(git branch --show-current)
```

### Step 3: For EACH Logical Group (Repeat This Entire Block)

**IMPORTANT**: Complete ALL steps for one branch before moving to the next.

```bash
# 3a. Return to original branch first (to ensure clean base)
git checkout $ORIGINAL_BRANCH

# 3b. Create new feature branch
git checkout -b feat/<descriptive-name>

# 3c. Stage ONLY files for this logical group
git add <file1> <file2> ...

# 3d. Commit with emoji-prefixed message
git commit -m "<emoji> <imperative-verb> <specific-description>"

# 3e. Push branch to remote
git push -u origin feat/<descriptive-name>
```

### Step 4: Repeat Step 3 for Each Remaining Group

Go back to Step 3 for the next logical group. Each group gets its OWN branch.

### Step 5: Verify No Changes Lost

```bash
git checkout $ORIGINAL_BRANCH
git status
```

Should show no uncommitted changes. If changes remain, create another branch for them.

## Branch Naming

- `feat/<feature-name>` - New features
- `fix/<issue-name>` - Bug fixes
- `refactor/<area>` - Code refactoring
- `docs/<topic>` - Documentation
- `config/<tool>` - Configuration changes

## Commit Message Format

`<emoji> <imperative-verb> <specific-description>`

### Rules
- Imperative mood: "Add", "Fix", "Update", "Remove"
- Be specific: mention files/functions/features
- NO vague terms: "Update files", "Changes", "WIP"
- NO past tense: "Added", "Fixed"
- NO AI references: "Claude", "generated", "assistant"

### Examples
- `✨ Add JWT authentication to user API`
- `🐛 Fix null pointer in payment processor`
- `📝 Add README for authentication module`
- `🔧 Configure ESLint rules for TypeScript`

## Protected Branches

**NEVER commit or push directly to**: `develop`, `main`, or `master`

Always use feature branches and pull requests.

## Final Output

After completing all branches, list:
1. Each branch created
2. Commit message used
3. Files included in that branch
4. Push status (success/failure)
