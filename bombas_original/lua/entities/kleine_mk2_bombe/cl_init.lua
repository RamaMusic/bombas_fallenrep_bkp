nclude('shared.lua')

function ENT:Draw()
    -- self.BaseClass.Draw(self) -- Overrides Draw
    self:DrawModel() -- Draws Model Client Side
 
end
function DrawTheMenuMKIIS()-- the function to call when the usermessage is received-- your derma stuff goes in this function..local DFrame1 = vgui.Create('DFrame')
local random1 = math.random(1, 4)
local random2 = math.random(1, 4)
local random3 = math.random(1, 4)
local random4 = math.random(1, 4)
local Serialnumber = 0;
local phase1 = false;
imhere = true
frame = vgui.Create("DFrame")
frame:SetSize(1000, 720)
frame:Center()
frame:SetVisible(true)
frame:SetDraggable( false )
frame:ShowCloseButton( true )
frame:MakePopup()

local wire1 = vgui.Create("DButton" , frame)
wire1:SetSize(30, 650)
wire1:SetPos(350, 50)
wire1:SetText("")
local wire2 = vgui.Create("DButton" , frame)
wire2:SetSize(30, 650)
wire2:SetPos(450, 50)
wire2:SetText("")
local wire3 = vgui.Create("DButton" , frame)
wire3:SetSize(30, 650)
wire3:SetPos(550, 50)
wire3:SetText("")
local wire4 = vgui.Create("DButton" , frame)
wire4:SetSize(30, 650)
wire4:SetPos(650, 50)
wire4:SetText("")
local Number = vgui.Create("DButton", frame)
Number:SetSize(200,100)
Number:SetPos(750,200)
Number:SetText("Entschärfungs-Sicherheit")
local Numberbox = vgui.Create("DComboBox", frame)
Numberbox:SetSize(200,50)
Numberbox:SetPos(750,300)
Numberbox:SetValue("Entschärfungs-Code")
Numberbox:AddChoice( "00101100" )
Numberbox:AddChoice( "10100011" )
Numberbox:AddChoice( "00000100" )
Numberbox:AddChoice( "10001111" )
Numberbox:AddChoice( "01011110" )
Numberbox:AddChoice( "10000000" )
Numberbox:AddChoice( "01010101" )

//color coding first wire
if (random1 == 1) then
  wire1.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 0, 0, 250 ) )
end
end
if (random1 == 2) then
  wire1.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 255, 0, 250 ) )
end
end
if (random1 == 3) then
  wire1.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 255, 250 ) )
end
end
if (random1 == 4) then
  wire1.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 250 ) )
end
end
//color coding second wire
if (random2 == 1) then
  wire2.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 0, 0, 250 ) )
end
end
if (random2 == 2) then
  wire2.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 255, 0, 250 ) )
end
end
if (random2 == 3) then
  wire2.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 255, 250 ) )
end
end
if (random2 == 4) then
  wire2.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 250 ) )
end
end
//color coding third wire
if (random3 == 1) then
  wire3.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 0, 0, 250 ) )
end
end
if (random3 == 2) then
  wire3.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 255, 0, 250 ) )
end
end
if (random3 == 3) then
  wire3.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 255, 250 ) )
end
end
if (random3 == 4) then
  wire3.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 250 ) )
end
end
//color coding fourth wire
if (random4 == 1) then
  wire4.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 0, 0, 250 ) )
end
end
if (random4 == 2) then
  wire4.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 255, 0, 250 ) )
end
end
if (random4 == 3) then
  wire4.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 255, 250 ) )
end
end
if (random4 == 4) then
  wire4.Paint = function( self, w, h )
  draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 250 ) )
end
end
// start of the functions
if (random1 == 3 and random2 == 3 or random1 == 3 and random3 == 3 or random1 == 3 and random4 == 3 or random2 == 3 and random3 == 3 or random2 == 3 and random4 == 3 or random3 == 3 and random4 == 3) then
  wire2.DoClick = function()
      phase1 = true;
    end
    wire3.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
    wire1.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
    wire4.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
elseif (random4 == 4) then
  wire1.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
    wire2.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
    wire3.DoClick = function()
      phase1 = true;
    end
    wire4.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
elseif (random1 == 4) then
    wire3.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
    wire2.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
    wire4.DoClick = function()
      phase1 = true;
    end
    wire1.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
elseif(random1 == 1 && random4 == 1) then
  wire3.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
    wire2.DoClick = function()
      phase1 = true;
    end
    wire1.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
    wire4.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
else
    wire3.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
    wire4.DoClick = function()
      phase1 = true;
    end
    wire1.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
    wire2.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
  end
  Numberbox.OnSelect = function( self, index, value )
    if (value == "01010101") then
      if (phase1 == true) then
          frame:Close()
          net.Start("Print")
          net.SendToServer()
      end
    else
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
    end
end
end
usermessage.Hook( "DrawTheMenuMKIIS", DrawTheMenuMKIIS )A