---
name: git:commit-suggest
description: Generate commit message from staged git changes
agent: plan
---

Analyze staged git changes and generate one high-quality conventional commit message.

## Analysis Process

1. **Git Analysis**:
   - Check repository status and staged changes
   - Analyze detailed diff for change patterns
   - Review recent commit history for context

2. **Change Categorization**:
   - Identify commit type: feat/fix/docs/style/refactor/test/chore
   - Determine scope from file paths and modules
   - Assess impact and breaking changes

3. **Message Generation**:
   - Follow conventional commits specification
   - Include type, scope, and clear subject
   - Add body for complex changes
   - Include footer for breaking changes or references

## Output Format

### Successful Analysis

```markdown
feat(scope): implement feature description

Add detailed explanation of what changed and why.
Include technical details and impact assessment.

Closes: #123
```

### No Staged Changes

```markdown
⚠️ No staged changes found. Stage files with `git add .` then retry.
```

### Error Handling

```markdown
❌ Git analysis failed. Check repository status and permissions.
```
