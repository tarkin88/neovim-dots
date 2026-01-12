local M = {}

local function get_ai_commit_message()
  -- diff de lo staged
  local diff = vim.fn.system("git diff --cached")
  if vim.v.shell_error ~= 0 or diff == "" then return nil, "No staged changes" end

  -- prompt breve para el CLI
  local prompt = [[
  * Use Conventional Commits format
  * Always use scoped commits for context-specific changes (e.g., feat(auth): add login endpoint)
  * use a concise description of the change as body
  * title length: max 72 characters
  * body length: max 100 characters per line
  * Write clear, concise commit messages.

  Given the following git diff.

  Diff:
]] .. diff

  -- llamamos al CLI de copilot
  local cmd = { "copilot", "-p", prompt, "--model", "gpt-5-mini" }

  -- pasamos el prompt por stdin
  local output = vim.fn.systemlist(cmd, prompt)
  if vim.v.shell_error ~= 0 or not output or #output == 0 then return nil, "Error calling copilot-cli" end

  -- primera línea como subject
  return output[1], nil
end

function M.gen_commit_for_buf(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  local msg, err = get_ai_commit_message()
  if not msg then
    vim.notify("AI commit: " .. err, vim.log.levels.WARN)
    return
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { msg, "" })
  vim.api.nvim_win_set_cursor(0, { 1, #msg })
end

return M
