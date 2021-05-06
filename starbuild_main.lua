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
elseif args == 1 and arg[1] == "install" then
    print("Error: Expected 2 args, found one. ")
    print("Example syntax:")
    print("starbuild install https://github.com/someone/something")
elseif args == 2 and arg[1] == "install" then
    cli.InstallCommand(arg[2])
else
    print("Invalid command.")
end