ddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.

include('shared.lua')
function ENT:Initialize()
 
	self:SetModel( "models/props/starwars/weapons/hoth_bomb.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
 
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
    self:SetUseType( SIMPLE_USE )
end
 
function ENT:Use( activator, caller )
    if (self:GetNWBool("canuse") == true) then
        self:SetNWBool("canuse", false)
    if (activator:HasWeapon("defuse_kit")) then
        canuse = false
    timer.Create("Countdown", 20, 1, function()
    activator:PrintMessage(HUD_PRINTTALK, "Du hast zu lange gebraucht. Die Bombe ist explodiert!")
    umsg.Start( "Close", activator )
    umsg.Short( "1" )
    umsg.End()
    end)
	umsg.Start( "DrawTheMenu", activator ) -- starts the creation of the usermessage, names the usermessage "DrawTheMenu" and sets the player to send it to as the player who used the entity.
    umsg.Short( "1" ) -- adds a pointless interger to the usermessage, simply because the last time I tried it wouldn't work with an empty one. ignore this.
    umsg.End()
    util.AddNetworkString( "Damage" )
    util.AddNetworkString( "Print" )
    net.Receive("Damage", function()
    activator:PrintMessage( HUD_PRINTTALK,  "Die Bombe ist explodiert!")
    timer.Stop("Countdown")
    end)
    net.Receive("Print", function()
    activator:PrintMessage( HUD_PRINTTALK,  "Die Bombe wurde entschärft!")
    end)
else
    activator:PrintMessage(HUD_PRINTTALK, "Du hast kein Werkzeug!")
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
endE