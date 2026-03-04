---
description: Create the pull request
agent: build
---


Workflow: Commit & Create Pull Request
Please finalize the current task by committing changes and creating a Pull Request. Follow these steps:
1. Analyze Context
*   Read CONTEXT/00__PLAN_FILE.txt to extract the Ticket ID, Summary, and Requirements.
*   Read CONTEXT/03__PR_FORMAT.txt to load the required PR template.
*   Run git status and git diff to analyze the pending changes.
2. Branch & Commit
*   Ensure the current branch matches the ticket (e.g., feature/KAN-51).
*   If there are uncommitted changes:
    *   Generate a concise Conventional Commit message (e.g., feat: ... or fix: ...) based on the diff and the plan.
    *   Stage and commit the changes.
3. Generate PR Content
*   Create a Functional Changes summary: 2-10 concise bullet points focusing on user/developer impact (avoid implementation details).
*   Draft the PR Body by filling out the CONTEXT/03__PR_FORMAT.txt template with the Ticket Ref, Title, and your Functional Changes summary.
4. Publish
*   Push the branch to origin.
*   Our version control tracker is Jira, we will need to make a http request to the TICKET_TRACKER url: 
Create: POST to .../pullrequests
Update: PUT to .../pullrequests/<id>
    *   Title: Use the Ticket Title.
    *   Body: Use the drafted PR body.
*   If a PR already exists, simply provide the link.
