---
name: jira:create-issue
description: Create new issue in local YAML file using scrum template
agent: build
---

Create a new Jira issue in the local `.jira-issues.yaml` file using scrum template format.

## Issue Creation Process

1. **Input Analysis**:
   - Parse user input to extract issue details
   - Identify issue type, priority, and key components
   - Generate appropriate summary and description

2. **ID Generation**:
   - Read existing `.jira-issues.yaml` to determine next available ID
   - Generate unique numeric ID (001, 002, 003, etc.)
   - Handle first-time file creation

3. **Template Population**:
   - Create scrum template with all required fields
   - Set default values for missing information
   - Include timestamps for creation

4. **File Storage**:
   - Create or update `.jira-issues.yaml` in current workspace
   - Maintain proper YAML structure
   - Preserve existing issues

## Scrum Template Fields

- **Summary**: Brief issue title
- **Description**: Detailed description with user story format
- **Parent ID**: Epic ID (if applicable)
- **Issue Type**: Story, Task, Bug, Epic
- **Priority**: Highest, High, Medium, Low, Lowest
- **Estimation**: Story points (1, 2, 3, 5, 8, 13, 21)
- **Issue ID**: Empty until synced with Jira
- **Pushed**: false until synced

## Output Format

### Successful Issue Creation

```markdown
✅ **Issue Created Successfully**

**Issue ID**: [ID]
**Summary**: [Issue summary]
**Type**: [Issue type]
**Priority**: [Priority]
**Estimation**: [Story points]

### 📋 Issue Details

**Summary**: [Generated summary]
**Description**: [Generated description]
**Parent ID**: [Epic ID if provided]
**Issue Type**: [Detected or default type]
**Priority**: [Detected or default priority]
**Estimation**: [Estimated story points]

### 📁 Storage Location

**File**: `.jira-issues.yaml`
**Status**: Local only (not synced to Jira yet)

### 🚀 Next Steps

1. **Review Issue**: Check the created issue details
2. **List Issues**: Run `jira:list-issues` to see all local issues
3. **Sync to Jira**: Run `jira:sync-issues` when ready to push to Jira

**Quick Commands**:

- `jira:list-issues` - View all local issues
- `jira:sync-issues` - Sync all issues to Jira
```

### Multiple Issues Detected

```markdown
✅ **Multiple Issues Created**

**Issues Created**: [Number] issues
**IDs**: [ID1, ID2, ID3]

### 📋 Created Issues

#### Issue [ID1]

- **Summary**: [Summary]
- **Type**: [Type]
- **Priority**: [Priority]

#### Issue [ID2]

- **Summary**: [Summary]
- **Type**: [Type]
- **Priority**: [Priority]

### 🚀 Next Steps

- Run `jira:list-issues` to review all created issues
- Run `jira:sync-issues` to push all issues to Jira
```

## Smart Input Parsing

### Issue Type Detection

- **Bug**: Keywords: "fix", "bug", "error", "broken", "crash"
- **Story**: Keywords: "implement", "add", "create", "feature", "user"
- **Task**: Keywords: "update", "refactor", "improve", "optimize"
- **Epic**: Keywords: "epic", "module", "system", "architecture"

### Priority Detection

- **Highest**: Keywords: "urgent", "critical", "blocking", "asap"
- **High**: Keywords: "important", "priority", "soon", "needed"
- **Medium**: Keywords: "standard", "normal", "regular"
- **Low**: Keywords: "nice to have", "later", "minor"
- **Lowest**: Keywords: "optional", "maybe", "someday"

### Estimation Guidelines

- **1-2**: Simple fixes, small changes
- **3-5**: Medium complexity, new features
- **8-13**: Complex features, multiple components
- **21+**: Epic-level work, major functionality

## Error Handling

### File Creation Issues

````markdown
❌ **File Creation Error**

**Issue**: Unable to create or update `.jira-issues.yaml`

### Troubleshooting

#### 1. Directory Permissions

```bash
# Check current directory permissions
ls -la

# Ensure write permissions
chmod 755 .
```

#### 2. File Already Exists

```bash
# Check if file exists
ls -la .jira-issues.yaml

# Backup existing file if needed
cp .jira-issues.yaml .jira-issues.yaml.backup
```

#### 3. YAML Validation

- Ensure proper YAML syntax
- Check for indentation errors
- Validate field structure
````

### Input Validation Issues

```markdown
❌ **Input Validation Error**

**Issue**: Unable to parse input for issue creation

### Common Issues

#### Empty Input

- Provide at least a brief description
- Include what you want to accomplish

#### Ambiguous Input

- Be more specific about the issue type
- Include priority if important
- Mention any epic or parent relationship

### Examples of Good Input

- "Fix login validation bug - users can't login with valid credentials"
- "Implement user authentication with JWT tokens"
- "Add password reset functionality for user accounts"
- "Create admin dashboard for user management"
```

## Usage Examples

### Basic Issue Creation

- `jira:create-issue "Fix login bug"`
- `jira:create-issue "Add user registration page"`
- `jira:create-issue "Implement API rate limiting"`

### Detailed Issue Creation

- `jira:create-issue "Fix critical security vulnerability in authentication - users can bypass login"`
- `jira:create-issue "Create comprehensive user management system with roles and permissions"`
- `jira:create-issue "Optimize database queries for user dashboard - improve loading times"`

### Epic Creation

- `jira:create-issue "Epic: Build complete e-commerce system with payment processing"`

## File Structure

### YAML Format

```yaml
issues:
  001:
    summary: "Implement user authentication system"
    description: "Add JWT-based authentication with login/logout endpoints"
    parent_id: ""
    issue_type: "Story"
    priority: "High"
    estimation: 5
    issue_id: ""
    pushed: false
    created_at: "2025-01-01T10:00:00Z"
    updated_at: "2025-01-01T10:00:00Z"
```

---

**User Arguments**: $ARGUMENTS

**Argument Parsing**:

- Parse user input for issue details
- Extract keywords for type and priority detection
- Generate appropriate summary and description
- Handle special cases (epics, bugs, features)
