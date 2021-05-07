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
    files = {}
    for i,v in pairs(args) do
        -- check if file exists
        local f=io.open(v,"r")
        if f~=nil then 
            io.close(f) 
            -- file exists
            -- generate the files object file
            local failed = plugin.api.GenObjectFileCpp(v, v:gsub(".cpp", ".o"):gsub(".hpp", ".o"))
            file = v:gsub(".cpp", ".o"):gsub(".hpp", ".o")
            table.insert(files, file)
            if not failed then
                plugin.api.TaskStatus(true, "CC "..v)
                os.exit(1)
            else
                plugin.api.TaskStatus(false, "CC  "..v)
            end
        else 
            -- file does not exist
            print("FATAL ERROR(C++ plugin): Failed to find file "..v)
            os.exit(1)
        end
    end
    -- link all .o files, you can use file selectors like *.o
    local failed = plugin.api.LinkObjectFilesCpp(files, "a.out")
    if not failed then
        os.exit(1)
        plugin.api.TaskStatus(true, "link *.o")
    else
        plugin.api.TaskStatus(false, "link *.o")
    end
end
-- return the plugin
return plugin
