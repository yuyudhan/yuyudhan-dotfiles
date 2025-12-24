---
description: Push all feature branches to remote, excluding main/master/develop
model: anthropic/claude-sonnet-4-5
---

Purpose: Push recent local feature branches to origin remote for PR creation.

Scope: Push branches modified within last 7 days, excluding main, master, and develop.

Execution:
1. List all local branches
2. Exclude: main, master, develop
3. Filter branches by age (≤7 days old)
4. Push each recent feature branch to origin with tracking
5. Report pushed branches, skipped old branches, and any errors

Command Pattern:
```bash
# Get branches modified in last 7 days, excluding protected branches
git for-each-ref --sort=-committerdate --format='%(refname:short) %(committerdate:relative)' refs/heads/ \
  | grep -v "main\|master\|develop" \
  | grep -E "hours?|days? ago|[0-6] days? ago" \
  | awk '{print $1}' \
  | xargs -I {} git push -u origin {}
```

Safety Checks:
- Verify remote 'origin' exists
- Only push branches ≤7 days old (ignore stale branches)
- Skip branches already up-to-date
- Report any push failures
- Confirm no uncommitted changes on branches

Output:
- List of branches pushed successfully (with age)
- Branches skipped: already up-to-date
- Branches ignored: older than 7 days
- Any errors encountered
- Reminder: Create PRs manually for pushed branches
