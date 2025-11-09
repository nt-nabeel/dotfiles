---
name: command:improve
description: Optimize existing custom command for token efficiency and best practices
agent: build
---

Analyze and optimize existing custom command for token efficiency and OpenCode best practices.

## Process

1. **Locate Command**: Find existing command file in `.opencode/command/`
2. **Analyze Structure**: Review frontmatter, content, and token usage
3. **Identify Issues**: Find inefficiencies, redundancies, and improvements
4. **Optimize**: Apply best practices and token-efficient design
5. **Update**: Replace original with optimized version

## Analysis Checklist

**Frontmatter Validation**:

- Required fields: name, description, agent
- Optional fields: subtask, model
- YAML syntax correctness
- Description conciseness (< 50 chars)

**Content Analysis**:

- Token usage estimation
- Structural organization
- Redundant explanations
- Verbose examples
- Missing essential information

**Best Practices Compliance**:

- Clear section structure (## headers)
- Action-oriented instructions
- Proper placeholder usage ($ARGUMENTS, $1, @file)
- Efficient shell command integration (!`command`)

## Optimization Strategies

**Token Reduction**:

- Remove redundant explanations
- Consolidate similar concepts
- Use bullet points over paragraphs
- Eliminate excessive examples
- Focus on essential instructions

**Structure Improvements**:

- Clear process sections
- Logical flow
- Consistent formatting
- Proper error handling

**Functionality Preservation**:

- Maintain all core features
- Keep essential examples
- Preserve error handling
- Retain shell integrations

## Common Issues & Fixes

**Verbose Descriptions**:

```markdown
# Before

## Detailed Analysis Process

1. First, we need to carefully examine the repository structure...
2. Next, we should analyze the dependencies...

# After

## Process

1. Analyze repository structure
2. Examine dependencies
```

**Excessive Examples**:

```markdown
# Before

## Example 1: Basic Usage

Here is a detailed example of how to use this command...

## Example 2: Advanced Usage

Here is another example with more complex features...

# After

## Usage Examples

- Basic: `command input`
- Advanced: `command input --flag`
```

**Redundant Error Handling**:

```markdown
# Before

## Error Handling

### File Not Found

If the file is not found, you will see an error message...

### Permission Denied

If you don't have permissions, you will see a different error...

# After

## Error Handling

- File not found: Check file path and permissions
- Permission denied: Verify access rights
```

## Optimization Templates

**Simple Command Optimization**:

```markdown
---
name: optimized-command
description: Concise description
agent: build
---

Perform task efficiently with clear instructions.

## Process

1. Input analysis
2. Task execution
3. Result output

**User Arguments**: $ARGUMENTS
```

**Complex Command Optimization**:

```markdown
---
name: complex-command
description: Handle complex operations
agent: plan
---

Manage complex operations with structured approach.

## Analysis

**Context**:
!`git status --porcelain`

**Dependencies**:
!`cat package.json 2>/dev/null | grep dependencies || echo "No deps"`

## Process

1. Validate inputs
2. Execute operations
3. Handle results

## Output

Show results with clear formatting and next steps.

**User Arguments**: $ARGUMENTS
```

## File Operations

**Backup**: Create `.backup` of original file
**Update**: Replace with optimized version
**Validation**: Ensure command still works

## Output Format

Show optimization results:

```markdown
✅ **Command Optimized**

**File**: `.opencode/command/[name].md`
**Token Reduction**: [X]% ([before] → [after] tokens)
**Improvements**:

- Removed verbose explanations
- Consolidated sections
- Improved structure

**Key Changes**:

- Simplified process description
- Enhanced error handling
- Better placeholder usage

**Usage**: `/[command-name]`
```

## Error Handling

**Command Not Found**:

- Check spelling and file location
- List available commands
- Suggest creation with `/command:create`

**File Access Issues**:

- Verify permissions
- Check file locks
- Validate YAML syntax

**Optimization Errors**:

- Restore from backup
- Manual review suggestions
- Partial optimization options

---

**User Arguments**: $ARGUMENTS
