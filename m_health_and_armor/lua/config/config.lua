HEALTHARMOR = HEALTHARMOR or {}
-- ^^ DO NOT EDIT ;)


-- MESSAGE ME (MATTHEW - https://steamcommunity.com/id/Matthew_23985/) IF YOU NEED ANY HELP AND ETC. Thanks for using this script, it means a lot! ;)


--***MAIN CONFIG***
-- The main part of the config! Hopefully easy to edit ;) Enjoy!!!

-- What should be the text located at the top of the menu?
HEALTHARMOR.maintext = "<Community Name Here>"

-- What do you want it to say above the NPC's head?
HEALTHARMOR.npcoverheadtext = "Health & Armor"

-- How far away can the NPC over head is visable? (Default: 230) (The greater, the less optimized)
HEALTHARMOR.npcoverheadrange = 230

-- Should CP jobs have a discount? (Default: true)
HEALTHARMOR.cpdiscount = true

-- If CP jobs have a discount, how much? (Default: .5) (WARNING: If you put .75 then that is 25% off!!!)
HEALTHARMOR.cpdiscountamount = .5

-- Should VIP groups have a discount? (Default: true)
HEALTHARMOR.vipdiscount = true

-- If VIP groups have a discount, how much? (Default: .25) (WARNING: If you put .25 then that means 75% off!!!)
HEALTHARMOR.vipdiscountamount = .25

-- Define what groups are VIP for discount if true above. (WARNING: Make sure to include commas!!!)
HEALTHARMOR.vipusergroups = {
    ["superadmin"] = true,
    ["admin"] = true,
    ["vip"] = true
}

-- What is the max HP a player can be set to by the NPC? (Default: 100)
HEALTHARMOR.hpmax = 100

-- What is the max ARMOR a player can be set to by the NPC? (Default: 100)
HEALTHARMOR.armormax = 100

-- What user groups can use the save command? "savehealtharmornpc" 
HEALTHARMOR.savecommandgroup = {
    ["superadmin"] = true,

}

-- What user groups can use the spawn command? "spawnhealtharmornpc"
HEALTHARMOR.spawncommandgroup = {
    ["superadmin"] = true,

}



--***ITEM CONFIG***
-- This config can be difficult to understand! So edit at your own risk! Make sure to not delete commas or change, for example, "name ="
-- Good luck :) If you need help, consider contacting me on steam or my discord! (Both linked on the workshop page)
-- Note: This addons is mainly made for only 6 items, however you can add more and the addon will work perfectly, but keep that in mind!
HEALTHARMOR.Items = {
    -- Health
    {name = "25 Health", amount = 25, price = 1000, desc = false, desctext = "", itemtype = "health", modelpath = "health"},
    {name = "50 Health", amount = 50, price = 2000, desc = false, desctext = "", itemtype = "health", modelpath = "health"},
    {name = "100 Health", amount = 100, price = 5000, desc = true, desctext = "Sets your health to 100!!", itemtype = "health", modelpath = "health"},

    -- Armor
    {name = "25 Armor", amount = 25, price = 2000, desc = true, desctext = "Gives you 25 Armor!", itemtype = "armor", modelpath = "armor"},
    {name = "50 Armor", amount = 50, price = 4000, desc = false, desctext = "", itemtype = "armor", modelpath = "armor"},
    {name = "100 Armor", amount = 100, price = 10000, desc = true, desctext = "Sets your armor to 100!", itemtype = "armor", modelpath = "armor"},
    
    --Ex: You can add more than 6 and it will still work, but this addon was made to mainly hold 6 items! ;)
    --{name = "75 Armor", amount = 75, price = 6000, desc = true, desctext = "Sets your armor to 75!", itemtype = "armor", modelpath = "armor"},
}


--***THEME CONFIG***
-- Editting this takes a lot of time! So do it wisely! Good luck! :)
-- Note: Most colors are in a RGBA format. (red,green,blue,alpha) (alpha = transparency)

-- What is the amount the boxes should be rounded at (at the corners of the box's)? (Default: 4) (If you want no round, then put in 0)
HEALTHARMOR.roundboxamount = 4

-- What should the background color be of the main panel? (Default: 30,30,30,255)
HEALTHARMOR.mainbackgroundcolor = Color(30,30,30,255)

-- What should be the bar at the top of the main panel color be? (Default: 45,45,45,255)
HEALTHARMOR.maintopbarcolor = Color(45,45,45,255)

-- What should the color be of the main text at the top of the main panel? (Default: 255,255,255)
HEALTHARMOR.maintoptextcolor = Color(255,255,255)

-- What should be the color of the scroll bar to the right of the main panel be? (Default: 45,45,45,255)
HEALTHARMOR.scrollbarcolor = Color(45,45,45,255)

-- What should be the color of the outline of the scroll bar? (Default: 65,65,65,200)
HEALTHARMOR.scrollbaroutlinecolor = Color(65,65,65,200)

-- What should the color be of the main box in the item panel be? (Default: 65,65,65,255)
HEALTHARMOR.itempanelmaincolor = Color(65,65,65,255)

-- What should be the color for the item panel box for the icon of hp/armor? (Default: 50,50,50)
HEALTHARMOR.itempaneliconboxcolor = Color(50,50,50)

-- What should the color be of the main text in the item panel be? (Default: 255,255,255)
HEALTHARMOR.itempaneltitletextcolor = Color(255,255,255)

-- What should the color be of the description in the item panel be? (Default: 255,255,255)
HEALTHARMOR.itempaneldesccolor = Color(255,255,255)

-- What should the color of the box be if the player can buy it? (Default: 0,129,257)
HEALTHARMOR.purchaseboxcolor = Color(0, 129, 257)

-- What should be the color of the purchase text if the player can buy it? (Default: 255,255,255)
HEALTHARMOR.purchasetextcolor = Color(255,255,255)

-- What should be the color of the cant buy box if the player cant buy it? (Default: 180,38,38)
HEALTHARMOR.cantbuyboxcolor = Color(180,38,38)

-- What should be the color of the cant buy text if the player cant buy it? (Default: 255,255,255)
HEALTHARMOR.cantbuytextcolor = Color(255,255,255)

-- What should the color of the box be when a player is not hovering over the price? (Default: 0,128,227)
HEALTHARMOR.priceboxcolor = Color(0,128,227)

-- What should be the color of the price text? (Default: 255,255,255)
HEALTHARMOR.pricetextcolor = Color(255,255,255)

-- What should be the color of the max box if the player is max on hp or armor? (Default: 255,144,33)
HEALTHARMOR.maxboxcolor = Color(255, 144, 33)

-- What should be the color of the max text if the player has max hp or armor? (Default: 255,255,255)
HEALTHARMOR.maxtextcolor = Color(255,255,255)





--***MISC CONFIG***
-- Config settings where I don't know where to put it in, so here it is! ;)

-- What should the NPC model be? (Default: models/Humans/Group01/male_08.mdl)
HEALTHARMOR.npcmodel = "models/Humans/Group01/male_08.mdl"

-- When accepted, what should the sound be? (Default: buttons/button14.wav) [Visit this for all sounds: https://wiki.facepunch.com/gmod/HL2_Sound_List]
HEALTHARMOR.acceptsound = "buttons/button14.wav"

-- When denied, what should the sound be? (Default: buttons/button10.wav) 
HEALTHARMOR.denysound = "buttons/button10.wav"

-- When opening the NPC, what sound should play? (Default: vo/coast/odessa/nlo_cub_hello.wav)
HEALTHARMOR.welcomesound = "vo/coast/odessa/nlo_cub_hello.wav"

-- What should the close button icon be? (Default: slim_x) Possible: "box" , "x" , "arrow" , "circle" , "slim_x"
HEALTHARMOR.closebutton = "slim_x"

-- Should clients auto download the content needed for the addon? (If you added custom .png's then set this to false and download your content)
HEALTHARMOR.content = true



--***LANG CONFIG***
-- What language you want? (Options: 'english') [MORE TO COME, well hopefully...]
-- > Want to add your own? Create a <name of lang>.lua under config/lang/<name of lang>.lua !!!
-- > Then copy over the english.lua and change to your lang! But keep the spaces the same at ends of quotes, or some text will not work properly! Please message me (Matthew) so I can add your lang to the addon!!! ;)
HEALTHARMOR.lang = "english"



-- MESSAGE ME (MATTHEW - https://steamcommunity.com/id/Matthew_23985/) IF YOU NEED ANY HELP AND ETC. Thanks for using this script, it means a lot! ;)