-- Starbuild's plugin API file
-- most functions in this file can be included in a plugin
-- by adding a api field to your plugin, like below
-- plugin.api = {}
-- local starbuild = plugin.api
local api = {}
local term = require "term"
-- task status will print a bar in the terminal
-- saying if a task failed or not. Example below
-- if the color is green it was ok, if its red
-- that means it failed
-- [+] link p.o (success)
-- [-] link f.o (failed)
-- error would appear here
api.TaskStatus = function (failed, task)
    if failed then
        print("[-] "..term.colors.red..task.." (failed)")
    else
        print("[+] "..term.colors.green..task.." (success)")
    end
end
return api