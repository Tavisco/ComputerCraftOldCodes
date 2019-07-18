-- File created by Tavisco/Oct125
-- On epoch: 1355093915
-- On date: 09 December 2012

term.clear()
term.setCursorPos(1,1)
print(" __  __ _          _   _ _             _        ")
print("|  \\/  (_)_ _  ___| | | | |__ _  _ _ _| |_ _  _ ")
print("| |\\/| | | ' \\/ -_| |_| | '_ | || | ' |  _| || |")
print("|_|  |_|_|_||_\\___|\\___/|_.__/\\_,_|_||_\\__|\\_,_|")
print("")
print("")
print("Desligando todos os geradores...")
rs.setBundledOutput("back", colors.green+colors.brown+colors.blue+colors.purple) --seleciona as cores
rs.setOutput("back", true) --Liga o output e desliga a energia
print("Todos os geradores foram desligados!")
verde = true
marrom = true
azul = true
roxo = true
while true do
print("Por favor insira o numero da fileira de geradores que gostaria de ligar: ")
print("Digite 0 para abrir a porta...")
fileira = io.read()
if fileira == "1" then
if verde == true then
verde = false
end
if marrom == true then
rs.setBundledOutput("back", colors.brown)
rs.setOutput("back", true)
end
if azul == true then
rs.setBundledOutput("back", colors.blue)
rs.setOutput("back", true)
end
if marrom == true then
rs.setBundledOutput("back", colors.purple)
rs.setOutput("back", true)
end
rs.setBundledOutput("back", colors.green)
rs.setOutput("back", false)
end
if fileira == "0" then
rs.setBundledOutput("back", colors.yellow)
rs.setOutput("back", true)
sleep(3)
rs.setOutput("back", false)
end
end