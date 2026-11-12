---
name: gresumen
description: Summarizes the currently pending (uncommitted) work in the repo. Produces a Conventional Commits message plus a separate Jira-style summary, both in Spanish without accent marks. Use when the user asks to describe/explain current changes, draft a commit message, or write a Jira update for work in progress.
---

# gresumen

Summarize the work currently pending in this repository (staged + unstaged changes, and any
untracked files that are clearly part of the change) and produce two separate outputs: a commit
message, and a Jira summary.

## Language and style rules (apply to BOTH outputs)

- Write in Spanish, but WITHOUT accent marks/tildes — e.g. "creacion" not "creacion con tilde",
  "eliminacion" not "eliminación", "anadir" not "añadir". If ñ is unavoidable, keep it, but never
  leave an accented vowel.
- Be as human and summarized as possible: short, direct sentences, no filler, no "en resumen"
  preambles, no restating the obvious.
- Favor the verbs "crear", "modificar", "eliminar" to describe what changed, instead of vaguer
  verbs like "actualizar" or "cambiar". Use the bare infinitive ("eliminar el try/catch...",
  "crear el changeset...", "modificar el javadoc...") — NOT a conjugated form like "elimina" or
  "se elimina". This mirrors how English commit style uses the bare verb ("Remove", "Add") as an
  imperative stand-in; Spanish has no clean equivalent, so the infinitive is the convention here,
  in both the commit message and the Jira summary.
- Base everything strictly on the actual diff — don't invent scope, motivation, or impact that
  isn't evidenced by the code.

## Step 1: gather the change

Run `git status` and `git diff` (plus `git diff --staged` if there is staged content) to see what
is currently pending. If nothing is pending, fall back to the most recent commit (`git show HEAD`)
and say so before summarizing it.

## Step 2: commit message (Conventional Commits)

```
<type>(<scope>): <resumen corto, sin tildes>

<body opcional — solo si hay mas de una parte distinguible>
```

- `<type>`: feat, fix, refactor, docs, test, chore, style, perf, build, or ci — chosen from what
  the diff actually does, not from the ticket type.
- `<scope>`: check the current branch name (`git branch --show-current`) first — if it is short
  and reads like a ticket identifier (e.g. `PROJ-123`, `abc-42`), use that as the scope. Otherwise
  fall back to the affected module/class/area, lowercase (e.g. `judge`, `advisors`, `changelog`).
- Summary line: bare infinitive (crear/modificar/eliminar, not crea/elimina/se elimina), sin
  tildes, roughly under 72 characters.
- Add a body only when there are multiple distinct changes; one line per change, each still using
  the infinitive crear/modificar/eliminar.

## Step 3: Jira summary (no commit-style formatting)

A second, separate block — not a commit type prefix, not a code block — explaining the same work
for a Jira ticket/comment:

- Single simple change → one short paragraph of plain text.
- Multiple parts, multiple areas touched, or a sequence/dependency worth explaining → write one
  short introductory sentence ending in ":", then a list:
  - Unordered list when the parts are independent.
  - Ordered list when there is a sequence or one part depends on another.
- Still sin tildes, still concise, still favoring the infinitive crear/modificar/eliminar (not
  crea/elimina/se elimina).

## Step 4: copy to the clipboard

Copy each output straight to the clipboard, one at a time (it overwrites, so copy the commit
message then the Jira summary last):

- Windows: `Set-Clipboard -Value "<text>"`
- macOS/Linux: `printf '%s' "<text>" | pbcopy` or `| xclip -selection clipboard`

Then show both outputs in chat, noting the Jira summary is what's currently on the clipboard.
