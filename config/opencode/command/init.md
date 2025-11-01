---
name: init
description: Project initialization
agent: build
subtask: true
---

Please analyze this codebase and create a comprehensive AGENTS.md file containing:

## Project Analysis

First, perform deep project analysis:

**Package Manager & Dependencies:**
!`ls package.json pnpm-lock.yaml yarn.lock bun.lockb 2>/dev/null || echo "No package files found"`
!`cat package.json 2>/dev/null | grep -E "(scripts|devDependencies|dependencies)" || echo "No package.json found"`

**Framework Detection:**
!`find . -name "*.config.js" -o -name "*.config.ts" -o -name "next.config.*" -o -name "nuxt.config.*" -o -name "vite.config.*" -o -name "webpack.config.*" | head -5`
!`ls -la | grep -E "(src|app|components|pages|lib)" || echo "Standard structure not detected"`

**Testing Setup:**
!`find . -name "*.test.*" -o -name "*.spec.*" -o -name "jest.config.*" -o -name "vitest.config.*" -o -name "cypress.config.*" | head -3`
!`cat package.json 2>/dev/null | grep -E "(test|spec)" || echo "No test scripts found"`

**Build Tools & CI/CD:**
!`ls -la .github/workflows/ 2>/dev/null || echo "No GitHub workflows"`
!`ls -la .gitlab-ci.yml 2>/dev/null || echo "No GitLab CI"`
!`cat package.json 2>/dev/null | grep -E "(build|dev|start)" || echo "No build scripts found"`

**Linting & Formatting:**
!`find . -name ".eslintrc*" -o -name "eslint.config.*" -o -name ".prettierrc*" -o -name "biome.json" | head -3`
!`cat package.json 2>/dev/null | grep -E "(lint|format|prettier|eslint)" || echo "No linting/formatting scripts found"`

**Language & Runtime:**
!`find . -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" -o -name "*.py" -o -name "*.go" -o -name "*.rs" | head -5 | xargs -I {} basename {}`
!`ls -la tsconfig.json go.mod pyproject.toml Cargo.toml 2>/dev/null || echo "No language config files found"`

## Generate AGENTS.md

Based on the analysis above, create an AGENTS.md file with:

### 1. Project Context

- Project type and primary language(s)
- Framework(s) and major libraries
- Package manager used
- Build system and deployment method

### 2. Development Commands

- Install dependencies command
- Development server start command
- Build command for production
- Test commands (unit, integration, e2e)
- Linting and formatting commands
- Single test file execution if supported

### 3. Code Style Guidelines

- Import conventions and organization
- Formatting rules (Prettier, ESLint, Biome, etc.)
- TypeScript configuration if applicable
- Naming conventions for files, variables, functions
- Error handling patterns
- Component structure (if frontend framework)

### 4. Testing Requirements

- Testing framework(s) used
- Test file naming conventions
- Coverage requirements if any
- How to run specific tests
- Testing best practices for this codebase

### 5. Project Structure Rules

- Directory organization requirements
- File placement conventions
- Module organization patterns
- Configuration file locations

### 6. Development Workflow

- Git workflow (branching, commits)
- Code review process if any
- CI/CD pipeline triggers
- Deployment process

### 7. Tool-Specific Rules

- LSP server configurations
- IDE/Editor specific settings
- Custom tools or scripts
- Environment variable management

## Special Instructions

If there are existing configuration files like:

- Cursor rules (in .cursor/rules/ or .cursorrules)
- Copilot rules (in .github/copilot-instructions.md)
- Existing AGENTS.md

Improve and integrate them into the new AGENTS.md. If AGENTS.md already exists, enhance it with missing information.

## Output Requirements

Make the AGENTS.md approximately 30-50 lines long, well-structured with clear sections, and include specific commands that agents can execute. Focus on actionable information that helps AI agents work effectively in this codebase.

---

**User Arguments**: $ARGUMENTS
