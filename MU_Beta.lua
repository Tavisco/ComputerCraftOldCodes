-- File created by Tavisco/Oct125
-- On epoch: 1354294014
-- On date: 30 November 2012

-- Made by: Oct125

local tArgs = { ... }

function printUsage()
print("Use: re <code of pastebin> <name of the program to replace>")
print("Or use only: re to replace your program")
end

function download()
print("Downloading and replacing...")
local fh = io.open(".replacer/name", "r")
local name = fh:read("*a")
fh:close()
fs.delete(name)
local fh = io.open(".replacer/code", "r")
local code = fh:read("*a")
fh:close()
local program = http.get("http://pastebin.com/raw.php?i=" .. code)
f = fs.open(name, "w")
f.write(program.readAll())
f.close()
shell.run(name)
end

function first()
print("Welcome to replacer!")
--print("Please use: re <code of pastebin> <name of the program to replace>")
print("DO THIS ONE TIME! OR IF YOU WANT TO CHANGE THE PASTEBIN CODE OR THE NAME OF PROGRAM!")
fs.makeDir(".replacer")
code = tArgs[1] -- Code of pastebin
local fh = io.open(".replacer/code", "w")
fh:write(code) --Write the code of Pastebin in the "code" archive
fh:close()
program1 = tArgs[2] --Name of the program
local fh = io.open(".replacer/name", "w")
fh:write(program1) --Write the name of the program in the "program1" archive
fh:close()
local fh = io.open(".replacer/firstTime", "w")
fh:write("You ran this program!") --Write the first time run archive
fh:close()
--download()
end


if fs.exists(".replacer/firstTime") then
--Continue...
print("e")
else
first()
end

if #tArgs < 2 then
	printUsage()
  	return
elseif #tArgs > 2 then
	printUsage()
  	return
end

if #tArgs == 2 then
if fs.exists(".replacer/firstTime") then
code = tArgs[1] -- Code of pastebin
fs.delete(".replacer/code")
local fh = io.open(".replacer/code", "w")
fh:write(code) --Write the code of Pastebin in the "code" archive
fh:close()
program1 = tArgs[2] --Name of the program
fs.delete(".replacer/name")
local fh = io.open(".replacer/name", "w")
fh:write(program1) --Write the name of the program in the "program1" archive
fh:close()
print("Settings changed!")
else
first()
end
end

if #tArgs == 0 then
download()
end