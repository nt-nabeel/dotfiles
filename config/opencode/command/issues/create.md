---
name: issues:create
description: Create Jira Scrum issues as local files with intelligent analysis and duplicate prevention
category: Issues
tags: [issues, jira, create, scrum, analysis]
allowed-tools: mcp__atlassian__jira_search, mcp__atlassian__jira_create_issue, Read, Write, Glob, Grep
---

Create Jira Scrum issues as local files with intelligent analysis, duplicate prevention, and comprehensive metadata generation.

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

## Issue Creation Process

### 1. Requirements Analysis

Parse and analyze the provided issue title to extract key information:

**Component Detection**:

- **Backend**: API endpoints, database changes, server logic, business rules
- **Frontend**: UI components, user interactions, client-side functionality, styling
- **Full-Stack**: Issues requiring both backend and frontend changes

**Issue Type Classification**:

- **Bug**: Issues containing "fix", "bug", "error", "crash", "broken", "issue", "problem"
- **Task**: Issues containing "update", "refactor", "migrate", "setup", "config", "maintenance", "cleanup"
- **Story**: ONLY new features containing "add", "create", "implement", "build"

**Priority Assessment**:

- **Highest**: "critical", "urgent", "security", "blocking", "emergency", "production" or core functionality
- **High**: "important", "performance", "deadline", "customer", "business" or main user workflows
- **Medium**: Standard features and tasks (default)
- **Low**: "nice-to-have", "cleanup", "optimization", "future", "enhancement" or non-essential
- **Lowest**: Purely cosmetic, minor improvements, or future considerations

### 2. Jira Integration

Intelligent Jira analysis to prevent duplicates and leverage existing work:

**Epic Detection and Reuse**:

- Search Jira for existing epics with similar summaries using `mcp__atlassian__jira_search`
- Auto-detect epic relationships from title patterns and compound titles
- Extract epic names from compound titles (e.g., "User Management - Add Login" → epic: "User Management")
- Set `epic_reused: true` and `epic_jira_key` when reusing existing epics

**Related Issues Analysis**:

- Check existing `.issues/` files for related epics and similar issues
- Search Jira for related issues using intelligent matching criteria
- Populate `related_issues` array with objects containing `issue_key` and `relation_type`
- Establish appropriate relationships: "relates to", "belongs to", "blocks", "depends on"

**Duplicate Prevention**:

- Perform fuzzy matching against existing local and Jira issues
- Warn about potential duplicates and suggest merging when appropriate
- Provide similarity scores and reasoning for duplicate detection

### 3. Content Generation

Generate comprehensive issue content with proper structure:

**Metadata Generation**:

- **Filename**: `{date}-{issue_type}-{component}-{sanitized-title}.md`
- **Summary**: `[{Component}] - {Original Title}`
- **Labels**: Component + type + domain-specific + priority indicators
- **Story Points**: Fibonacci number based on complexity analysis (1-2: simple, 3-5: medium, 8-13: complex, 21+: very complex)
- **Status**: Always start as "draft"
- **Created At**: Current timestamp
- **Pushed to Jira**: Initially false

**Content Structure**:

- **User Story**: "As a [user], I want [feature] so that [benefit]" (placed at top)
- **Description**: Detailed requirements and technical specifications
- **Acceptance Criteria**: Specific, testable criteria with clear success conditions

### 4. File Management

Handle file operations with proper validation:

**Directory Validation**:

- Ensure `.issues/` directory exists and is properly structured
- Check for template file availability
- Validate file naming conventions and avoid conflicts

**File Creation**:

- Use standardized template from `.issues/templates/scrum-issue-template.md`
- Apply consistent formatting and structure
- Ensure proper markdown syntax and validation

## Output Format

### Successful Issue Creation

```
✅ **Issues Created Successfully**

**Analysis Time**: [Timestamp]
**Jira Integration**: ✅ Connected
**Issues Created**: [Number] files
**Duplicates Prevented**: [Number] potential duplicates

### 📋 Created Issues

#### 🟢 [filename.md] - [Issue Type]: [Summary]
**Component**: [Backend/Frontend/Full-Stack]
**Priority**: [Highest/High/Medium/Low/Lowest]
**Story Points**: [Fibonacci number]
**Epic**: [Epic name or "New Epic Created"]

**Labels**:
- [Component label]
- [Type label]
- [Domain-specific labels]
- [Priority labels if applicable]

**Related Issues**:
- ✅ [Issue key] - [relation type]
- ✅ [Issue key] - [relation type]

**File Location**: `.issues/[filename]`

---

#### 🐍 [filename.md] - [Issue Type]: [Summary]
[Similar structure for multiple issues]

### 🎯 Intelligent Analysis Results
**Component Detection**: [Backend/Frontend/Full-Stack] analysis
**Priority Justification**: [Why priority was assigned]
**Complexity Assessment**: [Story points reasoning]
**Epic Strategy**: [New epic created vs existing reused]

### 🔗 Relationship Mapping
**Epic Relationships**:
- **Parent Epic**: [Epic name] ([JIRA-KEY] if existing)
- **Related Issues**: [Number] relationships established

**Dependency Analysis**:
- **Blocks**: [Issues this issue blocks]
- **Depends On**: [Issues this issue depends on]
- **Related To**: [Similar or connected issues]

### 📊 Creation Statistics
**By Type**: Story: [X], Bug: [Y], Task: [Z]
**By Component**: Backend: [X], Frontend: [Y], Full-Stack: [Z]
**By Priority**: Highest: [X], High: [Y], Medium: [Z], Low: [W]
```

### Duplicate Detection Results

```
⚠️ **Potential Duplicates Detected**

**Similar Issues Found**:

1. **[Existing Issue]** ([Status])
   - **Similarity**: [XX]% match
   - **Differences**: [Key differences identified]
   - **Recommendation**: [Merge/Keep separate/Reference]

2. **[Existing Issue]** ([Status])
   - **Similarity**: [XX]% match
   - **Differences**: [Key differences identified]
   - **Recommendation**: [Merge/Keep separate/Reference]

### User Action Required
**Options**:
1. **Proceed with Creation**: Create new issues despite similarities
2. **Merge with Existing**: Combine with suggested existing issues
3. **Modify Scope**: Adjust issue scope to avoid overlap
4. **Cancel**: Stop creation process

**Recommended Action**: [Specific recommendation based on analysis]
```

### Error Handling

````
❌ **Issue Creation Error**

**Issue**: [Specific error encountered]

### Troubleshooting Steps

#### 1. Directory Issues
```bash
# Check .issues directory exists
ls -la .issues/

# Create if missing
mkdir -p .issues
````

#### 2. Template Issues

```bash
# Check template file exists
ls -la .issues/templates/

# Verify template content
cat .issues/templates/scrum-issue-template.md
```

#### 3. Jira Connection Issues

- Verify MCP Atlassian server is running
- Check API credentials and permissions
- Test Jira connectivity with simple search

#### 4. File Permission Issues

```bash
# Check permissions
ls -la .issues/

# Fix if needed
chmod 755 .issues
```

### Alternative Solutions

**Manual Creation**:
If automatic creation fails, I can:

- Generate issue content for manual creation
- Provide properly formatted markdown
- Suggest appropriate file naming and metadata

**Template Usage**:

- Use existing template with manual fill-in
- Provide guidance on required fields and format

```

## Usage Examples

### Basic Issue Creation
- `/issues:create "Add user authentication system"` - Create single issue with auto-detection
- `/issues:create "Fix login page bug on mobile"` - Create bug with automatic priority detection

### With Specific Parameters
- `/issues:create "Product management system" Story High "Product Catalog"` - Override auto-detection
- `/issues:create "Database performance optimization" Task Highest` - Specify type and priority

### Complex Multi-Component Issues
- `/issues:create "E-commerce platform with payment processing"` - Creates backend + frontend + integration issues
- `/issues:create "Real-time chat system with WebSocket support"` - Analyzes and creates appropriate component breakdown

## Advanced Features

### Batch Issue Creation
```

📦 **Batch Issue Creation Mode**

When provided with multiple issue titles or a complex requirement:

**Analysis Results**:

- **Issues Identified**: [Number] separate issues needed
- **Components Required**: Backend, Frontend, Integration, Testing
- **Epic Strategy**: [New epic creation vs existing reuse]

**Batch Creation Plan**:

1. **Epic**: [Epic name] - Main feature umbrella
2. **Backend Issues**: [Number] issues for server-side work
3. **Frontend Issues**: [Number] issues for client-side work
4. **Integration Issues**: [Number] issues for component coordination
5. **Testing Issues**: [Number] issues for validation and QA

**Estimated Total Story Points**: [Combined complexity]
**Suggested Timeline**: [Implementation duration estimate]

```

### Template Customization
```

🎨 **Custom Template Application**

**Template Selection**:

- Standard Scrum template (default)
- Enhanced template with additional sections
- Minimal template for simple issues
- Custom template (user-provided)

**Custom Fields Added**:

- **Business Value**: [Impact assessment]
- **Technical Debt**: [Debt incurred/avoided]
- **Risk Assessment**: [Risk level and mitigation]
- **Dependencies**: [External requirements]
- **Acceptance Criteria Enhancement**: [Additional criteria]

**Formatting Applied**:

- **Markdown Style**: [GitHub/GitLab/Custom]
- **Section Ordering**: [User preference]
- **Emoji Usage**: [Enabled/Disabled]
- **Table Formatting**: [Standard/Enhanced]

```

**User Arguments**: $ARGUMENTS

**Argument Parsing**:
- `$1`: Issue title (required, quoted if contains spaces)
- `$2`: Issue type override (Story/Bug/Task - optional)
- `$3`: Priority override (Highest/High/Medium/Low/Lowest - optional)
- `$4`: Epic name or assignment (optional)
- Flags: --force, --no-duplicate-check, --batch, --template=[template-name]

**Intelligence Features**:
- Automatic component detection and issue splitting
- Jira integration for epic reuse and duplicate prevention
- Intelligent story point estimation based on complexity analysis
- Related issue detection and relationship mapping
- Domain-specific label assignment and categorization

```
