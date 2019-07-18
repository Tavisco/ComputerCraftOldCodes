-- File created by Tavisco/Oct125
-- On epoch: 1343958944
-- On date: 02 August 2012

function Liga()
term.setCursorPos(1,1)
term.clear()
print("Bem vindo ao MineUbuntu!")
print("Um Sistema operacional rapido e livre!")
print("Criado Por: Oct125")
print("Versao: 1.3 B")
sleep(4)
if fs.exists("MineUbuntu.dll") == true then
seleciona()
else
term.clear()
term.setCursorPos(1,1)
print("O seu Drive de Disquete esta em baixo do computador?")
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
print("Digite o numero da funcao que este PC ira desempenhar:")
print("1- Abrir portas com uma chave")
print("2- Ser um pc normal")
print("3- Cuidar da iluminacao de uma sala ou casa")
print("Para sair da instalacao digite exatamente: sair")
qq = io.read()
if qq == "1" then
chave()
elseif qq == "2" then
pc()
elseif qq == "3" then
ilumina()
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
function ilumina()
local fh = io.open("MineUbuntuLuz.dll", "w")
fh:write("Pc-Controla-Luz")
fh:close()
print("Ok! Vou ser um Pc-Controla-Luz!")
ilumina2()
end
function ilumina2()
term.clear()
term.setCursorPos(1,1)
print("Por favor, cabeie usando Allow-Wires, ou Insulated-Wires, do Pc ate a(as) lampada(as) que funcionam com redstone. Lembre-se: A lampada so ira ligar se houver contato com um ALLOW-WIRE.")
print("Digite o numero, de qual lado do computador o fio esta tocando:")
print("1- Em cima do PC")
print("2- Ao lado esquerdo do PC")
print("3- Ao lado direito do PC")
print("4- Em baixo do PC")
print("5- Atras do PC")
print("6- Na frente do PC")
pp = io.read()
if pp == "1" then
local lado = "Top"
elseif pp == "2" then
local lado = "left"
elseif pp == "3" then
local lado = "right"
elseif pp == "4" then
local lado = "bottom"
elseif pp == "5" then
local lado = "back"
elseif pp == "6" then
local lado = "front"
else
print("Nao intendi o seu comando...")
print("Aguarde alguns segundos e digite novamente...")
sleep(2)
ilumina2()
end
--local fh = io.open("MineUbuntuLado.dll", "w")
--fh:write(lado)
--fh:close()
print(lado)
end
function chave1()
sleep(2)
term.clear()
term.setCursorPos(1,1)
print("MUITA ATENCAO!")
print("Insira o nome da chave! ex: ChaveDaMinhaCasa")
print("Lembre-se que isso e' um exemplo, pode ser qualquer coisa!")
ww = io.read()
sleep(2)
term.clear()
term.setCursorPos(1,1)
print("Tem certeza que sua chave de acesso vai se chamar:")
print(ww)
print("Ela nao podera ser mudada posteriormente!")
print("Se a chave for isso mesmo, entao digite exatamente: sim")
print("Caso contrÃ¡rio, por favor digite exatamente: nao")
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
print("Por Favor, retire o seu disquete com a instalacao do MineUbuntu, e coloque um disquete novo...")
print("Se ja trocou os disquetes, por favor digite exatamente: ok")
rr = io.read()
if rr == "ok" then
textutils.slowWrite("Criando Chave...")
sleep(2)
disk.setLabel("bottom", ww)
print("Chave criada com sucesso!")
sleep(2)
print("Instalacao concluida!")
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
disk.eject("bottom")
print("Chave invÃ¡lida ejetada!")
print("Aguarde 15 segundos, e tente novamente!")
sleep(15)
os.reboot()
end
end
Liga()