# Adding a new post

1. Duplicate `posts/_example-post.qmd` (or make a new folder `posts/my-post-name/`).
2. Give it a front matter block:

```yaml
---
title: "Your post title"
date: 2026-08-01
categories: [optional, tags]
---
```

3. Write the post in Markdown below the `---`.
4. Remove `draft: true` if present (the example post has it set so it won't show until you're ready).
5. Run `quarto render` — it appears automatically on the Writing page, newest first.
