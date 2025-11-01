---
name: issues:list
description: List all local Jira issue files with comprehensive filtering and statistics
category: Issues
tags: [issues, jira, list, overview, statistics]
allowed-tools: Read, Glob, Grep
---

List all local Jira issue files with comprehensive filtering, statistics, and project health analysis.

## Style Guide Reference

**Emoji Usage Standard**:

- ✅ Success: Operations completed successfully
- ❌ Error: Failed operations or critical issues
- ⚠️ Warning: Important alerts requiring attention
- 🎯 Goal/Target: Key objectives or next steps
- 📋 List/Table: Structured information display
- 📊 Statistics: Data analysis and metrics
- 🔗 Links: Relationships and connections
- 📈 Progress/Trends: Changes over time
- 🔧 Tools/Settings: Configuration and options
- 🚀 Performance: Speed and optimization
- 🏗️ Architecture: Structural components
- 📝 Documentation: Notes and instructions
- 🎨 Styling: Formatting and presentation

**Formatting Standards**:

- Consistent markdown table formatting with aligned columns
- Structured sections with clear headers (###)
- Emoji use at the start of lines for visual consistency
- Progress indicators using completion percentages and status badges
- Error handling with clear categorization and resolution steps
- Usage examples with actual command syntax
- Advanced features sections for complex capabilities

## Issue Retrieval Process

### 1. File Discovery and Analysis

Scan the `.issues/` directory and analyze all issue files:

**File Discovery**:

- Use `Glob` to find all `.md` files in `.issues/` directory
- Exclude template files and non-issue files
- Validate file structure and metadata completeness

**Metadata Extraction**:

- Parse YAML frontmatter from each issue file
- Extract key fields: issue_type, summary, priority, story_points, status, labels, epic
- Validate required fields and flag missing information

**Jira Integration Status**:

- Check `pushed_to_jira` status for each issue
- Identify issues that need to be pushed to Jira
- Track Jira key assignments and linkage status

### 2. Data Processing and Analysis

Process extracted data for meaningful insights:

**Status Distribution**:

- Count issues by status (draft, ready, in-progress, done, blocked)
- Identify workflow bottlenecks and stale issues
- Calculate completion rates and progress metrics

**Priority Analysis**:

- Analyze priority distribution across issues
- Identify high-priority items that need attention
- Assess risk exposure based on priority distribution

**Type Breakdown**:

- Categorize issues by type (Story, Bug, Task, Epic)
- Analyze balance between feature work and maintenance
- Identify capacity planning insights

**Epic Organization**:

- Group issues by epic relationships
- Identify orphaned issues without epic assignment
- Assess epic completeness and progress

### 3. Filtering and Sorting

Provide flexible filtering and sorting capabilities:

**Status Filtering**:

- Filter by specific status (draft, ready, in-progress, done, blocked)
- Show only issues needing attention
- Identify ready-to-work items

**Priority Filtering**:

- Focus on high-priority items (Highest, High)
- Identify urgent issues requiring immediate attention
- Balance workload across priority levels

**Type Filtering**:

- View only specific issue types
- Separate feature work from bugs and tasks
- Focus on particular work categories

**Advanced Filtering**:

- Filter by Jira push status
- Filter by epic assignment
- Filter by creation date or updates
- Filter by labels and components

## Output Format

### Comprehensive Issue Overview

```
📊 **Issues Overview** [Current Filter: [Filter Criteria]]

**Analysis Time**: [Timestamp]
**Total Issues**: [Number] issues
**Issues in Jira**: [Number] synced issues
**Local-Only Issues**: [Number] pending push

### 📋 Issue Details Table

| Filename | Type | Summary | Priority | Points | Status | Jira Key | Labels | Epic |
|----------|------|---------|----------|--------|--------|----------|--------|------|
| `20241201-story-auth-add-login.md` | Story | [Auth] Add user login | High | 5 | draft | Not pushed | backend,auth | User Management |
| `20241202-bug-frontend-fix-modal.md` | Bug | [Frontend] Fix modal bug | Medium | 3 | in-progress | PROJ-123 | frontend,bug | UI Components |
| `20241201-task-backend-refactor-api.md` | Task | [Backend] Refactor API | Low | 8 | ready | Not pushed | backend,refactor | API Architecture |

**Legend**:
- Type: 📖 Story 🐛 Bug 🔧 Task 🏗️ Epic
- Priority: 🔴 Highest 🟠 High 🟡 Medium 🟢 Low ⚪ Lowest
- Status: 📋 Draft ✅ Ready 🔄 In Progress ✨ Done 🚫 Blocked
```

### 📈 Statistical Summary

```
## 📊 Issue Statistics

### Status Distribution
- 📋 **Draft**: [X] issues ([XX]%) - [Trend indicator]
- ✅ **Ready**: [X] issues ([XX]%) - Available to start
- 🔄 **In Progress**: [X] issues ([XX]%) - Currently being worked on
- ✨ **Done**: [X] issues ([XX]%) - Completed
- 🚫 **Blocked**: [X] issues ([XX]%) - Blocked by dependencies

### Priority Breakdown
- 🔴 **Highest**: [X] issues - Critical priority items
- 🟠 **High**: [X] issues - High importance items
- 🟡 **Medium**: [X] issues - Standard priority items
- 🟢 **Low**: [X] issues - Lower priority items
- ⚪ **Lowest**: [X] issues - Nice-to-have items

### Type Analysis
- 📖 **Stories**: [X] issues - New features and functionality
- 🐛 **Bugs**: [X] issues - Defects and fixes
- 🔧 **Tasks**: [X] issues - Maintenance and improvements
- 🏗️ **Epics**: [X] issues - Feature containers

### Jira Sync Status
- ✅ **Synced**: [X] issues - Successfully pushed to Jira
- 📋 **Local Only**: [X] issues - Pending Jira push
- ⚠️ **Sync Issues**: [X] issues - Need attention
```

### Epic Organization

```
## 🏗️ Epic Organization

### Active Epics
**[Epic Name 1]** ([JIRA-KEY])
- 📊 Progress: [X]/[Y] issues ([ZZ]%) completed
- 🎯 Focus: [Primary focus area]
- 📈 Status: [On Track/At Risk/Delayed]
- **Issues**: [List of related issues]

**[Epic Name 2]** ([JIRA-KEY])
- 📊 Progress: [X]/[Y] issues ([ZZ]%) completed
- 🎯 Focus: [Primary focus area]
- 📈 Status: [On Track/At Risk/Delayed]
- **Issues**: [List of related issues]

### Orphaned Issues
**Issues Without Epic Assignment**: [X] issues
- Consider epic assignment for better organization
- [List of orphaned issues with brief descriptions]
```

### Workload Analysis

```
## ⚖️ Workload Analysis

### Team Capacity Planning
**Total Story Points**: [Combined story points]
**Average Points per Issue**: [X.X] points
**Complexity Distribution**:
- Simple (1-2 pts): [X] issues
- Medium (3-5 pts): [X] issues
- Complex (8-13 pts): [X] issues
- Very Complex (21+ pts): [X] issues

### Velocity Insights
**Recent Completion Rate**: [X] issues/week
**Estimated Sprint Capacity**: [Y] story points
**Recommended Focus**: [Priority recommendations based on capacity]

### Risk Assessment
**High-Risk Items**: [X] issues requiring attention
- [List of high-priority, high-complexity issues]
**Dependency Risks**: [X] issues with blockers
- [List of blocked issues and their blockers]
```

### Filtering Options

```
## 🔍 Available Filters

### Status Filtering
- `/issues:list draft` - Show only draft issues
- `/issues:list ready` - Show issues ready to start
- `/issues:list in-progress` - Show active work
- `/issues:list done` - Show completed issues
- `/issues:list blocked` - Show blocked issues

### Priority Filtering
- `/issues:list highest` - Show critical issues only
- `/issues:list high` - Show high and above priority
- `/issues:list medium` - Show medium and above priority
- `/issues:list low` - Show all low priority issues

### Type Filtering
- `/issues:list stories` - Show only user stories
- `/issues:list bugs` - Show only bug reports
- `/issues:list tasks` - Show only maintenance tasks
- `/issues:list epics` - Show only epic issues

### Advanced Filtering
- `/issues:list jira` - Show issues synced with Jira
- `/issues:list local` - Show local-only issues
- `/issues:list epic:[name]` - Show issues for specific epic
- `/issues:list label:[label]` - Show issues with specific label
```

## Usage Examples

### Basic Usage

- `/issues:list` - Show all issues with full statistics
- `/issues:list ready` - Show issues ready to start
- `/issues:list high` - Show high-priority issues

### Advanced Filtering

- `/issues:list draft high` - Draft issues with high priority
- `/issues:list stories jira` - User stories synced to Jira
- `/issues:list epic:"User Management"` - Issues for specific epic

### Workflow Views

- `/issues:list backlog` - Show all draft and ready issues
- `/issues:list active` - Show in-progress and blocked issues
- `/issues:list complete` - Show completed and resolved issues

```

### Empty Directory State
```

📋 **No Issues Found**

**Current Status**: No issue files exist in `.issues/` directory

### Available Actions

#### 1. Create Your First Issue

```bash
# Create a basic issue
/issues:create "Add user authentication system"

# Create with specific type and priority
/issues:create "Fix login page bug" Bug High

# Create complex multi-component issue
/issues:create "E-commerce platform with payment processing"
```

#### 2. Directory Setup

```bash
# Ensure .issues directory exists
mkdir -p .issues

# Verify directory structure
ls -la .issues/
```

#### 3. Template Check

```bash
# Check if templates are available
ls -la .issues/templates/

# Verify template content
cat .issues/templates/scrum-issue-template.md
```

**Getting Started**:

1. Create your first issue using `/issues:create`
2. Use `/issues:create` to build your issue backlog
3. Push to Jira with `/issues:push` when ready for team collaboration

```

### Error Handling
```

❌ **Issue Listing Error**

**Issue**: [Specific error encountered]

### Troubleshooting Steps

#### 1. Directory Access Issues

```bash
# Check directory exists and is readable
ls -la .issues/

# Check permissions
ls -ld .issues/

# Fix permissions if needed
chmod 755 .issues/
```

#### 2. File Parsing Issues

- Validate markdown file structure
- Check YAML frontmatter syntax
- Ensure required fields are present
- Handle corrupted or malformed files gracefully

#### 3. Template Issues

```bash
# Verify template files exist
ls -la .issues/templates/

# Check template format
head -20 .issues/templates/scrum-issue-template.md
```

### Partial Recovery

**If some files can't be parsed**:

- Show successfully parsed issues
- List problematic files separately
- Provide guidance for manual file repair
- Continue with available data for analysis

**Alternative Solutions**:

- Use manual file review for problematic issues
- Recreate corrupted files from templates
- Provide text-based issue summary if file parsing fails

```

**User Arguments**: $ARGUMENTS

**Argument Parsing**:
- `$1`: Status filter (draft/ready/in-progress/done/blocked - optional)
- `$2`: Priority filter (highest/high/medium/low/lowest - optional)
- `$3`: Type filter (stories/bugs/tasks/epics - optional)
- Flags: --jira, --local, --epic=[name], --label=[label], --stats, --no-color

**Filter Combinations**:
- Multiple filters supported: `/issues:list ready high stories`
- Boolean operations: AND logic between filters
- Exclusive filters: Use --local or --jira to limit scope

**Display Options**:
- Table format: Default compact table view
- Detailed view: Full issue descriptions with --detailed flag
- Statistics only: --stats to show only summary
- Color coding: Automatic emoji-based status indicators

```
