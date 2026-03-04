---
description: fill out the plan file
agent: build
---

Retrieve Jira ticket {TICKET_ID} and update the plan file.
1. **Credentials:** Read `~/.flow-secrets` to obtain `TRACKER_EMAIL`, `TRACKER_TOKEN`, and `TRACKER_URL`.
2. **Fetch:** Run the command below, substituting the credentials and ticket ID:
   `curl -s -u "$TRACKER_EMAIL:$TRACKER_TOKEN" -H "Accept: application/json" "$TRACKER_URL/{TICKET_ID}"`
3. **Extract:** From the JSON response, parse out:
   - Summary
   - Description
   - Acceptance Criteria (if available in the description or fields)
4. **Update:** formatted as Markdown, insert this content into `CONTEXT/00__PLAN_FILE.txt` under the `## Enhancement` section. Ensure you replace any existing text in that specific section.
