---
name: jira:list-issues
description: List all issues stored in the local YAML file
agent: plan
---

List and display all issues stored in the local `.jira-issues.yaml` file with their current status and details.

## Issue Listing Process

1. **File Reading**:
   - Read `.jira-issues.yaml` from current workspace
   - Parse YAML structure and validate format
   - Handle missing or corrupted files

2. **Issue Analysis**:
   - Extract all issue details
   - Categorize by sync status (pushed vs unpushed)
   - Sort by issue ID or creation date

3. **Display Formatting**:
   - Format issues for easy review
   - Highlight sync status
   - Show key fields prominently

## Output Format

### Issues Found

```markdown
📋 **Local Jira Issues**

**Total Issues**: [Number]
**Synced**: [Number] | **Local Only**: [Number]
**File**: `.jira-issues.yaml`

---

### 🔄 Unsynced Issues (Local Only)

#### Issue [ID]: [Summary]

- **Type**: [Issue Type] | **Priority**: [Priority] | **Estimation**: [Story Points]
- **Status**: 🟡 Local Only
- **Created**: [Creation Date]
- **Description**: [Brief description excerpt]

---

### ✅ Synced Issues

#### Issue [ID]: [Summary] → [Jira ID]

- **Type**: [Issue Type] | **Priority**: [Priority] | **Estimation**: [Story Points]
- **Status**: 🟢 Synced to Jira
- **Jira ID**: [Jira ID] | **Created**: [Creation Date]
- **Description**: [Brief description excerpt]

---

### 📊 Summary Statistics

**By Type**:

- Stories: [Count]
- Tasks: [Count]
- Bugs: [Count]
- Epics: [Count]

**By Priority**:

- Highest: [Count]
- High: [Count]
- Medium: [Count]
- Low: [Count]
- Lowest: [Count]

**By Status**:

- 🟡 Local Only: [Count]
- 🟢 Synced: [Count]
```

### No Issues Found

````markdown
📋 **No Local Issues Found**

**File**: `.jira-issues.yaml`
**Status**: Empty or doesn't exist

### 🚀 Get Started

Create your first issue with:

```bash
jira:create-issue "Add user authentication system"
```

### 💡 Quick Examples

- `jira:create-issue "Fix login validation bug"`
- `jira:create-issue "Implement user registration"`
- `jira:create-issue "Create admin dashboard"`
````

### File Not Found

````markdown
📋 **No Issues File Found**

**Expected File**: `.jira-issues.yaml`
**Current Directory**: [Current working directory]

### 🔧 Setup Required

Create your first issue to initialize the file:

```bash
jira:create-issue "Your issue description here"
```

This will create the `.jira-issues.yaml` file with your first issue.
````

## Display Options

### Detailed View

- Full descriptions for all issues
- Complete metadata display
- Creation and modification timestamps

### Compact View

- Summary lines only
- Key status indicators
- Quick overview format

### Filtered Views

- By sync status (local vs synced)
- By issue type (Story, Task, Bug, Epic)
- By priority level
- By date range

## Status Indicators

### Sync Status

- 🟡 **Local Only**: Issue exists locally, not synced to Jira
- 🟢 **Synced**: Issue successfully synced to Jira
- 🔴 **Sync Error**: Issue failed to sync (if applicable)

### Priority Indicators

- 🔴 **Highest/Urgent**: Critical issues
- 🟠 **High**: Important issues
- 🟡 **Medium**: Standard priority
- 🟢 **Low**: Nice to have
- ⚪ **Lowest**: Optional items

### Type Indicators

- 📖 **Story**: User stories and features
- ✅ **Task**: Development tasks
- 🐛 **Bug**: Bug fixes and issues
- 🏗️ **Epic**: Large features and epics

## Sorting Options

### Default Sort

- By issue ID (001, 002, 003...)
- Shows unsynced issues first
- Then synced issues

### Alternative Sorts

- **By Priority**: Highest to Lowest
- **By Type**: Grouped by issue type
- **By Date**: Newest to Oldest
- **By Status**: Local then Synced

## Error Handling

### File Access Issues

````markdown
❌ **File Access Error**

**Issue**: Unable to read `.jira-issues.yaml`

### Troubleshooting

#### 1. File Permissions

```bash
# Check file permissions
ls -la .jira-issues.yaml

# Fix permissions if needed
chmod 644 .jira-issues.yaml
```

#### 2. File Corruption

```bash
# Check YAML syntax
python -c "import yaml; yaml.safe_load(open('.jira-issues.yaml'))"

# Backup and recreate if corrupted
cp .jira-issues.yaml .jira-issues.yaml.backup
```

#### 3. Directory Issues

```bash
# Check current directory
pwd

# Ensure you're in the right project directory
ls -la
```
````

### YAML Parsing Issues

````markdown
❌ **YAML Parsing Error**

**Issue**: Invalid YAML format in `.jira-issues.yaml`

### Common Problems

#### Indentation Errors

- Use spaces, not tabs
- Consistent indentation (2 spaces recommended)
- Proper nesting structure

#### Syntax Errors

- Missing colons after keys
- Unquoted special characters
- Invalid Unicode characters

### Fix Commands

```bash
# Validate YAML syntax
yamllint .jira-issues.yaml

# Manual review
cat .jira-issues.yaml
```
````

## Usage Examples

### Basic Listing

- `jira:list-issues` - Show all issues with default formatting

### Common Workflows

```bash
# Create some issues
jira:create-issue "Add user login"
jira:create-issue "Fix navigation bug"

# List all issues
jira:list-issues

# Sync to Jira
jira:sync-issues

# List again to see sync status
jira:list-issues
```

## Integration with Other Commands

### Before Syncing

- Use `jira:list-issues` to review all local issues
- Check for completeness and accuracy
- Verify priorities and estimations

### After Syncing

- Use `jira:list-issues` to confirm sync status
- Verify Jira IDs are populated
- Check for any sync errors

### During Development

- Track progress on local issues
- Monitor sync status
- Plan work based on priorities

## File Structure Reference

### Expected YAML Format

```yaml
issues:
  001:
    summary: "Issue summary"
    description: "Detailed description"
    parent_id: "EPIC-123"
    issue_type: "Story"
    priority: "High"
    estimation: 5
    issue_id: "JIRA-123"
    pushed: true
    created_at: "2025-01-01T10:00:00Z"
    updated_at: "2025-01-01T10:00:00Z"
```

This command provides comprehensive visibility into your local Jira issue management workflow.

