---
name: agent:improve
description: Optimize existing agent configuration and capabilities
agent: build
---

Analyze and optimize existing agent configuration for better performance and capabilities.

## Process

1. **Locate Agent**: Find existing agent in `.opencode/agent/` (project) or `~/.config/opencode/agent/` (global)
2. **Analyze Config**: Review current tools, capabilities, and usage patterns
3. **Identify Issues**: Find inefficiencies, missing tools, or capability gaps
4. **Optimize**: Enhance configuration with better tools and capabilities
5. **Update**: Replace original with improved version
6. **Test**: Validate agent functionality

## Analysis Checklist

**Configuration Review**:

- Agent name and description clarity
- Tool set completeness and relevance
- Capability alignment with tools
- Use case specificity and value
- Model selection appropriateness

**Performance Analysis**:

- Tool usage efficiency
- Capability redundancy
- Missing essential tools
- Overly broad specializations
- Suboptimal model choices

**Usage Pattern Review**:

- Common use cases effectiveness
- Tool utilization patterns
- Capability gaps in practice
- Performance bottlenecks
- User feedback integration

## Optimization Strategies

**Tool Enhancement**:

- Add missing essential tools
- Remove redundant or unused tools
- Optimize tool combinations
- Add specialized tools for domain
- Ensure tool-capability alignment

**Capability Refinement**:

- Consolidate overlapping capabilities
- Add missing key capabilities
- Specialize broad capabilities
- Remove ineffective capabilities
- Align with use cases

**Configuration Improvements**:

- Optimize model selection
- Add useful restrictions
- Improve description clarity
- Enhance use case specificity
- Add performance parameters

## Common Optimizations

**Missing Tools**:

```json
// Before
"tools": ["Read", "Write"]

// After
"tools": ["Read", "Write", "Grep", "Glob", "Bash"]
```

**Capability Gaps**:

```json
// Before
"capabilities": ["code_generation"]

// After
"capabilities": ["code_generation", "pattern_analysis", "optimization"]
```

**Model Optimization**:

```json
// Before
"model": "claude-3-haiku-20240307"

// After
"model": "claude-3-5-sonnet-20241022"
```

## Enhancement Templates

**Performance Agent**:

```json
{
  "name": "performance-optimizer",
  "description": "Optimize code performance and resource usage",
  "tools": ["Read", "Write", "Edit", "Bash", "Grep"],
  "capabilities": [
    "performance_analysis",
    "bottleneck_detection",
    "optimization"
  ],
  "use_cases": ["performance_audit", "memory_optimization", "cpu_tuning"],
  "specialization": "performance",
  "model": "claude-3-5-sonnet-20241022",
  "metrics": ["execution_time", "memory_usage", "cpu_cycles"]
}
```

**Security Agent**:

```json
{
  "name": "security-analyzer",
  "description": "Comprehensive security analysis and vulnerability detection",
  "tools": ["Read", "Grep", "Glob", "Bash", "Write"],
  "capabilities": [
    "vulnerability_scanning",
    "security_audit",
    "compliance_check"
  ],
  "use_cases": ["security_review", "penetration_testing", "compliance_audit"],
  "specialization": "security",
  "model": "claude-3-5-sonnet-20241022",
  "restrictions": ["defensive_only", "no_exploit_code"],
  "security_standards": ["owasp_top_10", "nist_cybersecurity"]
}
```

## File Operations

**Backup**: Create `.backup` of original agent file
**Update**: Replace with optimized markdown configuration
**Validation**: Check YAML frontmatter and prompt structure
**Discovery**: Ensure agent file is in correct location

## Validation Process

1. **Configuration Syntax**: Validate JSON structure
2. **Tool Availability**: Ensure all tools exist in system
3. **Capability Alignment**: Verify capabilities match tools
4. **Model Compatibility**: Check model availability
5. **Use Case Testing**: Test with sample scenarios

## Output Format

Show optimization results:

```markdown
✅ **Agent Optimized**

**Agent**: [agent-name]
**Configuration**: `.opencode/agent/[agent-name].md` or `~/.config/opencode/agent/[agent-name].md`

**Improvements**:

- Added [X] essential tools
- Enhanced capabilities with [Y] new skills
- Optimized model selection
- Improved use case specificity

**Key Changes**:

- Tools: [before] → [after]
- Capabilities: [added/removed/modified]
- Model: [old] → [new]
- Use Cases: [enhanced/refined]

**Performance Impact**:

- Tool efficiency: [+X%]
- Capability coverage: [+Y%]
- Use case effectiveness: [+Z%]

**Usage**: `/task [description] --agent=[agent-name]`
```

## Error Handling

**Agent Not Found**:

- Check agent name spelling
- List available agents
- Suggest creation with `/agent:create`

**Configuration Issues**:

- Validate JSON syntax
- Check tool availability
- Verify model compatibility
- Review capability alignment

**Optimization Conflicts**:

- Preserve essential functionality
- Balance optimization with stability
- Provide rollback options
- Document trade-offs

---

**User Arguments**: $ARGUMENTS
