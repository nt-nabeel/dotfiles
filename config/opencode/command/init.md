---
name: init
description: Initialize AGENTS.md with comprehensive project analysis
agent: build
subtask: true
---

Analyze codebase and create comprehensive AGENTS.md file.

## Project Analysis

**Package Manager:**
!`ls package.json pnpm-lock.yaml yarn.lock bun.lockb 2>/dev/null || echo "No package files"`
!`cat package.json 2>/dev/null | grep -E "(scripts|devDependencies|dependencies)" || echo "No package.json"`

**Framework:**
!`find . -name "*.config.js" -o -name "*.config.ts" -o -name "next.config.*" -o -name "vite.config.*" | head -3`
!`ls -la | grep -E "(src|app|components|pages|lib)" || echo "Standard structure not detected"`

**Testing:**
!`find . -name "*.test.*" -o -name "*.spec.*" -o -name "jest.config.*" -o -name "vitest.config.*" | head -3`
!`cat package.json 2>/dev/null | grep -E "(test|spec)" || echo "No test scripts"`

**Build/CI:**
!`ls -la .github/workflows/ 2>/dev/null || echo "No GitHub workflows"`
!`cat package.json 2>/dev/null | grep -E "(build|dev|start)" || echo "No build scripts"`

**Linting:**
!`find . -name ".eslintrc*" -o -name ".prettierrc*" -o -name "biome.json" | head -3`
!`cat package.json 2>/dev/null | grep -E "(lint|format)" || echo "No linting scripts"`

**Language:**
!`find . -name "*.ts" -o -name "*.js" -o -name "*.py" -o -name "*.go" | head -3 | xargs -I {} basename {}`
!`ls -la tsconfig.json go.mod pyproject.toml 2>/dev/null || echo "No language configs"`

## Generate AGENTS.md

Create AGENTS.md with:

1. **Project Context**: Type, language, framework, package manager, build system
2. **Development Commands**: Install, dev server, build, test, lint, format
3. **Code Style**: Import conventions, formatting rules, naming patterns
4. **Testing**: Framework, naming conventions, coverage, execution
5. **Structure**: Directory organization, file placement, module patterns
6. **Workflow**: Git process, code review, CI/CD, deployment
7. **Tools**: LSP configs, IDE settings, custom scripts, env vars

**Integration**: Check existing .cursorrules, .github/copilot-instructions.md, AGENTS.md and enhance them.

**Output**: 30-50 lines, well-structured, actionable commands for AI agents.

---

**User Arguments**: $ARGUMENTS
