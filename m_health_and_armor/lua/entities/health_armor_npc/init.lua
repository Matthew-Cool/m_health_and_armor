AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")

-- initialize the npc
function ENT:Initialize()
    self:SetModel(HEALTHARMOR.npcmodel)
    self:SetHullType(HULL_HUMAN) 
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX) 
	self:CapabilitiesAdd(CAP_ANIMATEDFACE) 
	self:CapabilitiesAdd(CAP_TURN_HEAD)
	self:SetUseType(SIMPLE_USE) 
	self:DropToFloor()
end

function ENT:AcceptInput(Name, Activator, Caller)	
	if Name == "Use" and Caller:IsPlayer() then
		net.Start("Health_Armor_Used_Start")
		net.Send(Caller)
	end
end

-- concommand for saving npcs around a map
concommand.Add("savehealtharmornpc", function(ply)
    if not HEALTHARMOR.savecommandgroup[ply:GetUserGroup()] then
        ply:ChatPrint(HEALTHARMOR_LANG.condonotusecommandtext)
        return
    end
    -- if file was not created then it does it with this
    if not file.Exists("healtharmor/healtharmornpcs.txt", "DATA") then
        file.Write("healtharmor/healtharmornpcs.txt", util.TableToJSON())
    end
    -- saves info from each npc and puts in data
    savedHAnpcs = {}
    for k, hanpc in pairs(ents.FindByClass("health_armor_npc")) do
        savedHAnpcs[k] = {pos = hanpc:GetPos(), ang = hanpc:GetAngles()}
        file.Write("healtharmor/healtharmornpcs.txt", util.TableToJSON(savedHAnpcs, true))
    end
    print(HEALTHARMOR_LANG.connpcssavedtext)
end)

-- concommand for spawning npcs around a map
concommand.Add("spawnhealtharmornpc", function(ply)
    if not HEALTHARMOR.spawncommandgroup[ply:GetUserGroup()] then
        ply:ChatPrint(HEALTHARMOR_LANG.condonotusecommandtext)
        return
    end
    -- if the save data is not found, do this
    if not file.Exists("healtharmor", "DATA") then
        print(HEALTHARMOR_LANG.connodatafoundtext) 
        return
    end 
    -- if there is 1 or more health & armor npc's on the map, then concommand stops
    for k, v in pairs(ents.FindByClass("health_armor_npc")) do
        if k >= 1 then 
            print(HEALTHARMOR_LANG.conwarningspawntext)
        return end
    end
    -- if the save data is found, then do this
    if file.Exists("healtharmor", "DATA") then
    local savedHAnpcs = util.JSONToTable(file.Read("healtharmor/healtharmornpcs.txt", "DATA"))
        if savedHAnpcs then 
            for k, v in pairs(savedHAnpcs) do 
                print(HEALTHARMOR_LANG.conspawntext .. k)
                local hanpc2 = ents.Create("health_armor_npc")
                hanpc2:SetPos(v.pos)
                hanpc2:SetAngles(v.ang)
                hanpc2:Spawn()
            end
        end
    end
end)