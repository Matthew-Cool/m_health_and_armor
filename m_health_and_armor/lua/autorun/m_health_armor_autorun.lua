
if SERVER then
    
    include("config/config.lua")
    include("config/lang/" .. HEALTHARMOR.lang .. ".lua")

    print(HEALTHARMOR_LANG.consvload1)

    include("main/net.lua")
    include("main/buy.lua")

    AddCSLuaFile("config/config.lua")
    AddCSLuaFile("config/lang/" .. HEALTHARMOR.lang .. ".lua")
    AddCSLuaFile("main/fonts.lua")
    AddCSLuaFile("main/menu.lua")

    if HEALTHARMOR.content == true then
        resource.AddWorkshop("2469230580")
    end
    
    -- spawns the npcs in after server restart if concommand is entered
    hook.Add("InitPostEntity", "savedhealtharmor_npcs", function()
        -- if the concommand is not runned and DATA file is not alive, then no NPC's will be spawned
        if not file.Exists("healtharmor/healtharmornpcs.txt", "DATA") then
            print(HEALTHARMOR_LANG.conspawnfailtext)
        else
            local saved = util.JSONToTable(file.Read("healtharmor/healtharmornpcs.txt", "DATA"))

            -- spawns the npcs in below
            for k, v in pairs(saved) do 
                print(HEALTHARMOR_LANG.conspawntext .. k)
                local npc = ents.Create("health_armor_npc")
                npc:SetPos(v.pos)
                npc:SetAngles(v.ang)
                npc:Spawn()
            end
        end
    end)


    print(HEALTHARMOR_LANG.consvload2)
end

if CLIENT then

    include("config/config.lua")
    include("config/lang/" .. HEALTHARMOR.lang .. ".lua")

    print(HEALTHARMOR_LANG.conclload1)

    include("main/fonts.lua")
    include("main/menu.lua")
    print(HEALTHARMOR_LANG.conclload2)

end