local cli = {}
local version_info = {}
version_info.VersionString = "Starbuild version 0.0.1"
ver = io.popen('lua -v')
version_info.LuaVersion = ver:read("a")
local init = require("starbuild_init")
local run = require("starbuild_run_cmd")

cli.PrintHelp = function ()
    print("starbuild - Fast plugin based build system written in lua")
    print("Interfiber <interfiber@protonmail.com>")
    print("Usage: starbuild [cmd]")
    print("Commands:")
    print("   init       Create new starbuild.lua")
    print("   run        Start the build proccess")
    print("   install    Install plugin from a git URL")
    print("   uninstall  Uninstall a plugin")
    print("Flags:")
    print("   --version-info    Print version info")
end
cli.PrintVersionInfo = function ()
    print("starbuild version info:")
    print(version_info.VersionString)
    print("Lua version: "..version_info.LuaVersion)
end
cli.InitCommand = function ()
    init.Bootstrap()
end
cli.RunCommand = function ()
    run.StartBuildRun()
end
return cli