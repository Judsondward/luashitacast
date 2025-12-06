-- Modified from https://github.com/yzyii/luashitacast/

--[[
    ToDo:
    Elemental Gorget Table/Logic
]]

--gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua')

local gcinclude = {};

function gcinclude.Initialize()
    -- Standard Binds
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /wep /lac fwd Idle_WP');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /mage /lac fwd MG_Mode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /fshmode /lac fwd Fish');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sync /lac fwd Sync_Mode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !l /lac fwd LockAll');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F7 /lac fwd OV_Off');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F8 /lac fwd OV_Mode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /lac fwd TP_Mode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /lac fwd DT_Mode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F12 /lac fwd CC_Mode');
end

function gcinclude.Unload()
    -- Standard uninds  
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /wep');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /mage');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /fshmode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sync');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !l');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F10');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F12');
end

-- [[ Elemental Staff Logic ]]

-- Defines Staves to equip
-- Set as '' if you do not have them
local earth_staff = ''
local water_staff = ''
local wind_staff = ''
local fire_staff = ''
local ice_staff = ''
local thunder_staff = ''
local light_staff = ''
local dark_staff = ''

local EleStaffTable = {
    ['Earth']   = earth_staff,
    ['Water']   = water_staff,
    ['Wind']    = wind_staff,
    ['Fire']    = fire_staff,
    ['Ice']     = ice_staff,
    ['Thunder'] = thudner_staff,
    ['Light']   = light_staff,
    ['Dark']    = dark_staff
};

local ElementalDebuffs = T{'Shock', 'Rasp', 'Drown', 'Choke', 'Frost', 'Burn'};

function gcinclude.EquipStaff()
    local action = gData.GetAction()
    local environment = gData.GetEnvironment()
    local player = gData.GetPlayer()

    -- Broken logic I need to review
    -- and not ElementalDebuffs:contains(action.Name)
    if (action.Skill ~= 'Enhancing Magic' and not ElementalDebuffs:contains(action.Name) and not string.match(action.Name, 'Utsusemi')) then
        local staff = EleStaffTable[action.Element]
        if staff ~= '' then
            gFunc.Equip('Main', staff)
        end

        --[[if (player.MainJob == 'BLM' and DiabolosPoleSpells:contains(action.Name)) then
            if (environment.WeatherElement == 'Dark' and diabolos_pole) then gFunc.Equip('Main', 'Diabolos\'s Pole') end
        end]]
        --[[if (player.MainJob == 'WHM' and mjollnir and CureSpells:contains(action.Name)) then
            gFunc.Equip('Main', 'Mjollnir')
            if (player.SubJob == 'NIN' and asklepios) then
                gFunc.Equip('Sub', 'Asklepios')
            end
        end]]
    end
end

--[[ Obi Logic ]]

-- Set to true if you have the obi
local dorin_obi = false
local suirin_obi = false
local furin_obi = false
local karin_obi = false
local hyorin_obi = false
local rairin_obi = false
local korin_obi = false
local anrin_obi = false

local EleObiTable = {
    ['Earth']   = 'Dorin Obi',
    ['Wind']    = 'Furin Obi',
    ['Water']   = 'Suirin Obi',
    ['Fire']    = 'Karin Obi',
    ['Ice']     = 'Hyorin Obi',
    ['Thunder'] = 'Rairin Obi',
    ['Light']   = 'Korin Obi',
    ['Dark']    = 'Anrin Obi'
};

local EleObiOwnedTable = {
    ['Earth'] = dorin_obi,
    ['Water'] = suirin_obi,
    ['Wind'] = furin_obi,
    ['Fire'] = karin_obi,
    ['Ice'] = hyorin_obi,
    ['Thunder'] = rairin_obi,
    ['Light'] = korin_obi,
    ['Dark'] = anrin_obi
};

local WeakElementTable = {
    ['Fire'] = 'Water',
    ['Earth'] = 'Wind',
    ['Water'] = 'Thunder',
    ['Wind'] = 'Ice',
    ['Ice'] = 'Fire',
    ['Thunder'] = 'Earth',
    ['Light'] = 'Dark',
    ['Dark'] = 'Light'
}

function gcinclude.EquipObi(action)
    if (ObiCheck(action)) then
        local obi = EleObiTable[action.Element]
        local obiOwned = EleObiOwnedTable[action.Element]
        if (obiOwned) then
            gFunc.Equip('Waist', obi)
        end
    end
end

function ObiCheck(action)
    local element = action.Element
    local environment = gData.GetEnvironment()
    local weakElement = WeakElementTable[element]

    if environment.WeatherElement == element then
        return environment.Weather:match('x2') or environment.DayElement ~= weakElement
    end

    return environment.DayElement == element and environment.WeatherElement ~= weakElement
end
--[[ Auto Lock Equipment Logic ]]

local LockableEquipment = {
    ['Main'] = T{'Warp Cudgel', 'Rep. Signet Staff', 'Kgd. Signet Staff', 'Fed. Signet Staff', 'Treat Staff II', 'Trick Staff II'},
    ['Sub'] = T{'Warp Cudgel'},
    ['Range'] = T{},
    ['Ammo'] = T{},
    ['Head'] = T{'Reraise Hairpin', 'Dream Hat +1', 'Tinfoil Hat'},
    ['Neck'] = T{'Opo-opo Necklace'},
    ['Ear1'] = T{'Reraise Earring', 'Republic Earring', 'Kingdom Earring', 'Federation Earring'},
    ['Ear2'] = T{'Reraise Earring', 'Republic Earring', 'Kingdom Earring', 'Federation Earring'},
    ['Body'] = T{'Custom Gilet +1', 'Custom Top +1', 'Magna Gilet +1', 'Magna Top +1', 'Savage Top +1', 'Elder Gilet +1', 'Wonder Maillot +1', 'Wonder Top +1', 'Mandra. Suit'},
    ['Hands'] = T{},
    ['Ring1'] = T{'Anniversary Ring', 'Emperor Band', 'Chariot Band', 'Empress Band', 'Homing Ring', 'Tavnazian Ring', 'Dem Ring', 'Holla Ring', 'Mea Ring', 'Altep Ring', 'Yhoat Ring'},
    ['Ring2'] = T{'Anniversary Ring', 'Emperor Band', 'Chariot Band', 'Empress Band', 'Homing Ring', 'Tavnazian Ring', 'Dem Ring', 'Holla Ring', 'Mea Ring', 'Altep Ring', 'Yhoat Ring'},
    ['Back'] = T{},
    ['Waist'] = T{},
    ['Legs'] = T{},
    ['Feet'] = T{'Powder Boots'}
}
--
function gcinclude.BuildLockableSet(equipment)
    local lockableSet = {}

    for slot, item in pairs(equipment) do
        if (LockableEquipment[slot]:contains(item.Name)) then
            lockableSet[slot] = item
            if (
                item.Name == 'Custom Gilet +1'
                or item.Name == 'Custom Top +1'
                or item.Name == 'Magna Gilet +1'
                or item.Name == 'Magna Top +1'
                or item.Name == 'Savage Top +1'
                or item.Name == 'Elder Gilet +1'
                or item.Name == 'Wonder Maillot +1'
                or item.Name == 'Wonder Top +1'
            ) then
                lockableSet['Hands'] = 'Displaced'
            elseif (item.Name == 'Mandra. Suit') then
                lockableSet['Hands'] = 'Displaced'
                lockableSet['Legs'] = 'Displaced'
                lockableSet['Feet'] = 'Displaced'
            elseif (slot == 'Main') then
                lockableSet['Sub'] = 'Displaced'
            end
        end
    end

    return lockableSet
end

return gcinclude