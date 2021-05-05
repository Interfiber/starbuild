local install = {}

install.InstallFromGit = function (GitUrl)
    print("Installing plugin...")
    os.execute("mkdir -p /tmp/starbuild_cache")
    os.execute("git clone "..GitUrl.." /tmp/starbuild_cache")
    -- every plugin has a install.json file
    local lunajson = require 'lunajson'
    -- read from the install.json file
    -- the install.json file will contain a value 
    -- called plug_file, this will contain the path to the
    -- plugin file.
    local conf = io.open("/tmp/starbuild_cache/install.json"):read("a")
    local config = lunajson.decode(conf)
    print("Plugin file is "..config.plug_file)
    os.execute("mkdir -p $HOME/.local/starbuild/plugins")
    local home = os.getenv("HOME")
    os.rename("/tmp/starbuild_cache/"..config.plug_file, home.."/.local/starbuild/plugins/"..config.plug_file)
    print("Installed plugin!")
end
return install