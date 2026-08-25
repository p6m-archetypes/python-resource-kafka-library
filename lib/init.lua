-- python-resource-kafka-library main module.
-- Renders the messaging package (async Kafka producer via aiokafka).
--
-- The calling archetype is responsible for adding the corresponding
-- dependency to pyproject.toml:
--   aiokafka
--
-- API:
--   local kafka = require("python-resource-kafka")
--   kafka.render(context, { destination = context:get("project-name") })
--
-- Context contract:
--   prefix-name  — kebab-case first segment (e.g. "billing")
--   suffix-name  — kebab-case second segment (e.g. "service")
--   prefix_name  — snake_case first segment (e.g. "billing")
--   suffix_name  — snake_case second segment (e.g. "service")

local M = {}

function M.render(context, opts)
    opts = opts or {}
    local d = opts.destination
    if d and d ~= "" then
        directory.render("contents", context, { destination = d })
    else
        directory.render("contents", context)
    end
    return context
end

return M
