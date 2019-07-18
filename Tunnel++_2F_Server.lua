-- File created by Tavisco/Oct125
-- On epoch: 1422833146
-- On date: 01 February 2015

--[[
************************************
*       CREATED BY: Oct125         *
************************************
]]

protocolo = "turtletunnel"
turtleID = 0
versao = "1.0 F"
chests = 0
coals = 0
channel = 5
lado = ""
items = 0

turtlePowerStatus = false
turtleFinished = false

os.loadAPI("gui")
gui.clearBuffer()

-- Mini API's --

function botao(g, h, palavras) -- Atalho para criar um botao
    local tText = #tostring(palavras)
    local p = tText + 1 + g
    local o = h + 2
    term.setCursorPos(1,17)
    gui.drawButton(g, h, p, o, palavras, 128, 256)
end

function window(titulo, btn) -- Thanks to Kornichen for the original concept, cria a janela
    X = nil
    y = nil
    term.setTextColor(colors.white)
    term.setBackgroundColor(colors.lightGray)
    term.clear()
    term.setCursorPos(1,1)
    term.setBackgroundColor(colors.cyan)
    linha = 51
    while linha > 0 do
        write(" ")
        linha = linha - 1
    end
    x, y = term.getSize()
    local tamTitulo = #tostring(titulo)
    cursor = x/2
    term.setCursorPos(cursor-tamTitulo/2, 1)
    write(titulo)
    if btn == true then
        gui.clearBuffer()
        gui.setButton(1, 1, " ")
        term.setCursorPos(1,1)
        term.setTextColor(colors.black)
        term.setBackgroundColor(colors.orange)
        write("X")
    end
    term.setBackgroundColor(colors.lightGray)
    term.setTextColor(colors.black)
    term.setCursorPos(2,3)
end

local function desenhaTela()
    term.setCursorPos(1,3)
    term.setBackgroundColor(colors.lightGray)

    term.clearLine()
    term.write("At the moment the turtle ")
    if turtlePowerStatus == false then
        term.write("is stopped.")
    else
        term.write("is minning.")
    end

    if turtleFinished == true then
        term.setCursorPos(1,3)
        term.clearLine()
        term.write("At the moment the turtle has finished.")
    end

    if chests and coals and items ~= nil then
        print("")
        print("")
        term.setCursorPos(1,5)
        term.clearLine(1,5)
        print("It has ".. chests .." chests in the inventory.")
        print("")
        term.setCursorPos(1,7)
        term.clearLine(1,7)
        print("It has ".. coals .." coals in the inventory.")
        print("")
        print("The turtle minned " ..items.. " items.")
    else
        print("")
    end
end

local function rednetRecebe()
    while true do
        local RidTurtle, Rdados, Rchannel = rednet.receive(protocolo)
            term.setCursorPos(1,1)
            if RidTurtle == turtleID then
                turtlePowerStatus = Rdados["pwrStatus"]
                chests = tonumber(Rdados["qChests"])
                coals = tonumber(Rdados["qCoals"])
                items = tonumber(Rdados["qItems"])
                turtleFinished = Rdados["sFinished"]
            end
        sleep(0.5)
    end
end

local function rednetEnvia(mensagem)
    rednet.send(turtleID, mensagem, protocolo)
end


local function configureTurtle()
    print("")
    print("My ID is ".. os.getComputerID())
    print("")
    print("What is the turtle ID?")
    term.write("Turtle ID: ")
    turtleID = tonumber(io.read())
    print("")
    print("Ok!")
    print("Starting up...")
    sleep(1.5)
end

local function tela()
    window("Turtle++ command server " .. versao, false)
    while true do
        desenhaTela()
        sleep(2)
    end
end

local function touch()
    gui.setButton(2, 12, "Start minning", colors.green, colors.lime)
    gui.drawButton(2, 12, 16, 14, "Start minning", colors.green, colors.lime)

    gui.setButton(19, 12, "Stop minnng", colors.red, colors.magenta)
    gui.drawButton(19, 12, 32, 14, "Stop minning", colors.red, colors.magenta)

    btn = gui.getSelection()
    gui.clearBuffer()

    term.setCursorPos(1, 16)

    if btn == 1 then
        term.setBackgroundColor(colors.lightGray)
        print("Start minning...")
        rednetEnvia("tLiga")
        sleep(2)
        term.setCursorPos(1, 16)
        term.clearLine()
    elseif btn == 2 then
        term.setBackgroundColor(colors.lightGray)
        print("Stop minning...")
        rednetEnvia("tDesliga")
        sleep(2)
        term.setCursorPos(1, 16)
        term.clearLine()
    end
    touch()
end

local function telaCmds()
    parallel.waitForAny(tela, touch)
end

local function startup()
    term.clear()
    term.setCursorPos(1,1)
    print("Turtle++ command server ", versao)
    print("") 

    print("Opening the rednet")
    print("Detecting the side of the modem...")

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
        print("Rebooting...")
        sleep(4)
        os.reboot()
    end

    sleep(0.5)
    print("")
    print("I've found one modem at the "..lado)
    rednet.open(lado)

    --Main things
    configureTurtle()
   -- local telaCorountine = corountine.create(telaCmds)
    parallel.waitForAny(rednetRecebe, telaCmds)
end


startup()