---
name: jira:sync
description: Sync all local issues from .issues/ folder to Jira (create new, update existing)
agent: build
allowed-tools: Bash(mcp), Read, Write
---

Sync all local issues from individual YAML files in `.issues/` folder to Jira using MCP Atlassian integration. Creates new issues and updates existing ones.

## Process

1. **Local Analysis**: Scan `.issues/` for YAML files, identify new (`synced: false`) and existing issues
2. **Jira Integration**: Use MCP Atlassian to create/update issues, map epics, handle field mapping
3. **Local Updates**: Update files with Jira IDs, set `synced: true`, update timestamps

## Sync Logic

**New Issues**:
- Validate required fields (summary, issue_type, priority)
- Create in Jira via MCP Atlassian
- Update local file with `jira_issue_key` and `synced: true`

**Existing Issues**:
- Compare local vs Jira state
- Update changed fields only
- Update `updated_at` timestamp

## Field Mapping

Map local fields to Jira:
- Core: summary, description, issue_type, priority
- Planning: parent_epic, story_points, labels, components
- Custom: Parse description sections for Jira fields

## Output Format

Show sync results with:
- **Created Issues**: New issues with Jira IDs
- **Updated Issues**: Modified existing issues
- **Failed Issues**: Errors with troubleshooting
- **Summary Statistics**: Counts by type and status

## Error Handling

**MCP Connection**: Check configuration, network, authentication
**Jira API**: Handle permissions, invalid data, missing fields
**File System**: Fix permissions, disk space, file locking

## Advanced Features

- `--force-update`: Update all issues regardless of changes
- `--dry-run`: Preview sync without making changes
- `--type`: Filter by issue type
- `--priority`: Filter by priority level

## Common Workflow

```bash
jira:create "Add user authentication"
jira:list  # Review local issues
jira:sync  # Sync to Jira
jira:list  # Verify sync status
```
