---
name: jira:create
description: Create new issue in individual YAML file using enhanced scrum template
agent: build
---

Create a new Jira issue as an individual YAML file in the `.issues/` folder using enhanced scrum template format.

## Process

1. **Parse Input**: Extract issue type, priority, components from user input
2. **Generate Filename**: `{YYYYMMDDHHMMSS}-{component}-{type}-{readable-summary}.yaml`
3. **Create Directory**: Ensure `.issues/` exists
4. **Populate Template**: Use scrum template with proper fields
5. **Store File**: Create individual YAML file

## Template Fields

**Core**: issue_key, summary, description, issue_type, priority
**Planning**: parent_epic, story_points, labels, components  
**Sync**: jira_issue_key, synced
**Metadata**: created_at, updated_at, project
**Dependencies**: dependencies, blocks

## Smart Detection

**Issue Types**:
- Bug: "fix", "bug", "error", "broken", "crash"
- Story: "implement", "add", "create", "feature", "user"  
- Task: "update", "refactor", "improve", "optimize"
- Epic: "epic", "module", "system", "architecture"

**Priority**:
- Highest: "urgent", "critical", "blocking", "asap"
- High: "important", "priority", "soon", "needed"
- Medium: "standard", "normal", "regular"
- Low: "nice to have", "later", "minor"
- Lowest: "optional", "maybe", "someday"

**Story Points**:
- 1-2: Simple fixes
- 3-5: Medium features
- 8-13: Complex features
- 21+: Epic-level work

## YAML Structure

```yaml
issue_key: "timestamp-component-type-summary"
summary: "Component - Clear Description"
description: |
  Comprehensive description with requirements, acceptance criteria, 
  definition of done, testing requirements, and technical implementation.
issue_type: "Story|Task|Bug|Epic"
priority: "Highest|High|Medium|Low|Lowest"
parent_epic: "EPIC-123"
story_points: 5
labels: ["tag1", "tag2"]
components: ["service1", "service2"]
jira_issue_key: ""
synced: false
created_at: "2025-01-09T14:30:00Z"
updated_at: "2025-01-09T14:30:00Z"
project: "ProjectName"
dependencies: []
blocks: []
```

## Output

Show success message with issue details, file location, and next steps (jira:list, jira:sync).

---

**User Arguments**: $ARGUMENTS
