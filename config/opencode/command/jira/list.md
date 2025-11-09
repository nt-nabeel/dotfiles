---
name: jira:list
description: List all issues stored in individual YAML files in .issues/ folder
agent: plan
---

List and display all issues stored as individual YAML files in the `.issues/` folder with their current status and details.

## Process

1. **Scan Directory**: Find all `.yaml` files in `.issues/`
2. **Parse Files**: Extract issue details and validate format
3. **Categorize**: Group by sync status (local vs synced)
4. **Display**: Format issues with key details and statistics

## Output Format

Show issues grouped by sync status:

- **Unsynced Issues**: Local only, ready to sync
- **Synced Issues**: Already in Jira with Jira IDs
- **Summary Statistics**: Counts by type, priority, and status

**Status Indicators**:

- 🟡 Local Only
- 🟢 Synced to Jira
- 🔴 Sync Error

**Priority Indicators**:

- 🔴 Highest/High
- 🟡 Medium
- 🟢 Low/Lowest

## Error Handling

If `.issues/` doesn't exist or is empty, show setup message with `jira:create` example.

If YAML parsing fails, show error with file validation commands.

## Expected File Structure

```
.issues/
├── timestamp-component-type-summary.yaml
└── ...
```

Each file contains: issue_key, summary, description, issue_type, priority, story_points, jira_issue_key, synced, created_at, updated_at, project, labels, components, dependencies, blocks.
