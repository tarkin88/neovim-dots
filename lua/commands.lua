local M = {}

local function get_ai_commit_message()
  local diff = vim.fn.system("git diff --cached")
  if vim.v.shell_error ~= 0 or diff == "" then return nil, "No staged changes" end

  local prompt = [[
You are an assistant that writes Git commit messages.

Requirements:
- Use Conventional Commits format.
- Always use scoped commits for context-specific changes (e.g., feat(auth): add login endpoint).
- Write BOTH:
  1) A single-line title (subject) as the first line, max 72 characters.
  2) A body (one or more lines) explaining the change, max 100 characters per line.
- Output ONLY the commit message, no extra explanations.

Given the following git diff, write the commit message:

Diff:
]] .. diff

  -- usa copilot CLI instalado por brew
  local cmd = { "copilot", "-p", prompt, "--model", "gpt-5-mini" }

  -- prompt solo una vez, por stdin
  local output = vim.fn.systemlist(cmd)
  if vim.v.shell_error ~= 0 or not output or #output == 0 then return nil, "Error calling copilot-cli" end

  return output, nil
end

function M.gen_commit_for_buf(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  local lines, err = get_ai_commit_message()
  if not lines then
    vim.notify("AI commit: " .. err, vim.log.levels.WARN)
    return
  end

  -- inserta título + body al inicio, sin borrar comentarios de git
  vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, lines)
  vim.api.nvim_buf_set_lines(bufnr, #lines, #lines, false, { "" })

  -- cursor al final del título
  vim.api.nvim_win_set_cursor(0, { 1, #lines[1] })
end

return M
