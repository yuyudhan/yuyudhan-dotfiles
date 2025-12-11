Purpose: Find and archive completed OpenSpec change proposals that have all tasks marked as done.

Workflow:
1. Scan `./openspec/changes/` directory for all change folders
2. For each change, read `tasks.md` and check if all tasks are marked complete (all checkboxes `[x]`)
3. List proposals with 100% task completion
4. Ask user for confirmation before archiving
5. After user confirms, run: `openspec archive <change-name> --yes` for each completed change

Output:
- List of fully completed changes ready for archiving
- Confirmation prompt with change names
- Archive results summary

Note:
- Only propose archiving changes where ALL tasks in tasks.md are checked `[x]`
- Use `--yes` flag to skip interactive prompts when running archive command
- Changes are moved to `openspec/archive/` and specs are merged into `openspec/specs/`
