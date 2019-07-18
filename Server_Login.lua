-- File created by Tavisco/Oct125
-- On epoch: 1347932985
-- On date: 17 September 2012

term.clear()
term.setCursorPos(1,1)
print("MineUbuntu Server: Senhas")
print("V: 1,1 Alpha")
print(" ")
mon = peripheral.wrap("right")
mon.clear()
mon.setCursorPos(1,1)
mon.setTextScale(2)
mon.write("Senhas:")
mon.write("")
mon.setCursorPos(1,3)
mon.write("Ligado")
local RC = 48
local senha = "Ouct"
function login()
sleep(3)
term.setCursorPos(1,4)
print("Servidor ligado!")
rednet.open("left")
cliID,msg = rednet.receive()
if RC == cliID then
print("Conexao aberta...")
print("Verificando senha...")
if msg == senha then
print("Correto!!!")
rednet.send(cliID, "14")
print("Feito!")
sleep(2)
login()
else
login()
end
else
login()
end
end
login()