# GitHub Commit Assistant

This document provides guidance to Claude Code for managing the MCP Project git commits that align with our OurStory.md narrative structure.

## Pre-Commit Governance Checks

First carry out Pre-Commit Governance Checks

1. **Todo Status Check**: Ask "Confirm you are up to date with todos?" then PAUSE - seek confirmation to proceed.
2. **Review Status Check**: Provide list of .md files with dates of their last formal review by ReviewRules.md as recorded in the About section at the bottom of the document, indicate whether the .md file is internal, and show file size; if there is no date of last formal review by ReviewRules.md, still include them in the list just say "not reviewed"; ask " Are you are happy with this file structure and this formal review date?". Then PAUSE - seek confirmation to proceed.
3. **Loose Cargo Check**: Ask "Have you cleared loose files hanging around from earlier discovery work that should now be deleted." Then PAUSE - seek confirmation to proceed.
4. **Tasks.md Check** Ask "Has Tasks.md has been reviewed to make sure it is up to date?" Then PAUSE - seek confirmation to proceed. 
5. **File Size Check** Check the file sizes in the commit. Say "The largest file is [file, filesize]". Then PAUSE - seek confirmation to proceed.
6. **Github Interval Check** Check the days since the previous GitHub commit. Say "The previous GitHub commit was [days] ago. Policy is once every 14 days.". Then PAUSE - seek confirmation to proceed.

After all 6 separate confirmations, proceed to Commit Process

## Commit Process

### Review Interaction Records
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

### Planned Action

- Create a draft of the Commit Header, simply: "Changes made [date of previous Full Commit] to [today's date]"
- Create a draft of the Commit Message using the Commit Message Format set out below
- Show the draft Commit Header and the draft Commit Report 
- PAUSE and seek confirmation

### Action

- Append the "Summary of Relevant Work Since Last Full GitHub Commit" to OutlineOfGithubChanges.md with the heading "GitHub Commit [date]"
- Make the Commit

**Commit Message Format**
```
Commit Header

["Summary of Relevant Work Since Last Full GitHub Commit" report]

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

