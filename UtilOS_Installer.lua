-- File created by Tavisco/Oct125
-- On epoch: 1356738692
-- On date: 28 December 2012

--Made by Oct125
if term.isColor() then
else
term.clear()
term.setCursorPos(1,1)
print("Please run this in a Advanced Computer!!!")
print("Press any key to continue...")
os.pullEvent()
if true then return end
end

term.clear()
term.setCursorPos(1,1)
term.setTextColor(colors.lime)

if fs.exists(".Util") then
fs.delete(".Util")
print("Deleting old installation...")
sleep(0.5)
print("")
end

print("Making folders...")
fs.makeDir(".Util")
fs.makeDir(".Util/img")
os.sleep(0.5)
print("")
print("Downloading O.S.") -- Download OS
local UtilOS = http.get("http://dl.dropbox.com/u/85854609/UtilOS/os")
f = fs.open(".Util/os", "w")
f.write(UtilOS.readAll())
f.close()
sleep(1)
print("")

print("Downloading boot loader") -- Download Boot Loader
local boot = http.get("http://dl.dropbox.com/u/85854609/UtilOS/boot")
f = fs.open("startup", "w")
f.write(boot.readAll())
f.close()
sleep(1)

print("")
print("Downloading images") -- Download Desktop
f = nil
local desktop = http.get("http://dl.dropbox.com/u/85854609/UtilOS/desktop.nfp")
f = fs.open(".Util/img/desktop.nfp", "w")
f.write(desktop.readAll())
f.close()
-- Next -- Download logo
f = nil
local logo = http.get("http://dl.dropbox.com/u/85854609/UtilOS/logo.nfp")
f = fs.open(".Util/img/logo.nfp", "w")
f.write(logo.readAll())
f.close()
-- Next -- Download door
f = nil
local door = http.get("http://dl.dropbox.com/u/85854609/UtilOS/porta.nfp")
f = fs.open(".Util/img/porta.nfp", "w")
f.write(door.readAll())
f.close()
sleep(1)
print("")
print("Downloading API'S")
print(" Downloading Mouse and Graphic API")
print(" Thanks to Bjornir90")
f = nil
local gui = http.get("http://pastebin.com/raw.php?i=RZYPqxCp") -- Download GUI api thanks to Bjornir90 -- http://www.computercraft.info/forums2/index.php?/topic/6355-api-mouse-and-graphic-api-v14-massive-rewrite-of-the-api/
f = fs.open(".Util/gui", "w")
f.write(gui.readAll())
f.close()
print("")
print("Installing...")
sleep(1.5)
print("")
print("Done!")
print("Rebooting...")
sleep(2)
os.reboot()