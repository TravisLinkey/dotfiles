---
id: test_frontmatter
created: 2024-01-15 10:30:00
modified: 2024-01-15 10:30:00
aliases: []
tags: ["test", "frontmatter", "demo"]
---

# Test Front Matter

This is a test file to demonstrate the front matter functionality.

When you save this file, the `modified` field should automatically update to the current timestamp.

## How it works

1. The `note_frontmatter_func` in your Obsidian configuration will automatically add front matter to new files
2. The `BufWritePre` autocmd will update the `modified` field every time you save a markdown file
3. The `created` field will only be set when the file is first created and won't be overwritten

Try editing this file and saving it to see the `modified` timestamp update!
