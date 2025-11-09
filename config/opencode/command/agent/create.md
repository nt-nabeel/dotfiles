---
name: agent:create
description: Create new specialized agent with specific tools and capabilities
agent: build
---

Create a new specialized agent with specific tools, capabilities, and configuration.

## Process

1. **Parse Input**: Extract agent name, description, and specialization from user input
2. **Design Agent**: Define tools, capabilities, and use cases
3. **Generate Config**: Create agent configuration following OpenCode patterns
4. **Create Files**: Generate agent files and documentation
5. **Store**: Save to `.opencode/agent/` directory structure

## Input Analysis

Extract from user input:

- **Agent Name**: kebab-case name for the agent
- **Description**: Brief description of agent's purpose
- **Specialization**: Primary domain (e.g., security, performance, documentation)
- **Tools**: Specific tools the agent needs access to
- **Capabilities**: Key skills and functions
- **Use Cases**: Typical scenarios where this agent excels

## Agent Configuration Structure

**Basic Agent**:

```markdown
---
description: Brief description of agent purpose
mode: subagent
model: anthropic/claude-3-5-sonnet-20241022
tools:
  write: true
  bash: true
---

You are a specialized agent for [specific purpose].
Focus on [key responsibilities].
```

**Advanced Agent**:

```markdown
---
description: Security-focused code analysis and vulnerability detection
mode: subagent
model: anthropic/claude-3-5-sonnet-20241022
temperature: 0.1
tools:
  write: false
  edit: false
  bash: false
permission:
  webfetch: deny
---

You are a security expert. Focus on identifying potential security issues.
Look for:

- Input validation vulnerabilities
- Authentication and authorization flaws
- Data exposure risks
- Dependency vulnerabilities
- Configuration security issues
```

## Agent Types

**Analysis Agents**:

- Focus on code review, analysis, and inspection
- Tools: Read, Grep, Glob, Bash
- Capabilities: pattern recognition, issue detection

**Generation Agents**:

- Focus on creating code, documentation, tests
- Tools: Write, Read, Bash
- Capabilities: code generation, documentation writing

**Optimization Agents**:

- Focus on performance, refactoring, improvements
- Tools: Read, Write, Edit, Bash
- Capabilities: performance tuning, code optimization

**Specialized Agents**:

- Domain-specific (security, database, frontend, etc.)
- Custom tool sets and capabilities
- Focused use cases and restrictions

## File Creation

**Agent Config**: `.opencode/agent/[agent-name].md` (project-specific) or `~/.config/opencode/agent/[agent-name].md` (global)
**Format**: Single markdown file with frontmatter configuration
**Discovery**: Automatic discovery from agent directories

## Agent Template

```markdown
---
description: Use for [specific task type]
mode: subagent
model: anthropic/claude-3-5-sonnet-20241022
temperature: 0.3
tools:
  write: true
  edit: true
  bash: false
permission:
  bash: ask
---

You are a [specialized role] agent.

When [condition], focus on:

- [Key responsibility 1]
- [Key responsibility 2]
- [Key responsibility 3]

Always:

- [Best practice 1]
- [Best practice 2]
- [Best practice 3]

Available tools: [list relevant tools]
Usage: @[agent-name] [task description]
```

## Creation Process

1. **Choose Location**: Global (`~/.config/opencode/agent/`) or project-specific (`.opencode/agent/`)
2. **Generate Agent File**: Create `[agent-name].md` with frontmatter and prompt
3. **Configure Frontmatter**: Set description, mode, model, tools, permissions
4. **Write System Prompt**: Add agent instructions below frontmatter
5. **Validate**: Ensure YAML syntax and configuration validity
6. **Test**: Verify agent can be discovered and used

## Output

Show success message with:

- Agent name and description
- Tools and capabilities
- Usage examples
- File locations
- Discovery status

**Error Handling**:

- Invalid agent name: Suggest proper kebab-case format
- Missing tools: Recommend essential tools
- Discovery failure: Check file location and markdown syntax
- File creation errors: Verify permissions

---

**User Arguments**: $ARGUMENTS
