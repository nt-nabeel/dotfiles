---
name: git:commit-suggest
description: Generate intelligent commit messages based on staged git changes using AI analysis
category: Git
tags: [git, commit, message, ai, conventional-commits]
allowed-tools: Bash(git diff:*), Bash(git status:*), Bash(git log:*), Read, Edit
---

# Generate Commit Message Suggestions

Analyze staged git changes and generate intelligent, well-formatted commit messages following best practices and conventional commit standards.

## Commit Message Generation Process

### 1. Git Analysis

Analyze the current git repository state and staged changes:

**Repository Validation**:

- Verify current directory is a git repository using `Bash(git status)`
- Check for staged changes using `Bash(git diff --cached --name-only)`
- Validate git repository health and accessibility

**Change Analysis**:

- Use `Bash(git diff --cached)` to get detailed diff of staged changes
- Parse diff output to identify:
  - **File Types**: JavaScript, Python, configuration, documentation, etc.
  - **Change Types**: Additions, deletions, modifications, moves
  - **Impact Areas**: Features, bug fixes, refactoring, tests, documentation
  - **Code Patterns**: Function additions, class changes, API modifications

**Context Gathering**:

- Use `Bash(git log --oneline -5)` to understand recent commit patterns
- Analyze branch name for context (feature branches, hotfixes, etc.)
- Identify project structure and conventions

### 2. Change Categorization

Categorize changes based on analysis:

**Commit Type Identification**:

- **feat**: New features, functionality additions
- **fix**: Bug fixes, error corrections
- **docs**: Documentation changes (README, inline docs)
- **style**: Code formatting, style changes (no functional change)
- **refactor**: Code refactoring, performance improvements
- **test**: Test additions, modifications, fixes
- **chore**: Maintenance, dependency updates, build changes

**Scope Determination**:

- Identify primary components or modules affected
- Determine scope granularity (specific vs general)
- Consider cross-component impacts

**Impact Assessment**:

- **Breaking Changes**: API changes, database schema changes
- **Feature Additions**: New capabilities, user-facing changes
- **Internal Changes**: Refactoring, performance, technical debt

### 3. Message Generation

Generate commit messages using different formats:

**Conventional Commits**:

- Follow conventional commits specification
- Include type, scope, and description
- Add body for detailed explanation
- Include footer for breaking changes or issue references

**Descriptive Messages**:

- Clear, human-readable descriptions
- Focus on what and why, not just how
- Include context and impact information

**Alternative Formats**:

- Short-form for simple changes
- Detailed for complex changes
- Subject-line only for minor updates

## Output Format

### Successful Analysis with Suggestions

```
✅ **Commit Message Suggestions Generated**

**Repository**: [Repository path]
**Branch**: [Branch name]
**Staged Files**: [Number] files changed
**Analysis Time**: [Timestamp]

### 📋 Change Summary
**Files Modified**:
- 🟢 [file1.js] - [Change type: Added/Modified/Deleted]
- 🟡 [file2.py] - [Change type: Added/Modified/Deleted]
- 🔵 [file3.config] - [Change type: Added/Modified/Deleted]

**Change Types Detected**:
- ✨ **Features**: [Number] feature additions
- 🐛 **Bug Fixes**: [Number] bug fixes
- 🔧 **Refactoring**: [Number] refactoring changes
- 📚 **Documentation**: [Number] documentation updates
- 🧪 **Tests**: [Number] test additions/fixes

### 💬 Recommended Commit Messages

#### 1. Conventional Commit (Recommended)
```

[Type]([Scope]): [Subject]

[Body paragraph explaining what changed and why]

[Footer with breaking changes, issue references, etc.]

```

#### 2. Descriptive Format
```

[Clear, descriptive subject line]

[Detailed description of changes and their impact]

[Context about why these changes were made]

```

#### 3. Short Format
```

[Concise subject line for simple changes]

```

### 🎯 Specific Suggestions

#### Based on Analysis:
**Primary Recommendation**:
```

feat(auth): add JWT token validation middleware

Implement JWT validation middleware to secure API endpoints.
The middleware checks for valid tokens in Authorization header
and validates token signature and expiration.

Closes: #123

```

**Alternative Options**:

**Option 2 - Detailed**:
```

Add comprehensive JWT authentication system

- Implement JWT token generation and validation
- Add middleware for protected routes
- Update user model to support token storage
- Add authentication endpoints (login/logout)

This change enhances API security by implementing token-based
authentication following JWT standards.

BREAKING CHANGE: Protected endpoints now require valid JWT token

```

**Option 3 - Simple**:
```

feat: add JWT authentication middleware

````

### 📊 Commit Quality Analysis
**Conventional Compliance**: ✅ Fully compliant
**Clarity Score**: [Score/10] - [Assessment]
**Completeness**: [Score/10] - [Assessment]
**Best Practices**: ✅ Follows git best practices

### 🚀 Next Steps
1. **Review Suggestions**: Choose the best commit message for your changes
2. **Customize**: Modify as needed for your specific context
3. **Commit**: Use your chosen message with `git commit`
4. **Push**: Push changes to remote repository

**Quick Commands**:
```bash
git commit -m "feat(auth): add JWT token validation middleware"
git push origin [branch-name]
````

```

### Multiple Change Types
```

✅ **Multi-Feature Commit Analysis**

**Mixed Changes Detected**: Your staged changes include multiple types of modifications

### 📋 Change Breakdown

**Primary Changes**:

- ✨ [Feature changes description]
- 🐛 [Bug fixes description]
- 🔧 [Refactoring description]
- 📚 [Documentation changes]

### 💬 Commit Strategy Options

#### Option 1: Single Comprehensive Commit

```
feat: implement user authentication with JWT tokens

Add complete authentication system including:
- JWT token generation and validation
- User login/logout endpoints
- Protected route middleware
- Authentication documentation

This provides secure token-based authentication for API access.

Closes: #123, #124
```

#### Option 2: Split Commits (Recommended)

**Suggested split into [Number] separate commits**:

1. **First Commit - Core Feature**:

```
feat(auth): add JWT token generation and validation
```

2. **Second Commit - API Integration**:

```
feat(auth): add authentication endpoints and middleware
```

3. **Third Commit - Documentation**:

```
docs(auth): add authentication usage documentation
```

### 🎯 Recommendation

**Split commits are recommended** because:

- Better change history and traceability
- Easier code review and understanding
- Cleaner revert capabilities if needed
- Follows "one logical change per commit" principle

**Split Commands Available**:

- Use `git reset` to unstage some changes
- Commit changes in logical groups
- Repeat this command for each commit group

```

### No Staged Changes
```

⚠️ **No Staged Changes Found**

**Current Status**: No files are staged for commit

### Git Status

**Working Directory Status**:

- 📁 Modified files: [Number] files
- 🆕 New files: [Number] files
- 🗑️ Deleted files: [Number] files

### Available Actions

#### Stage Changes First:

```bash
# Stage specific files
git add [file1] [file2]

# Stage all changes
git add .

# Stage changes interactively
git add -p
```

#### View Changes:

```bash
# See what's changed
git status

# See detailed changes
git diff

# See staged changes (if any)
git diff --cached
```

#### Then Try Again:

After staging your changes, run this command again:
`/git:commit-suggest`

**Quick Workflow**:

1. `git status` - See current changes
2. `git add .` - Stage all changes
3. `/git:commit-suggest` - Get commit message suggestions
4. `git commit -m "chosen message"` - Commit with suggested message

```

### Error Handling
```

❌ **Git Analysis Error**

**Issue**: [Specific git-related error]

### Troubleshooting Steps

#### 1. Repository Validation

```bash
# Check if you're in a git repository
git status

# If not a repository, initialize one:
git init
```

#### 2. Git Configuration

```bash
# Check git configuration
git config --list

# Set user identity if needed:
git config user.name "Your Name"
git config user.email "your.email@example.com"
```

#### 3. File Permissions

```bash
# Check file permissions
ls -la

# Fix permissions if needed
chmod 644 [files]
```

#### 4. Git Index Issues

```bash
# Reset git index if corrupted
git reset

# Clear git cache
git rm -r --cached .
git add .
```

### Alternative Solutions

If git commands are not working:

1. **Manual Analysis**: Describe your changes and I'll suggest commit messages
2. **File Review**: Share the changed files for analysis
3. **Text-based Input**: Paste git diff output for analysis

**Manual Option**:
Tell me what you changed and I'll suggest appropriate commit messages:

- What files did you modify?
- What functionality did you add/fix?
- What was the purpose of these changes?

```

## Usage Examples

### Basic Usage
- `/git:commit-suggest` - Generate suggestions for all staged changes
- `/git:commit-suggest conventional` - Focus on conventional commit format
- `/git:commit-suggest detailed` - Include more detailed analysis

### With Scope
- `/git:commit-suggest conventional auth` - Suggest with "auth" scope
- `/git:commit-suggest conventional api` - Suggest with "api" scope

### For Different Change Types
- `/git:commit-suggest feat` - Focus on feature-type commits
- `/git:commit-suggest fix` - Focus on bug fix commits
- `/git:commit-suggest refactor` - Focus on refactoring commits

## Advanced Features

### Branch Context Analysis
```

🌿 **Branch Context Analysis**

**Current Branch**: [Branch name]
**Branch Type**: [feature/bugfix/hotfix/main/develop]

### Context-Based Suggestions

**Feature Branch**: `[feature/branch-name]` detected

- Suggested format: `feat([scope]): [description]`
- Include feature context in commit messages
- Reference relevant issues or tickets

**Bugfix Branch**: `[bugfix/issue-description]` detected

- Suggested format: `fix([scope]): [description]`
- Focus on problem-solving language
- Reference bug tracking numbers

**Hotfix Branch**: `[hotfix/urgent-fix]` detected

- Suggested format: `fix([scope]): [description]`
- Emphasize urgency and impact
- Include deployment considerations

```

### Conventional Commit Validation
```

✅ **Conventional Commit Compliance**

**Validation Results**:

- **Format**: ✅ Follows conventional commit specification
- **Type**: ✅ Valid commit type used
- **Scope**: ✅ Appropriate scope identified
- **Subject**: ✅ Clear and concise subject line
- **Body**: ✅ Informative body included (when needed)
- **Footer**: ✅ Proper footer formatting

**Conventional Types Used**:

- `feat`: New features and functionality
- `fix`: Bug fixes and corrections
- `docs`: Documentation changes
- `style`: Code formatting and style
- `refactor`: Code refactoring without functional changes
- `test`: Test additions and modifications
- `chore`: Maintenance and build changes

**Best Practices Followed**:

- Subject line under 50-72 characters
- Imperative mood used in subject
- Body explains what and why
- Footer includes breaking changes or references

```

**User Arguments**: $ARGUMENTS

**Argument Parsing**:
- `$1`: Commit style (conventional/descriptive/short/auto)
- `$2`: Scope hint (optional context for commit scope)
- Flags: --verbose, --conventional-only, --include-body, --breaking-change

**Git Analysis Features**:
- Automatic change type detection (feat/fix/docs/style/refactor/test/chore)
- Scope identification based on file paths and code structure
- Conventional compliance validation
- Multi-language code analysis
- Breaking change detection
- Issue reference suggestions
- Branch context integration
```
