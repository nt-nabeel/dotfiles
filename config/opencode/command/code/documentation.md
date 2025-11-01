---
name: code:documentation
description: Generate documentation from staged git changes
agent: build
---

Analyze staged git changes and generate relevant documentation for the modified code.

## Analysis Process

1. **Git Analysis**:
   - Check repository status and staged changes
   - Analyze detailed diff for change patterns
   - Identify modified functions, classes, and modules

2. **Code Documentation Generation**:
   - Extract function signatures and class definitions
   - Generate docstrings for new functions/methods
   - Update existing documentation for modified code
   - Add inline comments for complex logic

3. **Documentation Formatting**:
   - Follow language-specific documentation conventions
   - Generate appropriate comment formats (JSDoc, Python docstrings, etc.)
   - Include parameter descriptions and return types
   - Add usage examples where relevant

## Output Format

### Successful Documentation Generation

````markdown
## Documentation Updates

### File: src/example.js

```javascript
/**
 * Processes user input and validates data
 * @param {string} input - The user input to process
 * @param {Object} options - Configuration options
 * @returns {Promise<Object>} Processed and validated data
 */
async function processInput(input, options) {
  // Implementation details...
}
```

### File: utils/helper.py

```python
def calculate_total(items: List[Dict[str, Any]]) -> float:
    """
    Calculate the total sum of item values.

    Args:
        items: List of dictionaries containing item data

    Returns:
        Total sum of all item values

    Raises:
        ValueError: If items list is empty or contains invalid data
    """
    pass
```
````

### No Staged Changes

```markdown
⚠️ No staged changes found. Stage files with `git add .` then retry.
```

### Error Handling

```markdown
❌ Documentation generation failed. Check repository status and file permissions.
```
