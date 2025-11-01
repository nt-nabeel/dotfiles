---
name: issues:push
description: Push local issue files to Jira with intelligent validation and relationship management
category: Issues
tags: [issues, jira, push, sync, validation]
allowed-tools: mcp__atlassian__jira_create_issue, mcp__atlassian__jira_get_issue, mcp__atlassian__jira_search, mcp__atlassian__jira_link_to_epic, mcp__atlassian__jira_create_issue_link, Read, Write, Glob
---

Push local issue files to Jira with intelligent validation, relationship management, and comprehensive error handling.

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

## Push Process

### 1. Issue File Discovery and Validation

Prepare issue files for Jira synchronization:

**File Discovery**:

- Use `Glob` to locate specified issue files in `.issues/` directory
- Validate file existence and accessibility
- Parse YAML frontmatter and extract issue metadata
- Validate required fields and data completeness

**Content Validation**:

- Verify issue structure follows expected template format
- Check for missing critical information (summary, description, type)
- Validate label formatting and priority assignments
- Ensure proper markdown syntax and structure

**Jira Readiness Check**:

- Verify issue status allows pushing (not already pushed unless forced)
- Check for completeness of acceptance criteria
- Validate epic relationships and dependencies
- Confirm issue type mapping to Jira issue types

### 2. Jira Integration and Validation

Intelligent Jira ecosystem integration:

**Existing Issue Verification**:

- Use `mcp__atlassian__jira_get_issue` to verify existing Jira issues
- Check if local `jira_key` matches actual Jira issue
- Validate issue status and accessibility
- Handle stale or deleted issues gracefully

**Epic Management**:

- Search for existing epics using `mcp__atlassian__jira_search`
- Perform intelligent matching based on summary and labels
- Prefer reusing existing epics over creating duplicates
- Update local files with existing epic Jira keys

**Relationship Validation**:

- Verify epic existence before linking child issues
- Check related issues exist in Jira before creating links
- Validate relationship types and compatibility
- Handle circular dependency detection

### 3. Content Processing and Formatting

Transform local content for Jira compatibility:

**Content Extraction**:

- Extract user story from content top (before headers)
- Parse H3 sections: Description, Acceptance Criteria
- Remove HTML comments and placeholder text
- Clean up markdown formatting for Jira display

**Field Mapping**:

- **Summary**: Local summary → Jira summary
- **Description**: Cleaned content → Jira description
- **Labels**: Comma-separated → Jira labels array
- **Priority**: Local priority → Jira priority mapping
- **Story Points**: Local points → Custom field (customfield_10016)
- **Assignee**: Local assignee → Jira assignee (if set)

**Content Enhancement**:

- Add proper Jira markdown formatting
- Include issue type indicators in content
- Enhance description with structured sections
- Ensure compatibility with Jira rendering

### 4. Issue Creation and Linking

Execute Jira operations with proper sequencing:

**Issue Creation**:

- Use `mcp__atlassian__jira_create_issue` with appropriate issue type
- Map Epic → "Epic", Story → "Story", Bug → "Bug", Task → "Task"
- Handle creation errors with retry logic
- Capture Jira issue keys for local file updates

**Epic Linking**:

- Use `mcp__atlassian__jira_link_to_epic` for epic-child relationships
- Verify epic exists before linking
- Handle linking errors gracefully
- Maintain epic-child hierarchy integrity

**Relationship Creation**:

- Use `mcp__atlassian__jira_create_issue_link` for related issue connections
- Support relationship types: "relates to", "blocks", "depends on"
- Validate relationship compatibility
- Handle circular dependency detection

### 5. Local File Updates

Synchronize local files with Jira state:

**Metadata Updates**:

- Set `pushed_to_jira: true` on successful sync
- Update `jira_key` with returned Jira issue key
- Update `updated_at` timestamp
- Preserve original creation metadata

**Conflict Resolution**:

- Handle local changes since last push
- Merge Jira updates with local modifications
- Warn about potential conflicts
- Provide resolution options

## Output Format

### Successful Push Operation

```
✅ **Issues Pushed to Jira Successfully**

**Push Time**: [Timestamp]
**Jira Project**: [Project name/key]
**Batch Operation**: [Single/Epic batch/Multi-issue]

### 📋 Push Summary

#### 🟢 Successfully Created/Synced
- ✅ [filename.md] → [JIRA-KEY] - [Issue Type]: [Summary]
- ✅ [filename.md] → [JIRA-KEY] - [Issue Type]: [Summary]

#### 🔄 Epic Management
- **New Epic Created**: [Epic name] → [JIRA-KEY]
- **Existing Epic Reused**: [Epic name] ([JIRA-KEY]) - [X] issues linked
- **Epic Relationships Established**: [Number] parent-child links

#### 🔗 Relationship Links Created
- **Relates To**: [Number] connections
- **Blocks**: [Number] blocking relationships
- **Depends On**: [Number] dependency relationships

### 📊 Sync Statistics
**Total Processed**: [Number] issues
**Successfully Pushed**: [Number] issues
**Already Exists**: [Number] issues (verified and linked)
**Failed**: [Number] issues

**Jira Integration Status**:
- **New Issues Created**: [Number]
- **Existing Issues Updated**: [Number]
- **Relationships Added**: [Number]
```

### Epic Push Results

```
🏗️ **Epic Push Results**

**Epic**: [Epic Name] → [JIRA-KEY]
**Status**: [Created/Reused]
**Issues Under Epic**: [Number] issues processed

### Issues Processed
#### 📖 Stories
- ✅ [Story 1] → [JIRA-KEY1] - [Brief description]
- ✅ [Story 2] → [JIRA-KEY2] - [Brief description]

#### 🐛 Bugs
- ✅ [Bug 1] → [JIRA-KEY3] - [Brief description]
- ✅ [Bug 2] → [JIRA-KEY4] - [Brief description]

#### 🔧 Tasks
- ✅ [Task 1] → [JIRA-KEY5] - [Brief description]
- ✅ [Task 2] → [JIRA-KEY6] - [Brief description]

### Epic Progress Impact
- **Total Story Points**: [Combined points]
- **Estimated Duration**: [Time estimate]
- **Team Assignment**: [Assignee distribution]
```

### Validation and Warnings

```
⚠️ **Validation Results**

#### ⚠️ Items Requiring Attention
**Missing Epic References**:
- [Issue filename] - Epic [Epic name] not found in Jira
- **Action**: Issue created without epic linking

**Incomplete Content**:
- [Issue filename] - Missing acceptance criteria
- **Action**: Issue created but needs content completion

**Priority Mismatches**:
- [Issue filename] - Local priority doesn't match Jira priority scheme
- **Action**: Mapped to nearest Jira priority

#### 🔍 Recommendations
1. **Complete Missing Information**: Add missing acceptance criteria
2. **Review Epic Assignments**: Verify epic relationships are correct
3. **Validate Priority Mapping**: Check priority alignment with team standards
4. **Update Local Files**: Ensure local files reflect Jira state
```

### Error Handling

````
❌ **Push Operation Failed**

**Error Type**: [Specific error category]
**Affected Issues**: [Number] issues failed

### 🔧 Troubleshooting Steps

#### 1. Connection Issues
```bash
# Verify MCP Atlassian server status
# Check Jira connectivity
# Validate API credentials
````

#### 2. Permission Issues

- Verify user has Jira create permissions
- Check project access rights
- Validate epic creation permissions
- Confirm assignee permissions

#### 3. Data Validation Issues

- Fix malformed YAML frontmatter
- Complete missing required fields
- Validate issue type mappings
- Correct label formatting

#### 4. Jira Configuration Issues

- Verify custom field configuration (Story Points field)
- Check issue type scheme compatibility
- Validate workflow status mappings
- Confirm project settings

### Partial Recovery

**Successfully Pushed**: [Number] issues
**Failed Issues**: [Number] issues
**Recovery Options**:

- Retry failed issues individually
- Fix validation errors and retry
- Manual creation for persistent failures

### Manual Fallback

If automatic pushing fails completely:

1. **Generate Jira Create Forms**: Provide formatted content for manual entry
2. **Export as CSV**: Create spreadsheet for bulk import
3. **Step-by-Step Guidance**: Manual creation instructions
4. **Template Usage**: Use Jira templates with provided content

```

## Usage Examples

### Basic Issue Pushing
- `/issues:push 20241201-story-auth-add-login.md` - Push single issue
- `/issues:push epic-20241201-user-management` - Push entire epic with all issues

### Multiple Issue Push
- `/issues:push issue1.md issue2.md issue3.md` - Push multiple specific issues
- `/issues:push *.md` - Push all issues in directory

### Advanced Operations
- `/issues:push epic-20241201-platform --validate` - Push with validation only
- `/issues:push --dry-run` - Preview push operations without executing
- `/issues:push --force` - Force push even if validation warnings exist

### Batch Operations
- `/issues:push --batch` - Push all pending issues
- `/issues:push --epics-only` - Push only epic issues
- `/issues:push --no-epics` - Push non-epic issues only
```

## Advanced Features

### Intelligent Conflict Resolution

```
🧠 **Smart Conflict Resolution**

**Local vs Jira Conflicts Detected**:
- [Issue] has local changes since last Jira sync
- [Issue] Jira status differs from local status
- [Issue] Content diverges between local and Jira

**Resolution Strategies**:
1. **Local Wins**: Update Jira with local content
2. **Jira Wins**: Update local file with Jira content
3. **Merge**: Attempt intelligent merge of changes
4. **Manual Review**: Show differences for manual decision

**Recommendation**: [AI-suggested best approach]
```

### Dependency Management

```
🔗 **Dependency Chain Resolution**

**Dependency Analysis**:
- **Required Issues**: [List] - Must be pushed first
- **Blocking Issues**: [List] - Block other issues
- **Circular Dependencies**: [Detection and resolution]

**Push Sequence**:
1. **Epics First**: Create/verify epic containers
2. **Dependency Resolution**: Push prerequisite issues
3. **Bulk Push**: Process remaining issues
4. **Link Creation**: Establish relationships

**Risk Mitigation**:
- **Validation**: Check all dependencies exist before linking
- **Rollback**: Revert failed pushes to maintain consistency
- **Retry Logic**: Automatic retry for transient failures
```

### Performance Optimization

```
⚡ **High-Performance Pushing**

**Batch Processing**:
- **Parallel Creation**: Create multiple issues simultaneously
- **Batch Size**: Optimize for Jira API limits
- **Rate Limiting**: Respect API throttling
- **Error Recovery**: Handle partial failures gracefully

**Caching Strategy**:
- **Epic Cache**: Store epic lookups for reuse
- **Validation Cache**: Cache validation results
- **Connection Pool**: Reuse Jira connections
- **Progress Tracking**: Real-time progress updates

**Monitoring**:
- **Progress Indicators**: Real-time push progress
- **Performance Metrics**: Track timing and success rates
- **Error Analytics**: Categorize and analyze failures
- **Retry Statistics**: Track retry success rates
```

**User Arguments**: $ARGUMENTS

**Argument Parsing**:

- `$1+`: Issue filenames or epic identifiers (required)
- Flags: --validate, --dry-run, --force, --batch, --epics-only, --no-epics, --retry=[count], --parallel=[count]

**Operation Modes**:

- **Single Issue**: Push one specific issue file
- **Epic Batch**: Push entire epic with all contained issues
- **Multi-Issue**: Push multiple specified issue files
- **Directory**: Push all issues in directory

**Validation Options**:

- **Pre-Validation**: Check issues before attempting push
- **Content Validation**: Validate issue content completeness
- **Relationship Validation**: Verify epic and dependency relationships
- **Permission Validation**: Check Jira access rights

**Recovery Features**:

- **Automatic Retry**: Retry failed pushes with exponential backoff
- **Partial Recovery**: Continue processing after individual failures
- **Manual Recovery**: Generate manual workarounds for persistent failures
- **Rollback**: Revert local changes if push fails completely
