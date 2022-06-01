

function _project_menu_options()
    import("core.project.menu")
    return menu.options()
end

-- define task
task("config-update")

    -- set category
    set_category("plugin")

    -- on run
    on_run("main")

    -- set menu
    set_menu {
                -- usage
                usage = "xmake config-update [options]"

                -- description
            ,   description = "Incremental config update."

                -- options
            ,   options = {
                    {category = "."},
                    {'p', "plat",       "kv", "auto"    , "Compile for the given platform.", values = _plat_values},
                    {'a', "arch",       "kv", "auto"    ,   "Compile for the given architecture.", _arch_description, values = _arch_values},
                    {'m', "mode",       "kv", "auto" ,      "Compile for the given mode.", values = _mode_values},
                    {'k', "kind",       "kv", "static"  ,   "Compile for the given target kind.", values = {"static", "shared", "binary"}},
                    {nil, "host",       "kv", "$(host)" ,   "Set the current host environment."},
                    {nil, "policies",    "kv", nil       ,  "Set the project policies.",
                                                            "    e.g.",
                                                            "    - xmake f --policies=package.fetch_only",
                                                            "    - xmake f --policies=package.precompiled:n,package.install_only"},
                    {category = "Package Configuration"},
                    {nil, "require",    "kv",   nil     ,   "Require all dependent packages?", values = {"yes", "no"}},
                    {nil, "pkg_searchdirs", "kv", nil       , "The search directories of the remote package."
                                                            , "    e.g."
                                                            , "    - xmake f --pkg_searchdirs=/dir1" .. path.envsep() .. "/dir2"},
                    _project_menu_options,
        }
    }
