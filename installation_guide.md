---
title: Installation Guide
layout: home
---

# Starbuild installation guide
Starbuild will run on any UNIX like operating system that has the following software
  - GNU coreutils
  - bash
  - Lua
If you are running a debian based linux distro bash, and coreutils are already installed. This is true for mostly every distro. So you just need to install lua. For debian based distro users run the following
```bash
sudo apt install lua5.4
```
For arch distros you can run the following
```bash
sudo pacman -S lua
```
If you are running MacOS you can run the following if you have [brew](https://brew.sh)
```bash
brew install lua
```
After you have lua installed run the following command to install starbuild
```bash
lua -e "$(curl -L https://git.io/J3XmW)"
```
Then follow the onscreen instructions. After you do that starbuild should be installed.