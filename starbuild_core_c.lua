-- core C plugin for starbuild
local plugin = {}
plugin.Name = "C for starbuild"
plugin.BaseName = "C"
plugin.Author = "Interfiber"
plugin.Repo = "https://github.com/Interfiber/starbuild"
plugin.Triggers = {}
plugin.Triggers.CBuild = function (args)
    print("waiting for compiler to finish...")
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
            print("FATAL ERROR(C plugin): Failed to find file "..v)
            os.exit(1)
        end
    end
    os.execute("gcc"..files)
    print("compile finished. output file is a.out")
end
return plugin