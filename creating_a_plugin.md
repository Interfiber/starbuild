---
title: Creating a plugin
layout: home
---
# Creating a starbuild plugin
To start creating a starbuild plugin, you NEED to know lua as plugins are written in lua. Then create a new lua file in your project folder. Now we need to [symlink](https://en.wikipedia.org/wiki/Symbolic_link) this file into starbuilds plugin folder. Use the command below to do that
```bash
mkdir -p $STARBUILD/plugins
ln -s LUA_FILE $STARBUILD/plugins
```
Make sure to replace ```LUA_FILE``` with the full file name of the lua file you created. After that completes you have your plugin's lua file installed. Now lets write a plugin. To start paste the example code into your plugin file from below
```lua
local plugin = {}
plugin.Name = "My Cool Plugin"
plugin.BaseName = "MyCoolPlugin"
plugin.api = {}
plugin.Triggers = {}
return plugin
```
Now lets go over what this code does. First we create a plugin table and add a ```Name``` field to it. We set this field to the full name of our plugin, then we add a ```BaseName``` field, this is the name of the plugin we will be using from our starbuild.lua file, this file should have no spaces, no special chars, and should be small. Then we gain access to the starbuild plugin API by setting the api field to a empty table. Then we create a empty ```Triggers``` field, and finally return the plugin table.

## Triggers
Triggers are like command we can run in our starbuild.lua file. To create paste the following code above the return statment at the end of the file.
```lua
plugin.Triggers.MyTriggerName = function (args)
    print("Plugin triggered!")
end
```
Now lets go over what this code does. We add a new field to the triggers field named ```MyTriggerName``` this is the name of the trigger. We set this field to a function which takes on arg called ```args```. Args is a table which the user will pass in to our trigger.

## Testing our plugin
To test our plugin create a new starbuild project, and import our plugin into our project using the following code. NOTE make sure to put this in the ```Config``` function
```lua
starbuild.LoadPlugin("my_plugin_file")
```
Take not, we are not using our ```BaseName``` we are using the name of the file, without the .lua extension. Now lets trigger our trigger with
```lua
starbuild.RunPluginTrigger("PluginBaseName", "Triggername", { args = "Args" })
```
Just replace ```PluginBaseName``` with the basename of the plugin defined in our plugin file, and replace ```Triggername``` with the name of our trigger. Now run ```starbuild run``` in our project folder, now we should get ```"Plugin triggered!``` print to our terminal. For more info on making plugins, browse through the docs, or open a issue.