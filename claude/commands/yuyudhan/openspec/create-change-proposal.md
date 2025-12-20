## Purpose
Create a new OpenSpec change proposal with proposal.md, tasks.md, and spec deltas.

## Command Flow
**AI creates files manually** (OpenSpec CLI doesn't have a create command)

Then validate:
```bash
openspec validate <change-name>
openspec show <change-name>
```

## Steps
1. Create directory: `openspec/changes/<change-name>/`
2. Create `proposal.md`:
   ```markdown
   # Proposal: <Feature Name>
   
   ## Purpose
   Why this change is needed.
   
   ## Scope
   What will change.
   
   ## Impact
   How it affects the system.
   ```

3. Create `tasks.md`:
   ```markdown
   ## 1. Section Name
   - [ ] 1.1 Specific task
   - [ ] 1.2 Another task
   
   ## 2. Another Section
   - [ ] 2.1 Task here
   ```

4. Create `specs/<spec-path>/spec.md` (delta):
   ```markdown
   # Delta for <Spec Name>
   
   ## ADDED Requirements
   ### Requirement: Name
   The system SHALL <description>.
   
   #### Scenario: scenario name
   - WHEN <condition>
   - THEN <expected behavior>
   
   ## MODIFIED Requirements
   ### Requirement: Name
   The system SHALL <updated description>.
   
   #### Scenario: scenario name
   - WHEN <condition>
   - THEN <updated behavior>
   
   ## REMOVED Requirements
   ### Requirement: Name
   <Reason for removal>
   ```

5. Run validation:
   ```bash
   openspec validate <change-name>
   openspec show <change-name>
   ```

## Rules
- Use kebab-case for `<change-name>` (e.g., `add-2fa`)
- Use SHALL/MUST in requirements
- Every requirement needs ≥1 scenario with WHEN/THEN
- Number tasks: `1.1`, `1.2`, `2.1`, etc.
- Check existing specs first: `openspec spec show <spec-path>`

## Output
After creation, show:
- Files created
- Validation results
- Next step: "Review proposal, then run `/openspec:apply <change-name>`"

## Guardrails
- ❌ Don't create stub code (only spec documents)
- ❌ Don't skip validation
- ✅ Reference `openspec/project.md` for project conventions
- ✅ Make tasks specific and actionable
