return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml" },
  before_init = function(_, config)
    config.settings.yaml = config.settings.yaml or {}
    config.settings.yaml.schemastore = { enable = false, url = "" }

    local ok, schemastore = pcall(require, "schemastore")
    if ok then config.settings.yaml.schemas = schemastore.yaml.schemas() end
  end,
  settings = {},
}
