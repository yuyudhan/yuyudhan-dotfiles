Purpose: Identify OpenSpec change proposals with incomplete tasks.

Workflow:
1. Scan `./openspec/changes/` directory for all change folders
2. For each change, read `tasks.md` and identify unchecked tasks `[ ]`
3. Report proposals that have pending work

Output:
- List of change proposals grouped by status:
  - Changes with pending tasks (show count and incomplete task items)
  - Changes with all tasks complete (summary count only)
- For each pending change, display:
  - Change name
  - Total tasks vs completed tasks (e.g., "3/5 tasks complete")
  - List of incomplete task items

Format:
```
## Pending Changes

### change-name-1 (2/5 tasks complete)
- [ ] 1.1 Task description
- [ ] 2.3 Task description

### change-name-2 (1/3 tasks complete)
- [ ] 1.2 Task description
```

Note:
- Tasks in OpenSpec use numbered format: `- [ ] 1.1 Description` or `- [x] 1.1 Description`
- Only list incomplete tasks in the output
- If all changes are complete, suggest running the archive command
