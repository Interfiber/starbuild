-- default C++ plugin for starbuild
local plugin = {}
plugin.Name = "C++ for starbuild"
-- base name should be something without spaces or special characters.
-- in this case just CPP
-- this will also be referenced by the user in starbuild.lua
plugin.BaseName = "CPP"
plugin.Author = "Interfiber"
plugin.License = "GNU public license"
plugin.Repo = "https://github.com/Interfiber/starbuild"
plugin.Triggers = {}
plugin.api = {}
-- all functions you want to use must be included in the trigger.
plugin.Triggers.CPPBuild = function (args)
    -- args should be a list of files to compile
    -- make sure every file in the list exists
    local files = ""
    for i,v in pairs(args) do
        -- check if file exists
        local f=io.open(v,"r")
        if f~=nil then 
            io.close(f) 
            -- file exists
            -- append the file to the files string
            files = files.." "..v
        else 
            -- file does not exist
            print("FATAL ERROR(C++ plugin): Failed to find file "..v)
            os.exit(1)
        end
    end
    -- compile all of the files.
    os.execute("g++"..files)
    plugin.api.TaskStatus(false, "g++")
end
-- return the plugin
return plugin