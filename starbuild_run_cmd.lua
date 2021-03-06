local run = {}

function run.StartBuildRun()
    -- this will fail is the lua inside the starbuild file is written with error
    local config = require("starbuild")
    -- the core contains all of the functions
    local core = require("starbuild_run_core")
    -- start build
    -- this will fail if the config function does not exist, so we make sure it does
    -- PROGRAMMING
    if config.Config == nil then
        print("FATAL ERROR! Failed to find Config function in starbuild.lua!")
        print("The build will not proceed unless the Config function is found.")
        print("Exit Code: 1")
        os.exit(1)
    end
    -- run the config function
    config.Config(core)
end
return run
