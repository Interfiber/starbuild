local Git = "https://github.com/Interfiber/starbuild.git"
os.execute("git clone "..Git.." .star")
os.execute("cd .star && ./configure --bootstrap")
os.execute("rm -rf .star")