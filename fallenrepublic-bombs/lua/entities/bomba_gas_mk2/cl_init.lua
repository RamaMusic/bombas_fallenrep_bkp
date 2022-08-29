include('shared.lua')

function ENT:Draw()
    self:DrawModel()
end

function ENT:IsTranslucent()
	return true
end

function DrawTheMenuMKIIB()
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
frame:SetTitle("Desactivación de la bomba")
frame.Paint = function(self, w, h)
	draw.RoundedBox(0,0,0,w, h, Color(0,0,0,255))
	draw.RoundedBox( 0, 2, 2, w-4, h-4, Color(  102,102,102, 255 ))	
end

local wire1 = vgui.Create("DButton" , frame)
wire1:SetSize(30, 650)
wire1:SetPos(350, 50)
wire1:SetText("1")
local wire2 = vgui.Create("DButton" , frame)
wire2:SetSize(30, 650)
wire2:SetPos(450, 50)
wire2:SetText("2")
local wire3 = vgui.Create("DButton" , frame)
wire3:SetSize(30, 650)
wire3:SetPos(550, 50)
wire3:SetText("3")
local wire4 = vgui.Create("DButton" , frame)
wire4:SetSize(30, 650)
wire4:SetPos(650, 50)
wire4:SetText("4")
local Number = vgui.Create("DButton", frame)
Number:SetSize(200,100)
Number:SetPos(750,200)
Number:SetText("Desarmar por código")
local Numberbox = vgui.Create("DComboBox", frame)
Numberbox:SetSize(200,50)
Numberbox:SetPos(750,300)
Numberbox:SetValue("Seleccionar código")
Numberbox:AddChoice( "00101100" )
Numberbox:AddChoice( "10100011" )
Numberbox:AddChoice( "00000100" )
Numberbox:AddChoice( "10001111" )
Numberbox:AddChoice( "01011110" )
Numberbox:AddChoice( "10000000" )
Numberbox:AddChoice( "01010101" )
Numberbox:AddChoice( "11010001" )

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
if (random1 == 3 and random2 == 3 or random1 == 3 and random3 == 3 or random1 == 3 and random4 == 3 or random2 == 3 and random3 == 3 or random2 == 3 and random4 == 3 or random3 == 3 and random4 == 3) then
  wire2.DoClick = function()
      phase1 = true;
    end
    wire3.DoClick = function()
       frame:Close()
       net.Start("Damage")
       net.SendToServer()
       frame:Close()
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
    if (value == "11010001") then
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
usermessage.Hook( "DrawTheMenuMKIIB", DrawTheMenuMKIIB )

function DrawTheDatapadMenu()
		local frame = vgui.Create( "DFrame" )
		frame:SetSize( ScrW() * 0.26, ScrH() *0.5)
		frame:SetPos( 50, 50 )	
		frame:MakePopup()
		frame:SetTitle("Panel de desactivación de la bomba")														-- Titel
		frame.Paint = function(self, w, h)
			draw.RoundedBox(0,0,0,w, h, Color(0,0,0,255))
			draw.RoundedBox( 0, 2, 2, w-4, h-4, Color(  25,  25, 112, 255 ))
		end
		local TextEntry = vgui.Create( "DTextEntry", frame )									-- Textfeld erstellen
		TextEntry:SetPos( 25, 50 )
		TextEntry:SetSize( 450 , 125 )
		TextEntry:SetText("Esta área solo está destinada al BSQ. Las diversas bombas y las posibles situaciones en las que desea desactivar una bomba se enumeran aquí.")			
		TextEntry:SetMultiline(true)
		local DermaListView = vgui.Create("DListView")											-- Spieler liste anzeigen
		DermaListView:SetParent(frame)
		DermaListView:SetPos(25, 200)
		DermaListView:SetSize(450, 110)
		DermaListView:SetMultiSelect(false)
		DermaListView:AddColumn("Situación")													-- Spalte mit Situaciónen
		DermaListView:AddColumn("Cable")														-- Spalte mit Cable zum anklicken
		DermaListView:AddLine( "Si hay más de 1 cable azul", "2." )
		DermaListView:AddLine( "1. Cable Amarillo", "4." )
		DermaListView:AddLine( "4. Cable Negro", "3." )
		DermaListView:AddLine( "1er y 4to cable rojo", "2." )
		DermaListView:AddLine( "Ninguna de las anteriores", "4." )
		
		local DermaListView = vgui.Create("DListView")											-- Liste anzeigen
		DermaListView:SetParent(frame)
		DermaListView:SetPos(25, 330)
		DermaListView:SetSize(450, 110)
		DermaListView:SetMultiSelect(false)
		DermaListView:AddColumn("Bomba")													-- Spalte mit Namen der Bombe
		DermaListView:AddColumn("Código")													-- Spalte für den Code
		DermaListView:AddLine( "Bomba Grande MK2", "10100011" )
		DermaListView:AddLine( "Bomba mediana MK2", "10000000" )
		DermaListView:AddLine( "Bomba pequeña MK2", "01010101" )
		DermaListView:AddLine( "Bomba de entrenamiento MK2", "00000100" )
		DermaListView:AddLine("Bomba de gas MK2", "11010001")
end
usermessage.Hook("DrawTheDatapadMenu", DrawTheDatapadMenu)