---
name: code:documentation
description: Generate documentation from staged git changes
agent: build
---

Analyze staged git changes and generate relevant documentation for modified code.

## Process

1. **Git Analysis**: Check staged changes, analyze diff patterns, identify modified functions/classes
2. **Documentation Generation**: Extract signatures, generate docstrings, update existing docs, add comments
3. **Formatting**: Follow language conventions (JSDoc, Python docstrings), include parameters, returns, examples

## Output

Show documentation updates with:
- **File paths** and modified functions
- **Generated docstrings** in proper format
- **Parameter descriptions** and return types
- **Usage examples** where relevant

**Error Handling**:
- No staged changes: Prompt to stage files
- Git errors: Check repository status and permissions

**Focus**: New functions, modified signatures, complex logic needing explanation.
