local core = {}
-- Core functions used in every starbuild.lua
-- can be found in this file. Simply add the to the core table.
-- they are automaticlly exported at the end of the file

-- plugins
local core_plugins = {}
local core_plugin_triggers = {}

-- plugin functions
core.RunPluginTrigger = function (PluginName, TriggerName, TriggerArgs)
    -- check for the trigger.
    if core_plugin_triggers[PluginName][TriggerName] == nil then
        print("WARN! Failed to run trigger with name "..TriggerName.."!")
        print("WARN! This trigger does not exist in starbuilds table!")
        print("WARN! Not exiting, as error is not fatal!")
        os.exit(1)
    end
    -- run the trigger
    core_plugin_triggers[PluginName][TriggerName](TriggerArgs)
end
core.LoadPlugin = function (PluginSource)
    -- check if the plugin is a default plugin
    if string.match(PluginSource, "DEFAULT_CPP") then
        -- load plugin
        local plugin = require("starbuild_core_cpp")
        local BaseName = plugin.BaseName
        core_plugins[BaseName] = plugin
        -- load plugin triggers into memory
        if plugin.Triggers == nil then
            print("FATAL ERROR! Failed to load the plugin "..plugin.Name.."!")
            print("Every plugin is expected to have triggers! But this one does not. Please")
            print("consult the plugin guide for more info.")
            os.exit(1)
        end
        core_plugin_triggers[BaseName] = plugin.Triggers
    elseif string.match(PluginSource, "DEFAULT_C") then
        local plugin = require("starbuild_core_c")
        local BaseName = plugin.BaseName
        core_plugins[BaseName] = plugin
        -- load plugin triggers into memory
        if plugin.Triggers == nil then
            print("FATAL ERROR! Failed to load the plugin "..plugin.Name.."!")
            print("Every plugin is expected to have triggers! But this one does not. Please")
            print("consult the plugin guide for more info.")
            os.exit(1)
        end
        core_plugin_triggers[BaseName] = plugin.Triggers
    else
        -- load the plugin from source
        local plugin = require(PluginSource)
        local BaseName = plugin.BaseName
        core_plugins[BaseName] = plugin
        -- load plugin triggers into memory
        if plugin.Triggers == nil then
            print("FATAL ERROR! Failed to load the plugin "..plugin.Name.."!")
            print("Every plugin is expected to have triggers! But this one does not. Please")
            print("consult the plugin guide for more info.")
            os.exit(1)
        end
        core_plugin_triggers[BaseName] = plugin.Triggers
    end
end
-- basic functions, so you dont need to use alot of lua
core.RenameFile = function (input, output)
    -- rename file
    os.rename(input, output)
end
-- export.
return core