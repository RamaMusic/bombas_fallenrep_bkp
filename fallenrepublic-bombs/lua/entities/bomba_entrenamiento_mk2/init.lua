AddCSLuaFile( "cl_init.lua" ) 
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()
	self:SetModel( "models/starwars/syphadias/props/sw_tor/bioware_ea/items/harvesting/slicing/slicing_safeboxes_screen.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
    local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
    self:SetUseType( SIMPLE_USE )
	self:SetHealth(self.BaseHealth)
end
 
function ENT:Use( activator, caller )
    if (self:GetNWBool("canuse") == true) then
        self:SetNWBool("canuse", false)
    if (activator:HasWeapon("fr_alicates")) then
        canuse = false
	self:EmitSound(Sound("bomben/countdown.wav"))
    timer.Create("Countdown", 20, 1, function()
	self:EmitSound(Sound("bomben/countdown.wav"))
    activator:PrintMessage(HUD_PRINTTALK, "Perdiste mucho tiempo.. ¡La bomba explotó!")
	self:EmitSound(Sound("bomben/falsch.wav"))
	timer.Remove("Countdown")
	self:StopSound( "bomben/countdown.wav" )
    umsg.Start( "Close", activator )
    umsg.Short( "1" )
    umsg.End()
    end)
	umsg.Start( "DrawTheMenuMKIIT", activator )
    umsg.Short( "1" )
    umsg.End()
    util.AddNetworkString( "Damage" )
    util.AddNetworkString( "Print" )
    net.Receive("Damage", function()
    activator:PrintMessage( HUD_PRINTTALK,  "¡La bomba explotó!")
	self:EmitSound(Sound("bomben/falsch.wav"))
    timer.Remove("Countdown")
	self:StopSound( "bomben/countdown.wav" )
    end)
    net.Receive("Print", function()
    activator:PrintMessage( HUD_PRINTTALK,  "¡La bomba fue desactivada!")
	self:EmitSound(Sound("bomben/richtig.wav"))
	timer.Remove("Countdown")
	self:StopSound( "bomben/countdown.wav" )
    end)
else
    activator:PrintMessage(HUD_PRINTTALK, "¡No tienes herramientas!!")
end
	if (activator:HasWeapon("weapon_datapad_bomben")) then
		umsg.Start("DrawTheDatapadMenu", activator)
		umsg.Short("1")
		umsg.End()
	end
end
end

function ENT:Think()
    if (self:GetNWBool("canuse") == false) then
        timer.Simple(0.1, function() self:SetNWBool("canuse", true) end)
    end
end

function ENT:OnRemove()
	timer.Remove("Countdown")
	self:StopSound( "bomben/countdown.wav" )
end