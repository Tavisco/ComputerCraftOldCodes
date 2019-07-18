-- File created by Tavisco/Oct125
-- On epoch: 1355346669
-- On date: 12 December 2012

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
fs.delete("name")
local fh1 = io.open(".replacer/code", "r")
local code = fh1:read("*a")
fh1:close()
local program = http.get("http://pastebin.com/raw.php?i=" .. code)
f = fs.open(name, "w")
f.write(program.readAll())
f.close()
shell.run(name)
end

function first()
term.clear()
term.setCursorPos(1,1)
print("FIRST TIME!!!")
print("Welcome to replacer!")
print("Please configure the program using:")
print("re <code of pastebin> <name of the program to replace>")
fs.makeDir(".replacer")
local fh = io.open(".replacer/firstTime", "w")
fh:write("You ran this program!") --Write the first time run archive
fh:close()
do return end
end

if fs.exists(".replacer/firstTime") then

else
first()
end

if #tArgs == 1 then
	printUsage()
  	return
elseif #tArgs > 2 then
	printUsage()
  	return
elseif #tArgs < 0 then
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
print("Error 2!")
end
end

if #tArgs == 0 then
if fs.exists(".replacer/firstTime") then
if fs.exists(".replacer/name") then
download()
else
printUsage()
end
else
print("Error 3!")
end
end