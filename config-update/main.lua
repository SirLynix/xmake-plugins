import("core.base.option")
import("core.base.task")
import("core.cache.localcache")
import("core.project.config")
import("core.project.project")

-- filter option
function _option_filter(name)
    local options =
    {
        target      = true
    ,   file        = true
    ,   root        = true
    ,   yes         = true
    ,   quiet       = true
    ,   confirm     = true
    ,   project     = true
    ,   verbose     = true
    ,   diagnosis   = true
    ,   require     = true
    ,   export      = true
    ,   import      = true
    }
    return not options[name]
end

function main()
    -- lock the whole project
    project.lock()

    print(config.read("mode"))

    local options = localcache.get("config", "options")
    --options["kind"] = 

    for name, value in pairs(option.options()) do
        if _option_filter(name) then
            options = options or {}
            options[name] = value
        end
    end

    options["clean"] = true

    task.run("config", options)

    -- unlock the whole project
    project.unlock()
end
