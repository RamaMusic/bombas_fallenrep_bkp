ddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.

include('shared.lua')
function ENT:Initialize()
 
	self:SetModel( "models/cire992/prop2/gethbomb01.mdl" )
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
    canuse = false;
    timer.Create("Countdown", 20, 1, function()
    util.BlastDamage(self, activator, self:GetPos(), 900, 800)
    local explode = ents.Create( "env_explosion" ) //creates the explosion
    explode:SetPos( self:GetPos() )
    explode:Spawn() //this actually spawns the explosion
    explode:SetKeyValue( "spawnflags", 144 )
    explode:SetKeyValue( "iMagnitude", "800" ) //the magnitude
    explode:SetKeyValue( "iRadiusOverride", 900 )
    explode:Fire( "Explode", "", 0 )
    explode:EmitSound( "weapon_AWP.Single", 400, 400 )
    self:Remove()
    end)
	umsg.Start( "DrawTheMenu", activator ) -- starts the creation of the usermessage, names the usermessage "DrawTheMenu" and sets the player to send it to as the player who used the entity.
    umsg.Short( "1" ) -- adds a pointless interger to the usermessage, simply because the last time I tried it wouldn't work with an empty one. ignore this.
    umsg.End()
    util.AddNetworkString( "Damage" )
    util.AddNetworkString( "Print" )
    net.Receive("Damage", function()
    local explode = ents.Create( "env_explosion" ) //creates the explosion
    explode:SetPos( self:GetPos() )
    explode:Spawn() //this actually spawns the explosion
    explode:SetKeyValue( "spawnflags", 144 )
    explode:SetKeyValue( "iMagnitude", "800" ) //the magnitude
    explode:SetKeyValue( "iRadiusOverride", 900 )
    explode:Fire( "Explode", "", 0 )
    explode:EmitSound( "weapon_AWP.Single", 400, 400 )
    self:Remove()
    end)
    net.Receive("Print", function()
    PrintMessage( HUD_PRINTTALK,  "Die Bombe wurde entschärft!")
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