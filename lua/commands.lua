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
  2) A body (one or more lines) explaining the change, be concise, max 70 characters per line.
- Output ONLY the commit message itself, with no explanations, no markdown, no code blocks.
- Do NOT repeat the prompt or the diff.

Given the following git diff, write the commit message:

Diff:
]] .. diff

  local cmd = { "copilot", "-p", prompt, "--model", "gpt-5-mini" }

  local raw = vim.fn.systemlist(cmd)
  if vim.v.shell_error ~= 0 or not raw or #raw == 0 then return nil, "Error calling copilot-cli" end

  local lines = {}
  for _, line in ipairs(raw) do
    local trimmed = line:gsub("^%s+", "")

    local is_meta = trimmed == ""
      or trimmed:match("^You are ")
      or trimmed:match("^Requirements:")
      or trimmed:match("^Given the following")
      or trimmed:match("^Diff:")
      or trimmed:match("^```")
      or trimmed:match("^Total usage est:")
      or trimmed:match("^Total duration %(API%)")
      or trimmed:match("^Total duration %(wall%)")
      or trimmed:match("^Total code changes:")
      or trimmed:match("^Usage by model:")
      or trimmed:match("^gpt%-5%-mini")

    if not is_meta then table.insert(lines, line) end
  end

  if #lines == 0 then return nil, "Copilot CLI returned only meta/prompt" end

  return lines, nil
end

function M.gen_commit_for_buf(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  local lines, err = get_ai_commit_message()
  if not lines then
    vim.notify("AI commit: " .. err, vim.log.levels.WARN)
    return
  end

  if #lines > 1 then
    local with_blank = {}
    with_blank[1] = lines[1]
    with_blank[2] = ""
    for i = 2, #lines do
      with_blank[#with_blank + 1] = lines[i]
    end
    lines = with_blank
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {})

  vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, lines)
  vim.api.nvim_buf_set_lines(bufnr, #lines, #lines, false, { "" })

  vim.api.nvim_win_set_cursor(0, { 1, #lines[1] })
end

function M.packclean()
  local inactive_plugins = vim
    .iter(vim.pack.get())
    :filter(function(x) return not x.active end)
    :map(function(x) return x.spec.name end)
    :totable()

  if #inactive_plugins == 0 then
    vim.notify("✓ No plugins to delete", vim.log.levels.INFO)
    return
  end

  vim.notify(
    "Removing " .. #inactive_plugins .. " plugins:\n" .. table.concat(inactive_plugins, "\n"),
    vim.log.levels.WARN
  )

  vim.pack.del(inactive_plugins)

  vim.notify("✓ Done", vim.log.levels.INFO)
end

return M
