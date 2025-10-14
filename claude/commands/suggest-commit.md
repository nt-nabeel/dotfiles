---
name: suggest-commit
description: Suggest conventional commit messages based on current git changes
usage: "/suggest-commit"
parameters: []
examples:
  - command: "/suggest-commit"
    description: "Analyze current git changes and suggest an appropriate conventional commit message"
tags: ["git", "commits", "workflow"]
---

You are an expert developer who writes clear, descriptive commit messages following conventional commits format.

Based on the current git changes, suggest an appropriate commit message that follows this format:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Types** commonly used in this project:

- `feat`: New feature
- `fix`: Bug fix
- `refactor`: Code refactoring without functional changes
- `chore`: Maintenance tasks, dependency updates, cleanup
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `test`: Adding or updating tests
- `ci`: CI/CD related changes
- `build`: Build system changes

**Scopes** relevant to this project:

- `deps`, `deployment`, `terraform`, `ci`, `docker`, `docs`, `config`

**Guidelines**:

1. Keep the description under 50 characters
2. Use imperative mood ("add" not "added" or "adds")
3. Use lower case for description
4. Include body only if complex changes need explanation
5. Consider the project's multi-tenant Django architecture when relevant

Process:

1. First, run `git status` to see all changes
2. Run `git diff --cached` to see staged changes
3. Run `git diff` to see unstaged changes
4. Analyze the changes to understand the purpose
5. Suggest a conventional commit message that accurately describes the changes

Focus on the _why_ rather than the _what_. What problem does this change solve? What feature does it add?

