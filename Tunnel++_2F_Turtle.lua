-- File created by Tavisco/Oct125
-- On epoch: 1422833113
-- On date: 01 February 2015

--[[
************************************
*       CREATED BY: Oct125         *
* USING PARTS OF CODE FROM: Dan200 *
************************************
]]

-- Set variables
local chest = 0
local tanto = 0
local chunk = 0
local depth = 0
local collected = 0

remoto = false
infinito = false
ligado = false
finished = false

versao = "2.0 F"
lado = ""
idServer = 0
message = ""
protocolo = "turtletunnel"
channel = 5
length = 0

dados = {}

local function collect()
    collected = collected + 1
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

function desenhaMenu()
    term.clear()
    term.setCursorPos(1,1)  
    print("           Tunnel Plus Plus")
    print("")
    print("Please, type your option:")
    print("1- Tunnel to infinite and beyound")
    print("2- Tunnel for X blocks")
    print("3- Exit")
    print("")
    term.write("Option: ")
    local opcao = io.read()
    if opcao == "1" then
        infinito = true
    elseif opcao == "2" then
        print("")
        print("Ok, how many blocks do you want to tunnel?")
        term.write("Blocks: ")
        length = tonumber(io.read())
        if length < 1 then
            print( "Tunnel length must be positive!" )
            print("Returning...")
            sleep(3)
            desenhaMenu()
        end
    elseif opcao == "3" then
        term.clear()
        term.setCursorPos(1,1)
        osreboot()
    else
        print("")
        print("Please, select one option!")
        print("Restarting...")
        sleep(2)
        desenhaMenu()
    end

    term.clear()
    term.setCursorPos(1,1)
    print("")
    print("Do you want to enable remote control?(Y/N)")
    local resposta = string.lower(io.read())
    if resposta == "y" then
        print("")
        print("Ok, detecting the side of the modem...")

        local lstSides = rs.getSides()
        for i, side in pairs(lstSides) do
            if (peripheral.isPresent(side)) then
                if (peripheral.getType(side)) == "modem" then
                lado = side
                end
            end
        end

        if lado == "" then
            print("Modem not found!")
            print("Is this turtle equipped if one?")
            print("Returning...")
            sleep(4)
            desenhaMenu()
        end

        remoto = true
        sleep(1)
        print("")
        print("Perfect! I've found one modem at the "..lado)
        rednet.open(lado)
        sleep(2)
        term.clear()
        term.setCursorPos(1,1)
        print("Please, setup the server first!")
        print("My ID is ".. os.getComputerID())
        print("Now, I need the server ID")
        term.write("Server ID: ")
        idServer = tonumber(io.read())

    elseif resposta == "n" then
        print("Ok, then!")
    else
        print("Please anwser 'y' or 'n'")
        print("Getting back...")
        desenhaMenu()
    end


    term.clear()
    term.setCursorPos(1,1)  
    print("Please, in my 1st slot put Coal.")
    print("")
    print("In the 2nd, insert 64 chests (for best performance).")
    print("")
    print("And, in the 3rd slot, put 4 chunk loaders (VERY IMPORTANT).")
    print("")
    print("And then, write 'Done'")
    term.write("Done? ")
    local done = io.read()
    done = string.lower(done)
    if done ~= "done" then
        print("")
        print("Please insert these itens and try again!")
        print("Rebooting...")
        sleep(3)
        os.reboot()
    end
end

local function desenhaTela()
    term.clear()
    term.setCursorPos(1,1)
    print("      Tunnel Plus Plus ", versao)

    print("")
    if remoto then
        print("Remote control is on!")
    else
        print("Remote control is off!")
    end

    print("")
    print("By far, I've minned "..collected.." items")

    print("")
    if not infinito then
        print("Tunnelling...")
    else
        print("Tunnelling infinitly...")
    end

    print("")
end

term.clear()
term.setCursorPos(1,1)
desenhaMenu()
desenhaTela()

turtle.select(4)

local function loop()
    if not infinito then
        local aTanto = 0
        while aTanto < length do
            if ligado then
                cava()
                verificaChunk()

                tryDig()
                if not tryForward() then
                    print( "Aborting Tunnel." )
                    break
                end

                chunk = chunk + 1
                aTanto = aTanto + 1
            else
                print("Remotely stopped, waiting...")
                sleep(2)
            end
        end
    else
        while true do
            if ligado then
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
            else
                print("Remotely stopped, waiting...")
                sleep(2)
            end  
        end
    end
end

local function rednetRecebe()
    while true do
        local RidServer, Rmsg, Rchannel = rednet.receive(protocolo)
        if RidServer == idServer then
            if Rmsg == "tDesliga" then
                ligado = false
            elseif Rmsg == "tLiga" then
                ligado = true
            end
        end

    sleep(1)
    end
end

function rednetEnvia()
    while finished == false do
        dados = {}
        dados["pwrStatus"] = ligado
        dados["qChests"] = turtle.getItemCount(2)
        dados["qCoals"] = turtle.getItemCount(1)
        dados["qItems"] = collected
        dados["sFinished"] = finished
        rednet.send(idServer, dados, protocolo)
        sleep(2)
    end
end

function rednetEnviaFim()
        dados = {}
        dados["sFinished"] = finished
        rednet.send(idServer, dados, protocolo)
end

local function rednetCmds()
    parallel.waitForAny(rednetRecebe, rednetEnvia)
    --
end

ligado = true

if not remoto then
    loop()
else
    parallel.waitForAny(loop, rednetCmds)
end

finished = true
ligado = false
rednetEnviaFim()
print( "Tunnel complete." )
print( "Mined "..collected.." items total." )