-- File created by Tavisco/Oct125
-- On epoch: 1350859845
-- On date: 21 October 2012

function Liga()
part = "1"
term.clear()
term.setCursorPos(1,2)
print(" __  __ _          _   _ _             _        ")
print("|  \\/  (_)_ _  ___| | | | |__ _  _ _ _| |_ _  _ ")
print("| |\\/| | | ' \\/ -_| |_| | '_ | || | ' |  _| || |")
print("|_|  |_|_|_||_\\___|\\___/|_.__/\\_,_|_||_\\__|\\_,_|")
term.setCursorPos(1,16)
print("Um Sistema operacional rapido e livre!")
print("Criado Por: Oct125")
print("Versao: 1.5 Final")
sleep(4)
if fs.exists(".mUbuntu/MineUbuntu.cmu") == true then
seleciona()
else
term.clear()
term.setCursorPos(1,1)
print("O seu Drive de Disquete esta em baixo do computador?")
print("Se estiver digite exatamente: ok")
print("Caso nao esteja, digite exatamente: Nao")
aa = io.read()
if aa == "ok" then
funcao()
else if aa == "Nao" then
print("Por Favor, para que o MineUbuntu funcione corretamente, posicione ou coloque o driver de disquete, em baixo do computador!")
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
function seleciona()
if fs.exists(".mUbuntu/MineUbuntuPorta.cmu") == true then
sysPorta()
elseif fs.exists(".mUbuntu/MineUbuntuPc.cmu") == true then
sysPC()
else
print("A funcao instalada nao esta completa, ou foi corrompida durante a instalacao!")
end
end
function funcao()
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
fs.makeDir(".mUbuntu")
local fh = io.open(".mUbuntu/MineUbuntuPorta.cmu", "w")
fh:write("Pc-Porteiro")
fh:close()
print("Ok! Vou ser um Pc-Porteiro!")
chave1()
end
function pc()
fs.makeDir(".mUbuntu")
local fh = io.open(".mUbuntu/MineUbuntuPc.cmu", "w")
fh:write("Pc-computador")
fh:close()
print("Ok! Vou ser um Pc-Computador!")
sleep(2)
PC1()
end
function ilumina()
fs.makeDir(".mUbuntu")
local fh = io.open(".mUbuntu/MineUbuntuLuz.cmu", "w")
fh:write("Pc-Controla-Luz")
fh:close()
print("Ok! Vou ser um Pc-Controla-Luz!")
ilumina1()
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
print("Tem certeza que sua chave de acesso vai se chamar: ")
write(ww)
print("")
print("Ela nao podera ser mudada posteriormente!")
print("Se a chave for isso mesmo, entao digite exatamente: sim")
print("Caso contrario, por favor digite exatamente: nao")
ee = io.read()
if ee == "sim" then
print("Ok, sua chave vai ter o nome:")
print(ww)
fs.makeDir(".mUbuntu")
local fh = io.open(".mUbuntu/chave.cmu", "w")
fh:write(ww)
fh:close()
sleep(3)
term.clear()
term.setCursorPos(1,1)
print("Por Favor, coloque um disquete novo no drive...")
print("Se ja colocou, por favor digite exatamente: ok")
rr = io.read()
if rr == "ok" then
textutils.slowWrite("Criando Chave...")
sleep(2)
disk.setLabel("bottom", ww)
print("Chave criada com sucesso!")
sleep(2)
final()
end
elseif ee == "nao" then
print("Retornando...")
sleep(2)
chave1()
end
end
function PC1()
term.clear()
term.setCursorPos(1,1)
print("Você gostaria de travar esse pc com uma senha?")
print("Responda: Sim ou Nao")
write(">")
resp = io.read()
if resp == "Sim" then
print("Ok")
print("")
print("Por favor, insira o login:")
write(">")
login = io.read()
print("")
write("Seu login é: ")
write(login)
write(" certo?")
print("")
print("Responda s ou n")
resp1 = io.read()
if resp1 == "s" then
print("Ok!")
print("")
print("Por favor, insira a senha:")
write(">")
senha = io.read()
print("")
write("Sua senha é: ")
write(senha)
write(" correto? [s/n]  ")
resp2 = io.read()
if resp2 == "s" then
print("")
write("Criando usuário")
sleep(1)
write(".")
fs.makeDir(".mUbuntu")
local fh = io.open(".mUbuntu/usr.cmu", "w")
fh:write(login)
fh:close()
sleep(1)
write(".")
local fh = io.open(".mUbuntu/senha.cmu", "w")
fh:write(senha)
fh:close()
sleep(1)
write(".")
sleep(1)
write(".")
sleep(1)
print("")
print("Usuário criado com sucesso!")
final()
elseif resp2 == "n" then
print("Ok, voltando...")
sleep(3)
PC1()
else
print("Nao entendi o seu comando, voltando...")
sleep(3)
PC1()
end
elseif resp1 == "n" then
print("Voltando...")
sleep(3)
PC1()
else
print("Nao entendi o seu comando! Responde exatamente: s ou exatamente n")
print("Voltando...")
sleep(3)
PC1()
end
elseif resp == "Nao" then
print("Ok")
else
print("Nao entendi o seu comando! Responde exatamente: Sim ou exatamente Nao")
print("Voltando...")
sleep(3)
PC1()
end
end
function ilumina1()
term.clear()
term.setCursorPos(1,1)
print("Por favor, cabeie usando Allow-Wires, ou REDSTONE, ou Insulated-Wires, do Pc ate a(as) lampada(as) que funcionam com redstone. Lembre-se: A lampada so' ira ligar se houver contato com um ALLOW-WIRE ou REDSTONE.")
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
elseif pp =="6" then
local lado = "front"
else
print("Nao intendi o seu comando...")
print("Aguarde alguns segundos e digite novamente...")
sleep(2)
ilumina2()
end
fs.makeDir(".mUbuntu")
local fh = io.open(".mUbuntu/MineUbuntuLado.cmu", "w")
fh:write(lado)
fh:close()
print(lado)
end
function sysPorta()
term.setCursorPos(1,15)
print("                                               ")
print("                                               ")
print("Insira a chave no leitor abaixo...")
os.pullEvent("disk")
nome = disk.getLabel("bottom")
local fh = io.open(".mUbuntu/chave.cmu", "r")
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
print("Chave invalida ejetada!")
print("Aguarde 15 segundos, e tente novamente!")
sleep(15)
os.reboot()
end
end
function sysPC()
if part == "1" then
pcP1()
opc = "1"
event, param1 = os.pullEvent()
if event == "key" and param1 == 208 then -- APERTOU SETA PARA BAIXO
pcP2()
elseif event == "key" and param1 == 28 then -- APERTOU ENTER
sysPC1()
else
sysPC()
end
elseif part == "2" then
opc = "2"
event, param1 = os.pullEvent()
if event == "key" and param1 == 200 then -- APERTOU SETA PARA CIMA
part = "1"
sysPC()
elseif event == "key" and param1 == 28 then -- APERTOU ENTER
print("")
print("DESLIGANDO COMPUTADOR...")
sleep(3)
os.shutdown()
else
sysPC()
end
end
end
function pcP1()
term.clear()
term.setCursorPos(1,2)
print(" __  __ _          _   _ _             _        ")
print("|  \\/  (_)_ _  ___| | | | |__ _  _ _ _| |_ _  _ ")
print("| |\\/| | | ' \\/ -_| |_| | '_ | || | ' |  _| || |")
print("|_|  |_|_|_||_\\___|\\___/|_.__/\\_,_|_||_\\__|\\_,_|")
term.setCursorPos(1,6)
print("                 _______________")
print("                /   Selecione:  \\ ")
print("                |               |")
print("                |               |")
print("                |               |")
print("                |               |")
print("                |   _           |")
print("                |  |*| Logar    |")
print("                |   _           |")
print("                |  | | Desligar |")
print("                \\_______________/")
part = "1"
end
function pcP2()
term.clear()
term.setCursorPos(1,2)
print(" __  __ _          _   _ _             _        ")
print("|  \\/  (_)_ _  ___| | | | |__ _  _ _ _| |_ _  _ ")
print("| |\\/| | | ' \\/ -_| |_| | '_ | || | ' |  _| || |")
print("|_|  |_|_|_||_\\___|\\___/|_.__/\\_,_|_||_\\__|\\_,_|")
term.setCursorPos(1,6)
print("                 _______________")
print("                /   Selecione:  \\ ")
print("                |               |")
print("                |               |")
print("                |               |")
print("                |               |")
print("                |   _           |")
print("                |  | | Logar    |")
print("                |   _           |")
print("                |  |*| Desligar |")
print("                \\_______________/")
part = "2"
sysPC()
end
function sysPC1()
term.clear()
term.setCursorPos(1,2)
print(" __  __ _          _   _ _             _        ")
print("|  \\/  (_)_ _  ___| | | | |__ _  _ _ _| |_ _  _ ")
print("| |\\/| | | ' \\/ -_| |_| | '_ | || | ' |  _| || |")
print("|_|  |_|_|_||_\\___|\\___/|_.__/\\_,_|_||_\\__|\\_,_|")
term.setCursorPos(1,8)
print("Por favor logue-se:")
print("")
write("Login: ")
local lLogin = io.read()
print("")
write("Senha: ")
local lSenha = read("*")
print("")
print("")
print("Verificando login, aguarde...")
local fh = io.open(".mUbuntu/usr.cmu", "r")
local loginC = fh:read("*a")
fh:close()
local fh = io.open(".mUbuntu/senha.cmu", "r")
local senhaC = fh:read("*a")
fh:close()
if lLogin == loginC and lSenha == senhaC then
term.clear()
term.setCursorPos(1,2)
print(" __  __ _          _   _ _             _        ")
print("|  \\/  (_)_ _  ___| | | | |__ _  _ _ _| |_ _  _ ")
print("| |\\/| | | ' \\/ -_| |_| | '_ | || | ' |  _| || |")
print("|_|  |_|_|_||_\\___|\\___/|_.__/\\_,_|_||_\\__|\\_,_|")
print("")
print(lLogin .. ", bem vindo ao MineUbuntu!")
print("")
else
term.clear()
term.setCursorPos(1,2)
print(" __  __ _          _   _ _             _        ")
print("|  \\/  (_)_ _  ___| | | | |__ _  _ _ _| |_ _  _ ")
print("| |\\/| | | ' \\/ -_| |_| | '_ | || | ' |  _| || |")
print("|_|  |_|_|_||_\\___|\\___/|_.__/\\_,_|_||_\\__|\\_,_|")
term.setCursorPos(1,8)
print("Desculpe nome ou senha incorreta!")
print("Desligando o PC...")
sleep(3)
os.shutdown()
end
end
function final()
sleep(3)
term.clear()
term.setCursorPos(1,1)
local fh = io.open(".mUbuntu/MineUbuntu.cmu", "w")
fh:write("MineUbuntu!")
fh:close()
print("Instalacao concluida!!!")
print("Sistema instalado com sucesso")
sleep(0.5)
print("Reiniciando PC")
sleep(3)
os.reboot()
end
os.pullEvent = os.pullEventRaw -- Desabilitar para testes....
Liga()