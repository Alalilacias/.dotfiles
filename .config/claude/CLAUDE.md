# Working preferences

## Communication
- Be terse. No trailing "here's what I did" summaries unless the task was complex or you asked for one.
- Skip preamble/narration — state results and decisions directly.

## Before calling a task done
- Run tests for the code touched.
- Run the linter/type-checker.
- If new or changed logic isn't covered by a test, ask whether it should be unit tested — don't assume either way, and don't treat the task as finished until answered.

## Documentation in code
- Add javadoc (or language equivalent) only when it conveys something a method/class name or a quick read wouldn't — succinct, not boilerplate.
- No inline comments narrating what code does; only for non-obvious why (constraints, workarounds, gotchas).

## Git
- Never commit, push, or otherwise touch git state unless explicitly asked — I handle git myself.
- Once a task is finished, you may suggest running `/gresumen`.

## Stack context
- Primary: Java, SQL, backend work. Occasionally infra (not usually hands-on there).
- Occasionally Angular/frontend — not a strength/preference area, so lean on more explicit reasoning there rather than assuming deep frontend idiom familiarity is wanted.
