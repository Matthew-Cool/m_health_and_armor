AddCSLuaFile("shared.lua")
AddCSLuaFile("init.lua")
include("shared.lua")
include("main/fonts.lua")

function ENT:Draw()
    self:DrawModel()
    local ang = self:GetAngles()
    local plyang = LocalPlayer():EyeAngles()
    
    -- Draws the npc overhead.
	ang:RotateAroundAxis(ang:Forward(), 90)
	ang:RotateAroundAxis(ang:Right(), -90)
    if (LocalPlayer():GetPos():Distance(self:GetPos()) < HEALTHARMOR.npcoverheadrange) then
	    cam.Start3D2D(self:GetPos() + self:GetUp() * 76, Angle(0, plyang.y - 90, 90), .1)
            draw.RoundedBox(40, -90, -20, 180, 40, Color(30, 30, 30, 255))
            draw.RoundedBox(40, -90, -20, 180, 40, Color(30, 30, 30, 255))
            draw.SimpleTextOutlined(HEALTHARMOR.npcoverheadtext, "healtharmor_text_5", 0, 0, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0, Color(0,0,0))
        cam.End3D2D()
    end
end
