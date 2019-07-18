-- File created by Tavisco/Oct125
-- On epoch: 1422666459
-- On date: 30 January 2015

--[[
************************************
*       CREATED BY: Oct125         *
* USING PARTS OF CODE FROM: Dan200 *
************************************
]]

-- Set variables
chest = 0
tanto = 0
chunk = 0

--chestJaColocada = false
infinito = false

versao = "1 F"

local tArgs = { ... }
if #tArgs ~= 1 then
    print( "Usage: tunnel <length>" )
    print("Use <lenght> = 0 to mine infinitly")
    return
end

term.clear()
term.setCursorPos(1,1)
print("Tunnel2 ver: ", versao)

-- Mine in a quarry pattern until we hit something we can't dig
local length = tonumber( tArgs[1] )
if length == 0 then
    infinito = true
end
if length < 0 then
    print( "Tunnel length must be positive or zero" )
    return
end
    
local depth = 0
local collected = 0

local function collect()
    collected = collected + 1
    if math.fmod(collected, 25) == 0 then
        print( "Mined "..collected.." items." )
    end
end

local function tryDig()
    while turtle.detect() do
        if turtle.dig() then
            collect()
            sleep(0.5)
        else
            return false
        end
    end
    return true
end

local function tryDigUp()
    while turtle.detectUp() do
        if turtle.digUp() then
            collect()
            sleep(0.5)
        else
            return false
        end
    end
    return true
end

local function tryDigDown()
    while turtle.detectDown() do
        if turtle.digDown() then
            collect()
            sleep(0.5)
        else
            return false
        end
    end
    return true
end

local function refuel()
    local fuelLevel = turtle.getFuelLevel()
    if fuelLevel == "unlimited" or fuelLevel > 0 then
        return
    end
    
    local function tryRefuel()
        for n=1,16 do
            if turtle.getItemCount(n) > 0 then
                turtle.select(n)
                if turtle.refuel(1) then
                    turtle.select(1)
                    return true
                end
            end
        end
        turtle.select(1)
        return false
    end
    
    if not tryRefuel() then
        print( "Add more fuel to continue." )
        while not tryRefuel() do
            os.pullEvent( "turtle_inventory" )
        end
        print( "Resuming Tunnel." )
    end
end

local function tryUp()
    refuel()
    while not turtle.up() do
        if turtle.detectUp() then
            if not tryDigUp() then
                return false
            end
        elseif turtle.attackUp() then
            collect()
        else
            sleep( 0.5 )
        end
    end
    return true
end

local function tryDown()
    refuel()
    while not turtle.down() do
        if turtle.detectDown() then
            if not tryDigDown() then
                return false
            end
        elseif turtle.attackDown() then
            collect()
        else
            sleep( 0.5 )
        end
    end
    return true
end

local function tryForward()
    refuel()
    while not turtle.forward() do
        if turtle.detect() then
            if not tryDig() then
                return false
            end
        elseif turtle.attack() then
            collect()
        else
            sleep( 0.5 )
        end
    end
    return true
end

local function verificaInventario()
    x = 1
    while x <= 17 do
        if x == 17 then
            return true
        else
            if turtle.getItemCount(x) >= 1 then
                x = x+1
            else
                return false
            end
        end
    end
end

local function colocaChest()
    print("Putting a chest...")
    turtle.turnRight()
    turtle.select(2)
    turtle.place()
    for x = 4,16 do
        turtle.select(x)
        turtle.drop(turtle.getItemCount(x))
    end
    chest = tanto
    chestJaColocada = true
    print("Done! Let's get back mining...")
    turtle.turnLeft()
    turtle.select(2)
end

local function cava()
    tanto = tanto + 1
    turtle.placeDown()
    tryDigUp()
    turtle.turnLeft()
    tryDig()
    tryUp()
    tryDig()
    turtle.turnRight()
    turtle.turnRight()
    tryDig()
    tryDown()
    tryDig()
    turtle.turnLeft()
end

local function verificaChunk()
    if chunk == 16 then
        print("Placing the chunk loader.")
        turtle.turnLeft()
        tryForward()
        turtle.turnRight()
        tryDig()
        turtle.select(3)
        turtle.place()
        print("Chunk loader placed.")
        tryUp()
        tryDig()
        turtle.turnRight()
        tryForward()
        turtle.turnLeft()
        tryDig()
        turtle.turnRight()
        tryForward()
        turtle.turnLeft()
        tryDig()
        tryDown()
        tryDig()
        turtle.turnLeft()
        tryForward()
        turtle.turnRight()
        tryDig()

        chunk = 0

        turtle.turnRight()
        turtle.turnRight()
        turtle.turnRight()
        turtle.select(3)
        turtle.place()
        turtle.turnLeft()

        for i = 1, 15 do
            if not tryForward() then
                print( "Aborting Tunnel." )
            break
            end
        end
        turtle.turnRight()
        tryDig()
        tryForward()
        turtle.turnLeft()
        tryDig()
        turtle.turnLeft()
        tryForward()
        turtle.turnLeft()

        for i = 1, 16 do
            if not tryForward() then
                print( "Aborting Tunnel." )
               break
            end
        end
        chunk = chunk + 1
        turtle.select(4)
    end
end

local function verificaChest()
    if turtle.getItemCount(2) > 1 then
        return true
    else
        return false
    end
end

turtle.select(4)

if infinito == false then
    print( "Tunnelling..." )
    for n=1,length do
        cava()
        verifcaChunk()

        if n<length then
            tryDig()
            if not tryForward() then
                print( "Aborting Tunnel." )
                break
            end
            chunk = chunk + 1
        else
            print( "Tunnel complete." )
        end
    end
else
    print( "Tunnelling infinitly..." )
    while true do
        if not verificaChest() then
            print("Only one chest remaining, aborting!")
            break
        end
        cava()
        if verificaInventario() then
            colocaChest()
        end
        verificaChunk()
        
        tryDig()
        if not tryForward() then
            print( "Aborting Tunnel." )
            break
        end
        chunk = chunk + 1
    end
end

print( "Tunnel complete." )
print( "Mined "..collected.." items total." )