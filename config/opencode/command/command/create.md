---
name: command:create
description: Create new custom command following OpenCode best practices
agent: build
---

Create a new custom command following OpenCode best practices and token-efficient design.

## Process

1. **Parse Input**: Extract command name, description, and functionality from user input
2. **Generate Structure**: Create frontmatter and content following best practices
3. **Optimize**: Apply token-efficient design principles
4. **Create File**: Generate command file in appropriate location

## Input Analysis

Extract from user input:

- **Command Name**: kebab-case name for the command
- **Description**: Brief description for TUI display
- **Agent**: build/plan (default: build)
- **Functionality**: What the command should do
- **Arguments**: Whether it accepts arguments ($ARGUMENTS, $1, $2, etc.)
- **Shell Commands**: Any bash commands needed (!`command`)
- **File References**: Any files to include (@filename)

## Best Practices

**Frontmatter Structure**:

```yaml
---
name: command-name
description: Brief description for TUI
agent: build # or plan
subtask: false # optional
model: model-name # optional
---
```

**Content Guidelines**:

- **Concise**: Use minimal tokens while maintaining clarity
- **Structured**: Use clear sections with ## headers
- **Action-oriented**: Focus on what the AI should do
- **Token-efficient**: Avoid verbose explanations and examples

**Optimization Principles**:

- Remove redundant explanations
- Use bullet points over long paragraphs
- Consolidate similar concepts
- Focus on essential instructions only
- Use placeholders ($ARGUMENTS, $1, @file) effectively

## Command Templates

**Simple Command**:

```markdown
---
name: simple-task
description: Perform simple task
agent: build
---

Perform the specified task with focus on efficiency.

## Process

1. Analyze input
2. Execute task
3. Return results

**User Arguments**: $ARGUMENTS
```

**Command with Arguments**:

```markdown
---
name: create-file
description: Create file with content
agent: build
---

Create a file named $1 in directory $2 with specified content.

## Process

1. Validate inputs
2. Create directory if needed
3. Generate file with content
4. Confirm creation

**User Arguments**: $ARGUMENTS
```

**Command with Shell Integration**:

```markdown
---
name: analyze-project
description: Analyze project structure
agent: plan
---

Analyze current project structure and dependencies.

## Analysis

**Package Manager**:
!`ls package.json pnpm-lock.yaml yarn.lock 2>/dev/null || echo "No package files"`

**Framework**:
!`find . -name "*.config.js" -o -name "next.config.*" | head -3`

**Structure**:
!`ls -la | grep -E "(src|app|components)" || echo "Standard structure not detected"`

## Output

Provide analysis summary with recommendations.

**User Arguments**: $ARGUMENTS
```

## File Creation

Create file at: `.opencode/command/[command-name].md`

**Validation**:

- Command name is kebab-case
- Description is concise (< 50 chars)
- Frontmatter is valid YAML
- Content follows optimization principles
- File location exists

## Output

Show success message with:

- Command location
- Usage example (`/command-name`)
- Key features
- Next steps

**Error Handling**:

- Invalid command name: Suggest proper format
- Missing description: Prompt for description
- File creation error: Check permissions

---

**User Arguments**: $ARGUMENTS
