-- define task
task("list-deps")

    -- set category
    set_category("plugin")

    -- on run
    on_run("main")

    -- set menu
    set_menu {
                -- usage
                usage = "xmake list-deps [options]"

                -- description
            ,   description = "List project dependencies."

                -- options
            ,   options = {
                    {'t', "target", "v", nil, "Target name" }
            }
    }
