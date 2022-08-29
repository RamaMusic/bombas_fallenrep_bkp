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
    util.BlastDamage(self, activator, self:GetPos(), 300, 100)
    local explode = ents.Create( "env_explosion" ) //creates the explosion
    explode:SetPos( self:GetPos() )
    explode:Spawn() //this actually spawns the explosion
    explode:SetKeyValue( "spawnflags", 144 )
    explode:SetKeyValue( "iMagnitude", "100" ) //the magnitude
    explode:SetKeyValue( "iRadiusOverride", 300 )
    explode:Fire( "Explode", "", 0 )
    explode:EmitSound( "weapon_AWP.Single", 400, 400 ) //the sound for the explosion, and how far away it can be heard
    self:Remove()
    end)
	umsg.Start( "DrawTheMenu", activator )
    umsg.Short( "1" )
    umsg.End()
    util.AddNetworkString( "Damage" )
    util.AddNetworkString( "Print" )
    util.AddNetworkString( "Timer" )
    net.Receive("Damage", function()
local explode = ents.Create( "env_explosion" ) //creates the explosion
    explode:SetPos( self:GetPos() )
    explode:Spawn() //this actually spawns the explosion
    explode:SetKeyValue( "spawnflags", 144 )
    explode:SetKeyValue( "iMagnitude", "100" ) //the magnitude
    explode:SetKeyValue( "iRadiusOverride", 200 )
    explode:Fire( "Explode", "", 0 )
    explode:EmitSound( "weapon_AWP.Single", 400, 400 ) //the sound for the explosion, and how far away it can be heard
    self:Remove()
    end)
    net.Receive("Print", function()
    PrintMessage( HUD_PRINTTALK, "Die Bombe wurde entschärft!")
    self:Remove()
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