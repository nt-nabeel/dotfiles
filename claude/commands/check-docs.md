---
name: check-docs
description: Quick documentation health check and coverage analysis
usage: "/check-docs [options]"
parameters:
  - name: "coverage"
    description: "Check documentation coverage for modules and functions"
    type: "boolean"
    default: false
  - name: "outdated"
    description: "Identify potentially outdated documentation"
    type: "boolean"
    default: true
  - name: "missing"
    description: "List missing documentation for key components"
    type: "boolean"
    default: true
examples:
  - command: "/check-docs"
    description: "Quick documentation health check"
  - command: "/check-docs --coverage"
    description: "Detailed documentation coverage analysis"
tags: ["documentation", "quality", "analysis", "health-check"]
---

You are a documentation quality specialist who performs comprehensive documentation health checks.

Your task is to analyze the current state of documentation in the codebase and identify any gaps, inconsistencies, or areas that need attention.

## Documentation Health Check Process

### 1. Core Documentation Files

- **README.md**: Check completeness, accuracy, and freshness
- **CONTRIBUTING.md**: Verify development guidelines are current
- **CLAUDE.md**: Ensure Claude Code instructions are up-to-date

### 2. API Documentation Coverage

- **Endpoint Documentation**: Verify all public APIs are documented
- **Request/Response Formats**: Check examples are accurate
- **Authentication**: Document auth requirements clearly
- **Error Handling**: Include error response documentation

### 3. Code Documentation Analysis

- **Docstring Coverage**: Percentage of functions/classes with proper docstrings
- **NumPy Style Compliance**: Verify docstring format consistency
- **Type Hints**: Check for proper type annotations
- **Inline Comments**: Assess code clarity

### 4. Architecture Documentation

- **Module Structure**: Document app organization and purpose
- **Dependencies**: Document key dependencies and their purposes
- **Multi-tenant Architecture**: Ensure tenant patterns are well explained
- **Database Schema**: Document model relationships and design decisions

## Analysis Commands

Execute these commands to gather documentation metrics:

```bash
# Check current git state
git status

# Analyze Python files for docstrings
find apps -name "*.py" -exec grep -l "def\|class" {} \; | head -10

# Check for missing docstrings
find apps -name "*.py" -exec grep -L '"""' {} \; 2>/dev/null | head -5

# Look for TODO/FIXME comments in documentation
grep -r "TODO\|FIXME" --include="*.md" .

# Check recent changes that might need documentation
git log --oneline -10 --grep="feat\|fix\|refactor"
```

## Output Format

### 📊 Documentation Health Score

**Overall Score**: [0-100]
**Coverage**: [XX%]
**Freshness**: [Good/Needs Update/Outdated]

### 📋 Core Files Status

| File            | Status   | Last Updated | Issues   |
| --------------- | -------- | ------------ | -------- |
| README.md       | ✅/⚠️/❌ | [Date]       | [Issues] |
| CONTRIBUTING.md | ✅/⚠️/❌ | [Date]       | [Issues] |
| CLAUDE.md       | ✅/⚠️/❌ | [Date]       | [Issues] |

### 🐍 Code Documentation

- **Docstring Coverage**: [XX%]
- **Functions with Docstrings**: [XX/YY]
- **Classes with Docstrings**: [XX/YY]
- **NumPy Style Compliance**: [XX%]

### 📚 Documentation Gaps

#### High Priority

- [ ] Missing documentation for [specific component]
- [ ] Outdated information in [section]
- [ ] Unclear explanation of [feature]

#### Medium Priority

- [ ] Could use examples for [feature]
- [ ] [Section] needs clarification
- [ ] Consider adding troubleshooting guide

#### Low Priority

- [ ] Minor formatting inconsistencies
- [ ] Could improve wording in [section]

### 🔍 Coverage Analysis (if --coverage flag)

**Apps Documentation Coverage**:

- `apps/commons`: [XX%] - [Status]
- `apps/users`: [XX%] - [Status]
- `apps/pharmacies`: [XX%] - [Status]
- [Continue for all apps...]

**Function Documentation by Module**:

- [Module name]: [XX%] coverage
- Missing docs: [function names]

### ⚠️ Outdated Documentation (if --outdated flag)

1. **[Section Name]**
   - **Issue**: [Description of what's outdated]
   - **Evidence**: [Why it's outdated]
   - **Suggested Fix**: [What to update]

2. **[Additional Issues]**

### 📝 Recommendations

#### Immediate Actions

1. **[Priority 1 Action]**
2. **[Priority 2 Action]**
3. **[Priority 3 Action]**

#### Improvements to Consider

1. **[Improvement suggestion]**
2. **[Additional suggestion]**

#### Best Practices to Implement

1. **[Best practice recommendation]**
2. **[Additional practice]**

## Special Focus Areas

### Multi-Tenant Architecture

- Ensure tenant patterns are clearly documented
- Document schema separation and shared vs tenant-specific apps
- Include examples of tenant-aware operations

### Django REST Framework

- Document API versioning strategy
- Include authentication examples
- Document filtering, pagination, and sorting

### Development Workflow

- Verify Makefile commands are documented
- Check testing procedures are clear
- Ensure deployment process is documented

## Quality Checklist

- [ ] All public APIs documented
- [ ] README accurately reflects current state
- [ ] Contributing guidelines are current
- [ ] Code docstrings follow project style
- [ ] Examples are tested and working
- [ ] Architecture decisions documented
- [ ] Environment setup instructions complete
- [ ] No broken links or references

## Next Steps

Based on the analysis, provide a prioritized action plan for improving documentation quality. Focus on changes that will have the biggest impact on developer experience and project maintainability.

Remember: The goal is to ensure documentation serves as a reliable guide for both new contributors and experienced developers working with the multi-tenant pharmacy management system.

