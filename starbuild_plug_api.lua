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
        print(term.colors.white.."[-] "..term.colors.red..task.." (failed)"..term.colors.white)
    else
        print(term.colors.white.."[+] "..term.colors.green..task.." (success)"..term.colors.white)
    end
end
api.GenObjectFileCpp = function (file, output)
    -- generate using g++
    local stat = os.execute("g++ -c "..file.." -o "..output)
    return stat
end
api.GenObjectFileC = function (file, output)
    -- generate using g++
    local stat = os.execute("gcc -c "..file.." -o "..output)
    return stat
end
api.LinkObjectFilesC = function (files, output)
    -- link using g++
    local files_str = ""
    for i,v in pairs(files) do
        files_str = files_str..v.." "
    end
    local status = os.execute("gcc -o "..output.." "..files_str)
    return status
end
api.LinkObjectFilesCpp = function (files, output)
    -- link using g++
    local files_str = ""
    for i,v in pairs(files) do
        files_str = files_str..v.." "
    end
    local status = os.execute("g++ -o "..output.." "..files_str)
    return status
end
return api