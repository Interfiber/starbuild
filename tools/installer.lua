print("Running bootstrap...")
local Git = "https://github.com/Interfiber/starbuild.git"
os.execute("git clone "..Git.." .star")
os.execute("cd .star && ./configure --bootstrap")
os.execute("rm -rf .star")
print("Great! starbuild is now installed, simply paste the following")
print("lines into your shell profile")
print("export STARBUILD=$HOME/.local/share/starbuild")
print("export PATH=$PATH:$STARBUILD/bin")
print("Then reload your shell profile, or reopen your terminal.")