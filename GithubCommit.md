# GitHub Commit Assistant

This document provides guidance to Claude Code for managing the Universal_FSCompliance_MCP Project git commits that align with our OurStory.md narrative structure.

## Commit Type Assessment

When asked to create a commit, first perform governance checks:

### Pre-Commit Governance
1. **Todo Status Check**: Confirm you are up to date with todos
2. **Review Status Check**: Provide list of .md files with dates of their last formal review by ReviewRules.md, include path so it is clear whether the .md file is internal; confirm you are happy with this file structure and this formal review date.
3. **Loose Cargo Check**: Confirm there are no files hanging around from earlier discovery work that should now be deleted.

### Commit Type Assessment
**Is this a Full Commit or Backup Commit?**

### Full Commit
- Represents substantial project pillar
- Suitable for inclusion in OurStory.md narrative
- Contains meaningful progress since last full commit
- Should have descriptive commit message for project history

### Backup Commit  
- Work-in-progress protection
- File organization or cleanup
- Partial work that doesn't represent a pillar
- Should have simple "Backup: [brief description]" format

## Full Commit Process

For full commits, follow this workflow:

### 1. Purpose
- Create **Summary of Relevant Work Since Last Full GitHub Commit** rooted in actual development work by reviewing Claude Code interaction records
- Use it as factual foundation for next OurStory episode
- Provide authentic narrative base for OurStory episodes
- Ensure OurStory episodes remain grounded in actual work completed

### 2. Process

#### Step 1: Review Interaction Records
- Read `.claude.json.backup` history spanning the date of previous full commit until now
- Identify key accomplishments and decisions made
- Pay particular attention to prompts starting "Important:" and the surrounding context
- Extract significant technical work, reviews, and strategic discussions
- Focus on concrete deliverables and decisions
- Include major files created, reviewed, or modified
- Note any strategic insights or process improvements
- Identify themes such that themes are reasonably modular (typically 3-7 themes for major commits):
  - Create a theme name summarizing the issues addressed within the theme
  - Create theme details setting out a summary of the work relating to that theme
  - Be succinct, don't sprawl (this will be reviewed and signed off by a human later, so do not be too cautious)
- Work out approximate date when most work was done around the identified theme
- Use this to create a draft of a **Summary of Relevant Work Since Last Full GitHub Commit** report using format: date, theme, theme details; sorted by date earliest first
- Create a draft of the Commit Header, simply: "Changes made [date of previous Full Commit] to [today's date]"
- Create a draft of the Commit Message using Commit Message Format set out below
- Show the draft Commit Header and the draft Commit Report and seek confirmation
- If appropriate, carry out any suggested edits
- Make the Commit

**Commit Message Format**
```
Commit Header

["Summary of Relevant Work Since Last Full GitHub Commit" report]

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

#### Step 2: Tee Up Next Episode of OurStory.md

- Append the "Summary of Relevant Work Since Last Full GitHub Commit" to OutlineOfGithubChanges.md with the heading "GitHub Commit [date]"

## Backup Commit Process

For backup commits:
- Use simple format: "Backup: [brief description]"
- No OurStory.md integration needed
- Commit immediately without extended process

---

## About This Document

**Author**: Blake Dempster, Founder, CEO, Principal Architect  
**Co-Authored by**: Claude Code (claude.ai/code)  
**Created**: 3 July 2025  
**Date last reviewed formally by ReviewRules.md**: 9 July 2025  
**Purpose**: Guidance for managing git commits aligned with OurStory.md narrative structure and project governance.

---
