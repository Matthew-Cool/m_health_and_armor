net.Receive("Health_Armor_Purchase", function(L, ply)
	local Id = net.ReadInt(16)
	local Item_Data = HEALTHARMOR.Items[Id]
	if HEALTHARMOR.vipdiscount == true and HEALTHARMOR.vipusergroups[ply:GetUserGroup()] then
		ply:addMoney(-Item_Data.price * HEALTHARMOR.vipdiscountamount)
	elseif HEALTHARMOR.cpdiscount == true and ply:isCP() then
		ply:addMoney(-Item_Data.price * HEALTHARMOR.cpdiscountamount)
	else 
		ply:addMoney(-Item_Data.price)
	end

	
	if Item_Data.itemtype == "health" then
		ply:SetHealth(ply:Health() + Item_Data.amount)
		if ply:Health() > HEALTHARMOR.hpmax then
			ply:SetHealth(HEALTHARMOR.hpmax)
		end
	elseif Item_Data.itemtype == "armor" then
		ply:SetArmor(ply:Armor() + Item_Data.amount)
		if ply:Armor() > HEALTHARMOR.armormax then 
			ply:SetArmor(HEALTHARMOR.armormax)
		end
	end
end)