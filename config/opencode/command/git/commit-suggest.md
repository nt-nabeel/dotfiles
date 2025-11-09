---
name: git:commit-suggest
description: Generate commit message from staged git changes
agent: plan
---

Analyze staged git changes and generate one high-quality conventional commit message.

## Process

1. **Git Analysis**: Check staged changes, analyze diff patterns, review commit history
2. **Categorization**: Identify type (feat/fix/docs/style/refactor/test/chore), determine scope, assess impact
3. **Generation**: Follow conventional commits with type, scope, subject, body, footer

## Output

Generate conventional commit message:

```
type(scope): description

Detailed explanation of changes and impact.

Closes: #123
```

**Error Handling**:

- No staged changes: Prompt to stage files
- Git errors: Check repository status and permissions

**Focus**: Clear, concise messages following conventional commit specification.
