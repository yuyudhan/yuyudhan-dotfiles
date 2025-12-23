---
description: Push all feature branches to remote, excluding main/master/develop
model: anthropic/claude-sonnet-4-5
---

Purpose: Push all local feature branches to origin remote for PR creation.

Scope: Push all branches except main, master, and develop branches.

Execution:
1. List all local branches
2. Exclude: main, master, develop
3. Push each feature branch to origin with tracking
4. Report pushed branches and any errors

Command Pattern:
```bash
git branch | grep -v "main\|master\|develop" | xargs -I {} git push -u origin {}
```

Safety Checks:
- Verify remote 'origin' exists
- Skip branches already up-to-date
- Report any push failures
- Confirm no uncommitted changes on branches

Output:
- List of branches pushed successfully
- Any branches skipped (already up-to-date)
- Any errors encountered
- Reminder: Create PRs manually for pushed branches
