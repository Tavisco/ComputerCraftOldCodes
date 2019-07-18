-- File created by Tavisco/Oct125
-- On epoch: 1422833255
-- On date: 01 February 2015

function getVersion() 
 return 1.5 
end 

--Declaration of variables 
runButton = {} 
runHeader = {} 
coordButton = {} 
list = {} 
sizeButtons = nil
--End of declaration 

function buttonClick(x, y, a, b) 
 event, clic, x1, y1 = os.pullEvent("mouse_click") 
 if x1 <= a and x1 >= x and y1 <= b and y1 >= y then 
 return "true" 
 else 
 return "false" 
 end 
end 

function buttonWaitClick(x, y, a, b) 
 clicked = "false" 
 while clicked == "false" do 
  event, button, x1, y1 = os.pullEvent("mouse_click") 
  if  x1 <= a and x1 >= x and y1 <= b and y1 >= y then 
   clicked = "true" 
  else 
   clicked = "false" 
  end 
 end 
 return clicked 
end 

function setButton(x, y, text, colorLine, color, clears) 
if clears == nil then
 local clears = "false"
end
if tostring(clears) == "true" then 
 clear() 
end 
if colorLine then 
 colorL = colorLine 
else 
 colorL = colors.white 
end 
if color then 
 colorB = color 
else 
 colorB = colors.black
end
 local sizeText = #tostring(text)
 a = x+1+sizeText
 b = y+2
 table.insert(runButton, x) 
 table.insert(runButton, y) 
 table.insert(runButton, a) 
 table.insert(runButton, b) 
 table.insert(runButton, text) 
 table.insert(runButton, colorL) 
 table.insert(runButton, colorB) 
 table.insert(coordButton, x) 
 table.insert(coordButton, y) 
 table.insert(coordButton, a) 
 table.insert(coordButton, b) 
end 

function drawButton(x, y, a, b, text, colorLine, color) 
if colorLine then 
 colorL = colorLine 
else 
 colorL = colors.white 
end 
if color then 
 colorB = color 
else 
colorB = colors.black 
end 
paintutils.drawLine(x, y, a, y, colorL) --draw the top line 
paintutils.drawLine(x, y, x, b, colorL) --draw the left line 
paintutils.drawLine(a, y, a, b, colorL) --draw the right line 
paintutils.drawLine(x, b, a, b, colorL) --draw the bottom line 
fill(x+1, y+1, a-1, b-1, colorB) 
term.setCursorPos(x+1, y+1)--Print the text in the button 
term.write(text) 
end 

function setHeader(text, colorLine) 
if colorLine then 
 colorL = colorLine 
else 
 colorL = colors.white 
end 
local text = tostring(text)
table.insert(runHeader, text) 
table.insert(runHeader, colorL) 
end 

function drawHeader(text, colorLine) 
if colorLine then 
 colorL = colorLine 
else 
 colorL = colors.white 
end 
xScreen, yScreen = term.getSize() 
paintutils.drawLine(1, 1, xScreen, 1)
term.setCursorPos(1, 1)
write(text)
paintutils.drawLine(1, 2, xScreen, 2, colorL) 
term.setCursorPos(1, 3) 
term.setBackgroundColor(colors.black) 
end 

function clear() 
 term.setCursorPos(1, 1) 
 term.setBackgroundColor(colors.black) 
 term.setTextColor(colors.white) 
 term.clear()
end 

function fill(x, y, a, b, color) 
 term.setBackgroundColor(color) 
 oldY = y 
 for x=x, a do 
  for y=y, b do 
   term.setCursorPos(x,y) 
   print(" ") 
  end 
 end 
end 

function render(reset) 
 clear() 
 local sizeBut = #runButton 
 local sizeHead = #runHeader 
 for x=1, sizeBut, 7 do 
  drawButton(runButton[x], runButton[x+1], runButton[x+2], runButton[x+3], runButton[x+4], runButton[x+5], runButton[x+6]) --Run the functions to redraw it 
 end 
 for x=1, sizeHead, 2 do 
  drawHeader(runHeader[x], runHeader[x+1]) --Run the function to redraw it 
 end 
 if reset == nil then
  local reset = "false"
 end
 if tostring(reset) == "true" then 
 clearBuffer() 
 end 
end 

function clearBuffer() 
  runButton = {} 
  runHeader = {} 
end 

function getSelection() 
 local sizeButton = #coordButton 
 detectButton = {} 
 for x=1, sizeButton, 4 do 
  table.insert(detectButton, function() buttonWaitClick(coordButton[x], coordButton[x+1], coordButton[x+2], coordButton[x+3]) end) 
  end 
  local input = parallel.waitForAny(unpack(detectButton)) 
 coordButton = {}
 return input 
end 

function animation(x, y, a, b, colorL) 
 for g=1, a-x do 
  paintutils.drawLine(x-g, y-g, x+g, y-g, colorL) --draw the top line 
  paintutils.drawLine(x-g, y-g, x-g, y+g, colorL) --draw the left line 
  paintutils.drawLine(x+g, y-g, x+g, y+g, colorL) --draw the right line 
  paintutils.drawLine(x-g, y+g, x+g, y+g, colorL) --draw the bottom line 
  sleep(0.03) 
  render() 
 end 
end

function oldPopUp(title, text, colorLine, color, x, y, xButton1, yButton1, textButton1, xButton2, yButton2, textButton2) 
if colorLine then 
 colorL = colorLine 
else 
 colorL = colors.white 
end 
if color then 
 color = color 
else 
 color = colors.black 
end 
if x and y then 
x = x 
y = y 
else 
x, y = term.getSize() 
x = x/2 
y = y/2 
end 
animation(x, y, colorL) 
if xButton1 and textButton1 then 
 local sizeText1 = #textButton1 
 drawButton(xButton1, yButton1, xButton1+sizeText1, yButton+2, textButton1, colorL, color) 
elseif xButton1 and xButton2 and textButton2 then 
  local sizeText1 = #textButton1 
  local sizeText2 = #textButton2 
  drawButton(xButton1, yButton1, xButton1+sizeText1+2, yButton1+2, textButton1, colorL, color) 
 drawButton(xButton2, yButton2, xButton2+sizeText2+2, yButton2+2, textButton2, colorL, color) 
end 
a = x+4 
b = y+4 
x = x-4 
y = y-4 
fill(x, y, a, b, color) 
a = a+1 
b = b+1 
x = x-1 
y = y-1 
term.setCursorPos(x+1, y+1) 
term.setBackgroundColor(color) 
term.write(title) 
paintutils.drawLine(x, y+2, a, b-8, colorL) --Draw the line for the title 
term.setCursorPos(x+1, y+3) 
term.setBackgroundColor(color) 
term.write(text) 
clickUser = buttonWaitClick(x, y, a, b) 
if clickUser then 
 render() 
return "closed" 
end 
end 

function popUp(title, text, x, y, colorLine, color, textB1, textB2) 
 sizeTitle = #title 
 sizeText = #text 
if textB2 ~= nil then 
 sizeB1 = #textB1 
 sizeB2 = #textB2 
 sizeButtons = sizeB2+sizeB1
 mustButton = "true" 
else 
 sizeButtons = 0
 mustButton = "false" 
end 
 if sizeTitle > sizeText and sizeTitle > sizeButtons then 
  greaterS = sizeTitle 
 elseif sizeText > sizeTitle and sizeText > sizeButtons then
  greaterS = sizeText 
 else
  greaterS = sizeButtons
 end 
 if colorLine then 
 colorL = colorLine 
else 
 colorL = colors.white 
end 
if color then 
 colorB = color 
else 
colorB = colors.black 
end 
local a = x + greaterS + 1 
local b = y + 4 
animation(x, y, a, b, colorL)
paintutils.drawLine(x, y, a, y, colorL) --draw the top line 
paintutils.drawLine(x, y, x, b, colorL) --draw the left line 
paintutils.drawLine(a, y, a, b, colorL) --draw the right line 
paintutils.drawLine(x, b, a, b, colorL) --draw the bottom line 
fill(x+1, y+1, a-1, b-1, colorB) 
term.setCursorPos(x+1, y+1) --Print the title 
term.write(title) 
paintutils.drawLine(x, y+2, a, b-2, colorL) --Draw the line for the title 
term.setBackgroundColor(colorB) 
term.setCursorPos(x+1, y+3) 
term.write(text) --Print the text 
if mustButton == "true" then 
 local midX = math.ceil((a-x)/2)
 term.setCursorPos(midX-1-sizeB1, b) 
 term.write(textB1) 
 term.setCursorPos(midX+1, b) 
 term.write(textB2) 
 clickedB = parallel.waitForAny(function() buttonWaitClick(midX-sizeB1-1, b, midX-1, b) end, function() buttonWaitClick(midX+1, b, midX+sizeB2+1, b) end) 
 return clickedB 
else 
 clickedPopup = buttonWaitClick(x, y, a, b) 
 return clickedPopup 
end 
end