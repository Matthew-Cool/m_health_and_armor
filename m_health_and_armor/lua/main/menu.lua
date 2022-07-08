function HEALTHARMOR:Open()
    local ply = LocalPlayer()
    local scrw, scrh = ScrW(), ScrH()
    ply:EmitSound(HEALTHARMOR.welcomesound)
    HEALTHARMOR.Menu = vgui.Create("DFrame")
    HEALTHARMOR.Menu:SetSize(scrw * .3, scrh * .5)
    local frameH = HEALTHARMOR.Menu:GetTall()
    local frameW = HEALTHARMOR.Menu:GetWide()
    local yspace = HEALTHARMOR.Menu:GetTall() * .01
    HEALTHARMOR.Menu:SetPos(scrw / 2 - (frameW / 2), scrh)
    HEALTHARMOR.Menu:SetDraggable(false)
    HEALTHARMOR.Menu:SetTitle("")
    HEALTHARMOR.Menu:MakePopup(true)
    HEALTHARMOR.Menu:SetMouseInputEnabled(true)
    HEALTHARMOR.Menu:ShowCloseButton(false)
    HEALTHARMOR.Menu.Paint = function(Me, Width, Height)
        draw.RoundedBox(HEALTHARMOR.roundboxamount, 0, 0, Width, Height, HEALTHARMOR.mainbackgroundcolor)
        draw.RoundedBoxEx(HEALTHARMOR.roundboxamount, 0, 0, Width, Height * .05, HEALTHARMOR.maintopbarcolor, true, true, false, false)
        draw.SimpleText(HEALTHARMOR.maintext, "healtharmor_text_1", frameW / 2, frameH * .025, HEALTHARMOR.maintoptextcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
    HEALTHARMOR.Menu:MoveTo(scrw / 2 - (frameW / 2), scrh / 2 - (frameH / 2), 1, 0, -1)

    local Scroll_Bar = vgui.Create("DScrollPanel", HEALTHARMOR.Menu)
    Scroll_Bar:SetPos(0, frameH * .06)
    Scroll_Bar:SetSize(frameW, frameH * .93)

    local Scroll_Bar_Paint = Scroll_Bar:GetVBar()
    Scroll_Bar_Paint:SetHideButtons(true)
    function Scroll_Bar_Paint.btnGrip:Paint(Width, Height)
        draw.RoundedBox(HEALTHARMOR.roundboxamount, 0, 0, Width * .5, Height, HEALTHARMOR.scrollbarcolor)
    end
    function Scroll_Bar_Paint:Paint(Width, Height) 
        draw.RoundedBox(HEALTHARMOR.roundboxamount, 0, 0, Width * .5, Height, HEALTHARMOR.scrollbaroutlinecolor)
    end

    local closescrw, closescrh = frameW * .039, frameW * .039
    local Close_Button = vgui.Create("DImageButton", HEALTHARMOR.Menu)
    Close_Button:SetSize(closescrw, closescrh)
    Close_Button:SetImage("closebuttonicon/" .. HEALTHARMOR.closebutton .. "_close_button.png")
    Close_Button:SetPos(frameW - closescrw - (yspace / 3), (yspace + yspace) * .3) 

    Close_Button.DoClick = function()
        ply:EmitSound(HEALTHARMOR.acceptsound)
        HEALTHARMOR.Menu:SetMouseInputEnabled(false)
        HEALTHARMOR.Menu:MoveTo(scrw / 2 - (frameW / 2), scrh, .3, 0, -1, function()
            HEALTHARMOR.Menu:Close()
        end)
    end   

    for k, item in pairs(HEALTHARMOR.Items) do 
        local Item_Panel = vgui.Create("DPanel", Scroll_Bar)
        Item_Panel:DockMargin(yspace, 0, yspace, yspace)
        Item_Panel:Dock(TOP)
        Item_Panel:SetTall(frameH * .147)
        Item_Panel.Paint = function(Me, Width, Height)
            draw.RoundedBox(HEALTHARMOR.roundboxamount, 0, 0, Width, Height, HEALTHARMOR.itempanelmaincolor)
            draw.RoundedBox(HEALTHARMOR.roundboxamount, Width * .01, Height * .1, Height * .85, Height * .8, HEALTHARMOR.itempaneliconboxcolor)
            if item.desc == true then
                draw.SimpleText(item.name, "healtharmor_text_1", Width * .14, Height * .3, HEALTHARMOR.itempaneltitletextcolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                draw.SimpleText(item.desctext, "healtharmor_text_2", Width * .14, Height * .7, HEALTHARMOR.itempaneldesccolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            else
                draw.SimpleText(item.name, "healtharmor_text_1", Width * .14, Height / 2, HEALTHARMOR.itempaneltitletextcolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
        end

        local Item_Panel_W, Item_Panel_H = Item_Panel:GetWide(), Item_Panel:GetTall()
        local Item_Buy_Button = vgui.Create("DButton", Item_Panel)
        Item_Buy_Button:DockMargin(0, yspace * 4, yspace, yspace * 4)
        Item_Buy_Button:Dock(RIGHT)
        Item_Buy_Button:SetText("")
        Item_Buy_Button:SetSize(Item_Panel:GetWide() * 1.2, Item_Panel:GetTall() * .5)
        Item_Buy_Button.Paint = function(Me, Width, Height)
            if Me:IsHovered() then
                if item.itemtype == "health" and ply:Health() == HEALTHARMOR.hpmax or item.itemtype == "armor" and ply:Armor() == HEALTHARMOR.armormax then
                    draw.RoundedBox(HEALTHARMOR.roundboxamount, 0, 0, Width, Height, HEALTHARMOR.maxboxcolor)
                    draw.SimpleText(HEALTHARMOR_LANG.maxtext, "healtharmor_text_3", Width / 2, Height / 2, HEALTHARMOR.maxtextcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                elseif HEALTHARMOR.vipdiscount == true and HEALTHARMOR.vipusergroups[ply:GetUserGroup()] and ply:canAfford(item.price * HEALTHARMOR.vipdiscountamount) then
                    draw.RoundedBox(HEALTHARMOR.roundboxamount, 0, 0, Width, Height, HEALTHARMOR.purchaseboxcolor)
                    draw.SimpleText(HEALTHARMOR_LANG.buytext, "healtharmor_text_3", Width / 2, Height / 2, HEALTHARMOR.purchasetextcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                elseif HEALTHARMOR.cpdiscount == true and ply:isCP() and ply:canAfford(item.price * HEALTHARMOR.cpdiscountamount) then
                    draw.RoundedBox(HEALTHARMOR.roundboxamount, 0, 0, Width, Height, HEALTHARMOR.purchaseboxcolor)
                    draw.SimpleText(HEALTHARMOR_LANG.buytext, "healtharmor_text_3", Width / 2, Height / 2, HEALTHARMOR.purchasetextcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                elseif HEALTHARMOR.vipdiscount == true and HEALTHARMOR.vipusergroups[ply:GetUserGroup()] and ply:canAfford(item.price * HEALTHARMOR.vipdiscountamount) == false then
                    draw.RoundedBox(HEALTHARMOR.roundboxamount, 0, 0, Width, Height, HEALTHARMOR.cantbuyboxcolor)
                    draw.SimpleText(HEALTHARMOR_LANG.cantbuytext, "healtharmor_text_3", Width / 2, Height / 2, HEALTHARMOR.cantbuytextcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                elseif HEALTHARMOR.cpdiscount == true and ply:isCP() and ply:canAfford(item.price * HEALTHARMOR.cpdiscountamount) == false then 
                    draw.RoundedBox(HEALTHARMOR.roundboxamount, 0, 0, Width, Height, HEALTHARMOR.cantbuyboxcolor)
                    draw.SimpleText(HEALTHARMOR_LANG.cantbuytext, "healtharmor_text_3", Width / 2, Height / 2, HEALTHARMOR.cantbuytextcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                elseif ply:canAfford(item.price) then
                    draw.RoundedBox(HEALTHARMOR.roundboxamount, 0, 0, Width, Height, HEALTHARMOR.purchaseboxcolor)
                    draw.SimpleText(HEALTHARMOR_LANG.buytext, "healtharmor_text_3", Width / 2, Height / 2, HEALTHARMOR.purchasetextcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                elseif ply:canAfford(item.price) == false then
                    draw.RoundedBox(HEALTHARMOR.roundboxamount, 0, 0, Width, Height, HEALTHARMOR.cantbuyboxcolor)
                    draw.SimpleText(HEALTHARMOR_LANG.cantbuytext, "healtharmor_text_3", Width / 2, Height / 2, HEALTHARMOR.cantbuytextcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            elseif Me:IsHovered() == false then
                draw.RoundedBox(HEALTHARMOR.roundboxamount, 0, 0, Width, Height, HEALTHARMOR.priceboxcolor)
                if HEALTHARMOR.vipdiscount == true and HEALTHARMOR.vipusergroups[ply:GetUserGroup()] then
                    draw.SimpleText(DarkRP.formatMoney(item.price * HEALTHARMOR.vipdiscountamount), "healtharmor_text_4", Width / 2, Height / 2, HEALTHARMOR.pricetextcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                elseif ply:isCP() and HEALTHARMOR.cpdiscount == true then 
                    draw.SimpleText(DarkRP.formatMoney(item.price * HEALTHARMOR.cpdiscountamount), "healtharmor_text_4", Width / 2, Height / 2, HEALTHARMOR.pricetextcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                else 
                    draw.SimpleText(DarkRP.formatMoney(item.price), "healtharmor_text_4", Width / 2, Height / 2, HEALTHARMOR.pricetextcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end
        end 

        Item_Buy_Button.DoClick = function()
            if item.itemtype == "health" and ply:Health() == HEALTHARMOR.hpmax then
                ply:EmitSound(HEALTHARMOR.denysound)
            elseif item.itemtype == "armor" and ply:Armor() == HEALTHARMOR.armormax then
                ply:EmitSound(HEALTHARMOR.denysound)
            elseif HEALTHARMOR.vipdiscount == true and HEALTHARMOR.vipusergroups[ply:GetUserGroup()] and ply:canAfford(item.price * HEALTHARMOR.vipdiscountamount) == false then
                ply:EmitSound(HEALTHARMOR.denysound)
            elseif HEALTHARMOR.cpdiscount == true and ply:isCP() and ply:canAfford(item.price * HEALTHARMOR.cpdiscountamount) == false then
                ply:EmitSound(HEALTHARMOR.denysound)
            elseif HEALTHARMOR.vipdiscount == true and HEALTHARMOR.vipusergroups[ply:GetUserGroup()] and ply:canAfford(item.price * HEALTHARMOR.vipdiscountamount) then
                net.Start("Health_Armor_Purchase")
                net.WriteInt(k, 16)
                net.SendToServer()
                ply:EmitSound(HEALTHARMOR.acceptsound)
            elseif HEALTHARMOR.cpdiscount == true and ply:isCP() and ply:canAfford(item.price * HEALTHARMOR.cpdiscountamount) then
                net.Start("Health_Armor_Purchase")
                net.WriteInt(k, 16)
                net.SendToServer()
                ply:EmitSound(HEALTHARMOR.acceptsound)
            elseif ply:canAfford(item.price) == false then
                ply:EmitSound(HEALTHARMOR.denysound)
            elseif ply:canAfford(item.price) then
                net.Start("Health_Armor_Purchase")
                net.WriteInt(k, 16)
                net.SendToServer()
                ply:EmitSound(HEALTHARMOR.acceptsound)
            end
        end

        if item.itemtype == "health" or item.itemtype == "armor" then
            local Item_Image = vgui.Create("DImage", Item_Panel)
            Item_Image:SetPos(Item_Panel:GetWide() * .13, Item_Panel:GetTall() * .13)
            Item_Image:SetSize(Item_Panel:GetWide() * .99, Item_Panel:GetWide() * .93)
            Item_Image:SetImage("itemicon/" .. item.modelpath .. ".png")
        else
            HEALTHARMOR.Menu:Close()
            ply:ChatPrint(HEALTHARMOR_LANG.errortext1 .. item.itemtype .. HEALTHARMOR_LANG.errortext2 .. k .. HEALTHARMOR_LANG.errortext3)
        end
    end
end

-- Opens the MoFo menu func thingy lmao
net.Receive("Health_Armor_Used_Start", function()
    
    HEALTHARMOR:Open()

end)