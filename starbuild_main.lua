-- Starbuild main file

-- include cli
local cli = require("starbuild_cli")
local args = #arg
if args == 0 then
    -- print help
    cli.PrintHelp()
elseif args == 1 and arg[1] == "--version-info" then
    cli.PrintVersionInfo()
elseif args == 1 and arg[1] == "init" then
    cli.InitCommand()
elseif args == 1 and arg[1] == "run" then
    cli.RunCommand()
end