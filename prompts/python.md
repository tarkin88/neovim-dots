---
name: python UT
interaction: chat
description: Use a workflow to test the code
opts:
  adapter:
    name: copilot
    model: claude-sonnet-4
  ignore_system_prompt: true
  is_workflow: true
---

## user

Write unit tests for this method/class using pytest.

- AAA pattern.
- No comments
- Prefer mocking for unit test.
