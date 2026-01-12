local M = {}

local function get_ai_commit_message()
  -- diff de lo staged
  local diff = vim.fn.system("git diff --cached")
  if vim.v.shell_error ~= 0 or diff == "" then return nil, "No hay cambios staged" end

  -- prompt breve para el CLI
  local prompt = [[
You are an assistant that writes concise, conventional commit messages (in English).
Given the following git diff, generate ONLY the commit subject line, no body.

Diff:
]] .. diff

  -- llamamos al CLI de copilot
  local cmd = { "copilot", "-p", prompt, "--model", "gpt-5-mini" }

  -- pasamos el prompt por stdin
  local output = vim.fn.systemlist(cmd, prompt)
  if vim.v.shell_error ~= 0 or not output or #output == 0 then return nil, "Error llamando a github-copilot-cli" end

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

  -- remplaza el buffer gitcommit con el mensaje generado
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { msg, "" })
  vim.api.nvim_win_set_cursor(0, { 1, #msg })
end

return M
