---
name: code:documentation
description: Add or update code documentation (docstrings, JSDoc, type hints) based on staged git changes
category: Code
tags: [code, documentation, docstring, jsdoc, type-hints, ai]
allowed-tools: Bash(git diff:*), Bash(git status:*), Read, Write, Edit, Glob
---

# Update Code Documentation

Analyze staged code changes and automatically add or update appropriate code documentation including docstrings, JSDoc comments, type hints, and other inline documentation.

## Documentation Update Process

### 1. Change Analysis

Analyze staged code changes to identify documentation needs:

**Git Staged Analysis**:

- Use `Bash(git diff --cached --name-only)` to identify changed files
- Filter for code files (exclude markdown, config files, etc.)
- Use `Bash(git diff --cached)` to get detailed changes
- Identify added, modified, or removed functions, classes, methods

**Language Detection**:

- Automatically detect programming languages from file extensions
- Support for: JavaScript (.js), TypeScript (.ts), Python (.py), Java (.java), C++ (.cpp), Go (.go), Rust (.rs), PHP (.php), Ruby (.rb)
- Identify language-specific documentation patterns

**Code Structure Analysis**:

- Parse code to identify:
  - Function definitions and signatures
  - Class declarations and methods
  - Variable declarations and types
  - Module exports and imports
  - Interface definitions
  - Type annotations

### 2. Documentation Gap Detection

Identify missing or inadequate documentation:

**Documentation Completeness Check**:

- **Functions**: Check for missing docstrings or JSDoc comments
- **Classes**: Verify class-level documentation exists
- **Methods**: Ensure method documentation is present
- **Parameters**: Check parameter documentation completeness
- **Return Values**: Verify return value documentation
- **Type Information**: Identify missing type hints or annotations

**Quality Assessment**:

- **Documentation Accuracy**: Ensure docs match current code
- **Completeness**: Verify all public APIs are documented
- **Consistency**: Check documentation format consistency
- **Clarity**: Assess documentation clarity and usefulness

### 3. Documentation Generation

Generate appropriate documentation based on language and code context:

**Language-Specific Documentation**:

- **JavaScript/TypeScript**: JSDoc comments with @param, @returns, @type
- **Python**: Docstrings following Google/NumPy/Sphinx style
- **Java**: JavaDoc comments with @param, @return, @throws
- **C++**: Doxygen comments with @param, @return, @brief
- **Go**: Go doc comments with proper formatting
- **Rust**: Rust doc comments with proper examples

**Smart Content Generation**:

- **Function Purpose**: Generate descriptions based on function name and implementation
- **Parameter Documentation**: Create parameter docs from names and types
- **Return Value Documentation**: Generate return descriptions from code analysis
- **Usage Examples**: Create simple usage examples when appropriate
- **Type Information**: Add type hints and annotations where missing

### 4. File Updates

Update files with generated documentation:

**Preservation Strategy**:

- **Existing Documentation**: Preserve and enhance existing good documentation
- **Code Structure**: Maintain original code formatting and structure
- **Comments**: Keep existing valuable comments
- **Style Consistency**: Match existing documentation style

**Update Implementation**:

- **Non-Destructive**: Only add documentation, don't remove existing content
- **Contextual**: Place documentation in appropriate locations
- **Formatted**: Use proper indentation and formatting
- **Complete**: Ensure all generated documentation is syntactically correct

## Output Format

### Successful Documentation Update

````
✅ **Code Documentation Updated Successfully**

**Analysis Time**: [Timestamp]
**Languages Processed**: [JavaScript, Python, etc.]
**Files Updated**: [Number] files
**Documentation Added**: [Number] documentation entries

### 📋 Processed Files

#### 🟢 [filename.js] - JavaScript/TypeScript
**Documentation Added**:
- ✅ Function: [functionName] - JSDoc with parameters and return type
- ✅ Class: [ClassName] - Class-level JSDoc documentation
- ✅ Method: [methodName] - Method JSDoc with @param and @returns

**Quality Improvements**:
- Added type annotations for [X] parameters
- Enhanced return value documentation
- Improved parameter descriptions

---

#### 🐍 [filename.py] - Python
**Documentation Added**:
- ✅ Function: [function_name] - Google-style docstring
- ✅ Class: [ClassName] - Class docstring with attributes
- ✅ Method: [method_name] - Method docstring with Args and Returns

**Type Hints Added**:
- Added type hints for [X] function parameters
- Added return type annotations for [Y] functions
- Enhanced variable type annotations

---

#### ☕ [filename.java] - Java
**Documentation Added**:
- ✅ Class: [ClassName] - JavaDoc with class description
- ✅ Method: [methodName] - Method JavaDoc with @param and @return
- ✅ Field: [fieldName] - Field documentation

**Enhancements**:
- Improved parameter documentation
- Added @throws documentation for exceptions
- Enhanced method descriptions

### 📊 Documentation Statistics
**Before Update**:
- Documented functions: [X]/[Y] ([Z]%)
- Type coverage: [A]%
- Documentation quality score: [Score/10]

**After Update**:
- Documented functions: [X]/[Y] ([Z]%) [+Improvement]
- Type coverage: [A]% [+Improvement]
- Documentation quality score: [Score/10] [+Improvement]

### 🎯 Quality Improvements
**Enhanced Areas**:
- **Parameter Documentation**: All parameters now documented
- **Return Value Clarity**: Clear return type and value descriptions
- **Type Safety**: Added type hints and annotations
- **Usage Examples**: Added practical examples where helpful
- **Error Handling**: Documented exceptions and error cases

### 📝 Sample Documentation Added

**JavaScript Example**:
```javascript
/**
 * Calculates the total price including tax for a shopping cart.
 * @param {Object[]} items - Array of cart items
 * @param {number} items[].price - Item price
 * @param {number} items[].quantity - Item quantity
 * @param {number} taxRate - Tax rate as decimal (0.1 for 10%)
 * @returns {number} Total price including tax
 * @throws {Error} When items array is empty or taxRate is invalid
 *
 * @example
 * const cart = [{ price: 100, quantity: 2 }];
 * const total = calculateTotal(cart, 0.1); // Returns 220
 */
function calculateTotal(items, taxRate) {
    // implementation...
}
````

**Python Example**:

```python
def calculate_total(items: List[Dict[str, Any]], tax_rate: float) -> float:
    """Calculate the total price including tax for a shopping cart.

    Args:
        items: List of cart items with 'price' and 'quantity' keys
        tax_rate: Tax rate as decimal (0.1 for 10%)

    Returns:
        Total price including tax

    Raises:
        ValueError: When items list is empty or tax_rate is invalid

    Example:
        >>> cart = [{'price': 100, 'quantity': 2}]
        >>> calculate_total(cart, 0.1)
        220.0
    """
    # implementation...
```

### 🚀 Next Steps

1. **Review Changes**: Examine the updated files to ensure accuracy
2. **Test Documentation**: Verify documentation is syntactically correct
3. **Commit Changes**: Use `/git:commit-suggest` to create appropriate commit message
4. **Generate Docs**: If applicable, regenerate API documentation

**Quick Commands**:

```bash
git status  # Review updated files
git diff    # See documentation changes
git add .   # Stage documentation updates
/git:commit-suggest docs  # Get commit message suggestion
```

### Multiple Languages Processed

```
✅ **Multi-Language Documentation Update**

**Languages Detected**: [JavaScript, Python, Java, etc.]
**Total Files Updated**: [Number] files across [Number] languages

### 📊 Language Breakdown

#### JavaScript/TypeScript 🟢
**Files**: [Number] files
**Documentation Added**:
- JSDoc comments for [X] functions
- Type annotations for [Y] parameters
- Interface documentation for [Z] interfaces

#### Python 🐍
**Files**: [Number] files
**Documentation Added**:
- Docstrings for [X] functions/classes
- Type hints for [Y] parameters
- Example usage for [Z] methods

#### Java ☕
**Files**: [Number] files
**Documentation Added**:
- JavaDoc for [X] classes/methods
- @param and @return documentation
- Exception documentation with @throws

### 🌐 Cross-Language Consistency
**Standardization Applied**:
- Consistent parameter documentation format
- Unified example style across languages
- Standardized type annotation approach
- Consistent error documentation pattern

### 🎯 Language-Specific Best Practices
**Applied Standards**:
- **JavaScript**: JSDoc 3.0 specification compliance
- **Python**: Google-style docstring format
- **Java**: JavaDoc conventions
- **TypeScript**: Strict typing with interfaces
- **Go**: Go doc comment conventions
```

### No Staged Code Changes

````
⚠️ **No Staged Code Changes Found**

**Current Status**: No code files are staged for documentation updates

### Git Status Analysis
**Working Directory**:
- 📝 Modified files: [Number] files
- 🆕 New files: [Number] files
- 🗑️ Deleted files: [Number] files

**Code Files Available**: [Number] potential files for documentation

### Available Actions

#### Stage Code Files First:
```bash
# Stage specific code files
git add [file1.js] [file2.py]

# Stage all code files
git add *.js *.py *.ts

# Stage all changes
git add .

# Stage interactively
git add -p
````

#### Filter for Code Files:

```bash
# See only code files that changed
git status | grep -E '\.(js|ts|py|java|cpp|go|rs)$'

# Stage only code files
git add '*.js' '*.py' '*.ts'
```

#### Then Try Again:

After staging code files, run this command again:
`/code:documentation`

**Recommended Workflow**:

1. `git status` - See all changes
2. `git add [code-files]` - Stage only code files
3. `/code:documentation` - Generate documentation updates
4. `/git:commit-suggest docs` - Get appropriate commit message

```

### Documentation Quality Analysis
```

📊 **Documentation Quality Report**

**Analysis Scope**: [All updated files / Specific file: filename]
**Quality Score**: [Score/10] ([Excellent/Good/Fair/Poor])

### 📋 Quality Metrics

#### ✅ Coverage Analysis

**Function Documentation**: [X]% documented ([+Y]% improvement)
**Class Documentation**: [X]% documented ([+Y]% improvement)
**Parameter Documentation**: [X]% complete ([+Y]% improvement)
**Return Documentation**: [X]% complete ([+Y]% improvement)
**Type Annotation Coverage**: [X]% ([+Y]% improvement)

#### 📝 Content Quality

**Clarity Score**: [Score/10] - [Assessment]
**Completeness Score**: [Score/10] - [Assessment]
**Accuracy Score**: [Score/10] - [Assessment]
**Consistency Score**: [Score/10] - [Assessment]

### 🎯 Strengths Identified

- **Comprehensive Coverage**: [What's well documented]
- **Clear Examples**: [Where examples are particularly good]
- **Type Safety**: [Type annotation strengths]
- **Consistency**: [Where documentation is consistent]

### ⚠️ Areas for Improvement

- **Missing Examples**: [Functions that need usage examples]
- **Vague Descriptions**: [Functions with unclear documentation]
- **Parameter Details**: [Parameters needing better descriptions]
- **Error Handling**: [Functions missing error documentation]

### 🔧 Enhancement Recommendations

**Immediate Improvements**:

1. **Add Examples**: Create usage examples for [specific functions]
2. **Enhance Descriptions**: Improve clarity for [specific areas]
3. **Error Documentation**: Add exception documentation for [functions]
4. **Type Safety**: Add more specific type annotations

**Long-term Improvements**:

1. **Documentation Standards**: Establish team documentation guidelines
2. **Automated Validation**: Set up documentation linting
3. **Regular Reviews**: Schedule documentation quality reviews
4. **Training**: Team education on best practices

### 📚 Best Practices Applied

**Standards Followed**:

- **Language Conventions**: Applied language-specific documentation standards
- **Consistency**: Maintained consistent format across all documentation
- **Completeness**: Ensured all public APIs are documented
- **Clarity**: Focused on clear, understandable descriptions
- **Examples**: Provided practical usage examples where helpful

```

### Error Handling
```

❌ **Documentation Update Error**

**Issue**: [Specific error encountered]

### Troubleshooting Steps

#### 1. File Permission Issues

```bash
# Check file permissions
ls -la [filename]

# Fix permissions if needed
chmod 644 [filename]
```

#### 2. Git Repository Issues

```bash
# Verify git status
git status

# Stage files properly
git add [filename]

# Check staged files
git diff --cached --name-only
```

#### 3. Language Detection Issues

**Manual Language Specification**:
If automatic language detection failed, specify manually:
`/code:documentation [language]`

**Supported Languages**:

- `javascript` or `js` - JavaScript files
- `typescript` or `ts` - TypeScript files
- `python` or `py` - Python files
- `java` - Java files
- `cpp` or `c++` - C++ files
- `go` - Go files
- `rust` or `rs` - Rust files

#### 4. File Access Issues

```bash
# Check if files exist and are readable
ls -la [file-pattern]

# Try reading a specific file
cat [filename]
```

### Alternative Solutions

**Manual Documentation**:
If automatic updates fail, I can:

- Review specific files and suggest documentation
- Provide documentation templates for you to apply
- Guide you through manual documentation process

**Partial Processing**:
Process files individually if batch processing fails:
`/code:documentation [specific-filename]`

**Dry Run Mode**:
Preview what would be updated without making changes:
`/code:documentation --dry-run`

```

## Usage Examples

### Basic Usage
- `/code:documentation` - Process all staged code files
- `/code:documentation javascript` - Process only JavaScript files
- `/code:documentation jsdoc` - Use JSDoc style for JavaScript

### With Specific Style
- `/code:documentation python google` - Use Google-style Python docstrings
- `/code:documentation typescript strict` - Use strict TypeScript documentation
- `/code:documentation java detailed` - Include detailed examples

### For Specific Scopes
- `/code:documentation functions` - Document only functions
- `/code:documentation classes` - Document only classes and methods
- `/code:documentation exports` - Document only exported items

## Advanced Features

### Custom Documentation Templates
```

📝 **Custom Documentation Templates**

**Template Style**: [Custom/Corporate/Personal]
**Language**: [Specific language]

### Applied Template Features

**Header Format**: [Specific header style]
**Parameter Documentation**: [Parameter doc style]
**Example Format**: [Example code style]
**Type Annotation**: [Type hint style]

### Template Customization

**Fields Included**:

- ✅ Function/Method purpose
- ✅ Parameter descriptions with types
- ✅ Return value documentation
- ✅ Usage examples
- ✅ Error/exception documentation
- ✅ Version information
- ✅ Author information

**Formatting Applied**:

- **Line Length**: [X] character limit
- **Indentation**: [Spaces/Tabs] with [Y] spaces
- **Comment Style**: [// vs /* */ vs #]
- **Tag Ordering**: [Specific tag order]

```

### Integration with Type Systems
```

🔷 **Type System Integration**

**Type Inference**: [Automatic/Manual/Mixed]
**Strict Mode**: [Enabled/Disabled]
**Type Checking**: [Integrated/Standalone]

### Type Safety Enhancements

**JavaScript/TypeScript**:

- Added explicit type annotations
- Enhanced interface definitions
- Improved generic type usage
- Added union types where appropriate

**Python**:

- Added type hints for all parameters
- Enhanced return type annotations
- Added generic type support
- Improved complex type definitions

**Java**:

- Enhanced generic type usage
- Added parameterized types
- Improved wildcard types
- Enhanced annotation usage

### Type Validation

**Syntax Checking**: ✅ All type annotations are syntactically correct
**Consistency**: ✅ Type usage is consistent across codebase
**Completeness**: ✅ All public APIs have type information

```

**User Arguments**: $ARGUMENTS

**Argument Parsing**:
- `$1`: Programming language (javascript/typescript/python/java/cpp/go/rust/php/ruby)
- `$2`: Documentation style (jsdoc/google/sphinx/custom)
- `$3`: Scope (functions/classes/exports/all)
- Flags: --dry-run, --verbose, --force, --examples, --strict

**Language Support**:
- **JavaScript/TypeScript**: JSDoc with @param, @returns, @type, @example
- **Python**: Google/NumPy/Sphinx style docstrings with Args, Returns, Examples
- **Java**: JavaDoc with @param, @return, @throws, @see
- **C++**: Doxygen comments with @param, @return, @brief
- **Go**: Go doc comments with proper formatting
- **Rust**: Rust doc comments with examples and panic documentation
- **PHP**: PHPDoc with @param, @return, @var
- **Ruby**: YARD documentation with @param, @return, @example

**Quality Assurance**:
- Syntax validation for generated documentation
- Consistency checking across similar code patterns
- Type annotation validation
- Example code testing where applicable
```
