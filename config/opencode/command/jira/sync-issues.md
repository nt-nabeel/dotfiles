---
name: jira:sync-issues
description: Sync all local issues to Jira (create new, update existing)
agent: build
allowed-tools: Bash(mcp), Read, Write
---

Sync all local issues from `.jira-issues.yaml` to Jira using MCP Atlassian integration. Creates new issues and updates existing ones.

## Sync Process

1. **Local Analysis**:
   - Read all issues from `.jira-issues.yaml`
   - Identify new issues (`pushed: false`)
   - Identify existing issues (`pushed: true` with `issue_id`)

2. **Jira Integration**:
   - Use MCP Atlassian to connect to Jira
   - Fetch available epics for parent ID mapping
   - Create new issues or update existing ones

3. **Local Updates**:
   - Update `.jira-issues.yaml` with Jira IDs
   - Set `pushed: true` for successful syncs
   - Update timestamps and sync status

## Output Format

### Successful Sync

```markdown
✅ **Issues Synced Successfully**

**Total Issues**: [Number]
**Successfully Synced**: [Number]
**Failed**: [Number]

---

### 🔄 New Issues Created

#### Issue [ID]: [Summary] → [Jira ID]

- **Type**: [Issue Type] | **Priority**: [Priority]
- **Status**: ✅ Created successfully
- **Jira URL**: [Link to Jira issue]

---

### 🔄 Existing Issues Updated

#### Issue [ID]: [Summary] ([Jira ID])

- **Type**: [Issue Type] | **Priority**: [Priority]
- **Status**: ✅ Updated successfully
- **Jira URL**: [Link to Jira issue]

---

### 📊 Sync Summary

**By Type**:

- Stories: [Created]/[Updated]
- Tasks: [Created]/[Updated]
- Bugs: [Created]/[Updated]
- Epics: [Created]/[Updated]

**By Status**:

- ✅ Success: [Number]
- ❌ Failed: [Number]

### 📁 Local File Updated

**File**: `.jira-issues.yaml`
**Updated**: [Timestamp]
```

### Partial Success

````markdown
⚠️ **Partial Sync Completed**

**Total Issues**: [Number]
**Successfully Synced**: [Number]
**Failed**: [Number]

---

### ✅ Successful Syncs

[List of successfully synced issues]

---

### ❌ Failed Syncs

#### Issue [ID]: [Summary]

- **Error**: [Specific error message]
- **Suggestion**: [Troubleshooting advice]

---

### 🔧 Troubleshooting Failed Issues

**Common Solutions**:

1. Check Jira connection and credentials
2. Verify project permissions
3. Validate issue data format
4. Check for required custom fields

**Retry Command**:

```bash
jira:sync-issues
```
````

### No Issues to Sync

````markdown
📋 **No Issues to Sync**

**File**: `.jira-issues.yaml`
**Status**: All issues already synced or no issues found

### Current Status

**Total Issues**: [Number]
**All Synced**: ✅ Yes

### 🚀 Actions Available

1. **Create New Issues**:

   ```bash
   jira:create-issue "Your new issue description"
   ```

2. **List Current Issues**:

   ```bash
   jira:list-issues
   ```

3. **Force Update All**:
   If you want to update existing issues in Jira with local changes:
   ```bash
   jira:sync-issues --force-update
   ```
````

## MCP Atlassian Integration

### Connection Setup

- Use MCP Atlassian for Jira API access
- Authenticate with Jira credentials
- Access project and issue data

### Epic Mapping

- Fetch available epics from Jira project
- Map local `parent_id` to actual Jira epic IDs
- Handle epic creation if needed

### Field Mapping

- Map local fields to Jira field types
- Handle custom fields and required fields
- Validate data before submission

## Sync Logic Details

### New Issues (`pushed: false`)

1. **Validate Data**:
   - Check required fields (summary, issue_type, priority)
   - Validate parent_id exists in Jira
   - Ensure estimation is valid

2. **Create in Jira**:
   - Use MCP Atlassian to create issue
   - Map fields to Jira format
   - Handle creation response

3. **Update Local**:
   - Store returned Jira ID
   - Set `pushed: true`
   - Update `updated_at` timestamp

### Existing Issues (`pushed: true`)

1. **Compare Changes**:
   - Detect field changes since last sync
   - Identify what needs updating
   - Skip if no changes detected

2. **Update in Jira**:
   - Use MCP Atlassian to update issue
   - Send only changed fields
   - Handle update response

3. **Update Local**:
   - Update `updated_at` timestamp
   - Maintain sync status

## Error Handling

### MCP Connection Issues

````markdown
❌ **MCP Connection Error**

**Issue**: Unable to connect to MCP Atlassian

### Troubleshooting

#### 1. MCP Configuration

```bash
# Check opencode.json configuration
cat config/opencode/opencode.json

# Verify MCP Atlassian is configured
```

#### 2. Network Issues

```bash
# Test network connectivity
ping your-jira-instance.atlassian.net

# Check firewall/proxy settings
```

#### 3. Authentication

```bash
# Verify Jira credentials
# Check API token validity
# Confirm project access permissions
```
````

### Jira API Errors

```markdown
❌ **Jira API Error**

**Issue**: Jira API returned error for issue [ID]

### Common API Errors

#### 1. Permission Denied

- Check user permissions in Jira
- Verify project access
- Confirm create/update permissions

#### 2. Invalid Field Data

- Validate issue type exists
- Check priority values
- Verify epic ID is valid

#### 3. Required Fields Missing

- Identify missing required fields
- Add custom field data
- Complete mandatory information

### Resolution Steps

1. Review error details
2. Fix issue data locally
3. Run sync again
```

### File System Issues

````markdown
❌ **File System Error**

**Issue**: Unable to update `.jira-issues.yaml`

### Solutions

#### 1. File Permissions

```bash
# Check file permissions
ls -la .jira-issues.yaml

# Fix permissions
chmod 644 .jira-issues.yaml
```

#### 2. Disk Space

```bash
# Check available space
df -h

# Clean up if needed
```

#### 3. File Locking

```bash
# Check if file is locked
lsof .jira-issues.yaml

# Wait or kill locking process
```
````

## Advanced Features

### Force Update Mode

- Update all issues regardless of change detection
- Useful for bulk updates or corrections
- Use with `--force-update` flag

### Dry Run Mode

- Preview what would be synced without making changes
- Validate data before actual sync
- Use with `--dry-run` flag

### Selective Sync

- Sync specific issue types only
- Filter by priority or status
- Use with filter flags

## Usage Examples

### Basic Sync

- `jira:sync-issues` - Sync all pending issues

### Advanced Sync

- `jira:sync-issues --force-update` - Force update all issues
- `jira:sync-issues --dry-run` - Preview sync without changes
- `jira:sync-issues --type Story` - Sync only stories

### Common Workflows

```bash
# Create issues
jira:create-issue "Add user authentication"
jira:create-issue "Fix login bug"

# Review local issues
jira:list-issues

# Sync to Jira
jira:sync-issues

# Verify sync status
jira:list-issues
```

This command provides comprehensive bidirectional synchronization between your local issue management and Jira.
