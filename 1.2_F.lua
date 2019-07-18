-- File created by Tavisco/Oct125
-- On epoch: 1343573302
-- On date: 29 July 2012

function Liga()
term.setCursorPos(1,1)
term.clear()
print("Bem vindo ao MineUbuntu!")
print("Um Sistema operacional rapido e livre!")
print("Criado Por: Oct125")
print("Versao: 1.0")
sleep(4)
if fs.exists("MineUbuntu.dll") == true then
seleciona()
else
term.clear()
term.setCursorPos(1,1)
print("O seu Drive de Disquete está em baixo do computador?")
print("Se estiver digite exatamente: ok")
print("Caso nao esteja, digite exatamente: Nao")
aa = io.read()
if aa == "ok" then
instala()
else if aa == "Nao" then
print("Por Favor, para que o MineUbuntu funcione corretamente, posicone ou coloque o driver de disquete, em baixo do computador!")
sleep(3)
os.reboot()
else
print("Nao entendi o seu comando!")
print("Reiniciando o pc...")
sleep(3)
os.reboot()
end
end
end
end
function usuario()
term.clear()
term.setCursorPos(1,1)
print("Muita atencao isso sera feito apenas uma vez!!! (nesta instalacao)")
print("Esse PC vai ser usado para abrir portas com uma chave?")
print("Se sim, digite exatamente: sim")
print("Caso contrario digite exatamente: nao")
qq = io.read()
if qq == "sim" then
chave()
elseif qq == "nao" then
pc()
else
print("Nao entendi o seu comando!")
print("Reiniciando o pc...")
sleep(3)
os.reboot()
end
end
function chave()
local fh = io.open("MineUbuntuPorta.dll", "w")
fh:write("Pc-Porteiro")
fh:close()
print("Ok! Vou ser um Pc-Porteiro!")
chave1()
end
function pc()
local fh = io.open("MineUbuntuPc.dll", "w")
fh:write("Pc-computador")
fh:close()
print("Ok! Vou ser um Pc-Computador!")
end
function chave1()
sleep(2)
term.clear()
term.setCursorPos(1,1)
print("MUITA ATENCAO!")
print("Insira o nome da chave! ex: ChaveDaMinhaCasa")
print("Lembre-se que isso é um exemplo, pode ser qualquer coisa!")
ww = io.read()
sleep(2)
term.clear()
term.setCursorPos(1,1)
print("Tem certeza que sua chave de acesso vai se chamar:")
print(ww)
print("Ela nao poderá ser mudada posteriormente!")
print("Se a chave for isso mesmo, entao digite exatamente: sim")
print("Caso contrário, por favor digite exatamente: nao")
ee = io.read()
if ee == "sim" then
print("Ok, sua chave vai ter o nome:")
print(ww)
local fh = io.open("sys", "w")
fh:write(ww)
fh:close()
sleep(3)
term.clear()
term.setCursorPos(1,1)
print("Por Favor, retire o seu disquete com a instalacao do MineUbuntu, e coloque um disquet novo...")
print("Se ja trocou os disquetes, por favor digite exatamente: ok")
rr = io.read()
if rr == "ok" then
textutils.slowWrite("Criando Chave...")
sleep(2)
disk.setLabel("bottom", ww)
print("Chave criada com sucesso!")
sleep(2)
print("Instalaçao concluida!")
print("Reiniciando o pc...")
sleep(2)
os.reboot()
end
elseif ee == "nao" then
print("Retornando...")
sleep(2)
chave1()
end
end
function instala()
term.clear()
term.setCursorPos(1,1)
textutils.slowWrite("Prosseguindo com a instalacao...")
textutils.slowWrite("...")
sleep(4)
fs.copy("disk/startup", "startup")
local fh = io.open("MineUbuntu.dll", "w")
fh:write("MineUbuntu!")
fh:close()
usuario()
end
function seleciona()
if fs.exists("MineUbuntuPorta.dll") == true then
sysPorta()
end
end
function sysPorta()

print("Insira a chave no leitor abaixo...")
os.pullEvent("disk")
nome = disk.getLabel("bottom")
local fh = io.open("sys", "r")
local nome1 = fh:read("*a")
fh:close()
if nome == nome1 then
print("Abrindo Porta...")
rs.setOutput("left", true)
sleep(3)
rs.setOutput("left", false)
os.reboot()
else
print("Chave errada!")
print("Aguarde 15 segundos, e tente novamente!")
sleep(15)
os.reboot()
end
end
Liga()