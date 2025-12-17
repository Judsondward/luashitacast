layers = gFunc.LoadFile('layers\\layers')
local idleMode = layers.CreateModeGroup('Idle', {'Off', 'DT'}, '^F11')
local EnmityMode = layers.CreateModeGroup('Enmity', {'Off', 'Enmity'}, '^F12')
local idleMode = layers.CreateModeGroup('Fish', {'Off', 'Fish'}, '^F1')
local bee_lac_utils = gFunc.LoadFile('..\\common\\bee_lac_utils.lua')
gFunc.LoadFile('..\\common\\sticky.lua')


-- Default Idle Set
layers.Sets.Idle = {
    Head    = 'Eisenschaller',
    Neck    = 'Spike Necklace',
    Ear1    = 'Beetle Earring +1',
    Ear2    = 'Beetle Earring +1',
    Body    = 'Eisenbrust',
    Hands   = 'Eisenhentzes',
    Ring1   = 'Bastokan Ring',
    Ring2   = 'Balance Ring',
    Back    = 'Dhalmel Mantle +1',
    Waist   = 'Brave Belt',
    Legs    = 'Eisendiechlings',
    Feet    = 'Eisenschuhs'
}

--[[
layers.Sets['Player HPP >= 85 && Player MPP <= 90'].Idle = {
    Body = 'Royal Cloak',
    Head = '',
    Neck = 'Parade Gorget',
}
    ]]

--[[
layers.Sets['Player HPP <= 50'].Idle = {
    Ring2 = 'Hercules\' Ring',
}
    ]]

layers.Sets.Fish.Idle = {
    Range   = 'Lu Shang\'s Rod',
    Body    = 'Fsh. Tunica',
    Hands   = 'Fsh. Gloves',
    Waist   = 'Fisherman\'s Belt',
    Legs    = 'Fisherman\'s Hose',
    Feet    = 'Fisherman\'s Boots'
}

-- DT Idle Set
layers.Sets.DT.Idle = {

}

-- Default Resting Set
layers.Sets.Resting = {
    --Body = 'Royal Cloak',
}

layers.Sets.Engaged = {
    Head    = 'Eisenschaller',
    Neck    = 'Spike Necklace',
    Ear1    = 'Beetle Earring +1',
    Ear2    = 'Beetle Earring +1',
    Body    = 'Eisenbrust',
    Hands   = 'Eisenhentzes',
    Ring1   = 'Bastokan Ring',
    Ring2   = 'Balance Ring',
    Back    = 'Dhalmel Mantle +1',
    Waist   = 'Brave Belt',
    Legs    = 'Eisendiechlings',
    Feet    = 'Eisenschuhs'
}

--layers.Sets['Player HPP <= 50'].Engaged = gFunc.Combine(layers.Sets.Engaged, {Ring2 = "Hercules\' Ring", })

--layers.Sets['Player Status Effect == sleep'].Idle = { Neck = 'Opo-Opo Necklace', }

--layers.Sets['Player Status Effect == sleep'].Engaged = layers.Sets['Player Status Effect == sleep'].Idle

layers.Sets.Ability['Provoke'] = {
    Head    = 'Pumpkin Head II'
    --Head = 'Bahamut\'s Mask',
    --Legs = 'Valor Breeches',
    --Body = 'Valor Surcoat',
	--Ring1 = 'Sattva Ring',
    --Ring2 = 'Hercules\' Ring',
    --Hands = 'Valor Gauntlets',
    --Waist = 'Warwolf Belt',
    --Ring2 = 'Hercules\' Ring',
}

layers.Sets.Ability['Flash'] = {
    Head    = 'Pumpkin Head II'
    --Head = 'Bahamut\'s Mask',
    --Legs = 'Valor Breeches',
    --Body = 'Valor Surcoat',
	--Ring1 = 'Sattva Ring',
    --Ring2 = 'Hercules\' Ring',
    --Hands = 'Valor Gauntlets',
    --Waist = 'Warwolf Belt',
    --Ring2 = 'Hercules\' Ring',
}

layers.Sets.Ability['Enlight'] = {
    --Head = 'Bahamut\'s Mask',
    --Legs = 'Gallant Breeches',
	--Neck = 'Divine Torque',
    --Body = 'Gallant Surcoat',
	--Ring1 = 'Sattva Ring',
    --Ring2 = 'Hercules\' Ring',
    --Hands = 'Valor Gauntlets',
    --Waist = 'Warwolf Belt',
    --Ring2 = 'Hercules\' Ring',
}

layers.Sets.Ability['Cover'] = {
	--Head = 'Gallant Coronet',
	--Body = 'Valor Surcoat',
}

--layers.Sets['Player MP <= 900'].Midcast["Enhancing"]

--Idle HP 1434 War, 1392 Nin
--layers.Sets['Target Name == Eezagi && Player HPP > 92'].Precast['Cure'] = {}

--layers.Sets['Target Name == Eezagi'].Midcast['Cure'] = {}

layers.Sets.Midcast['Enhancing'] = {
    Main = '',
    Ammo = '',
    Head = '',
    Neck = '',
    Ear1 = '',
    Ear2 = '',
    Body = '',
    Hands = '',
    Ring1 = '',
    Ring2 = '',
    Back = '',
    Waist = '',
    Legs = '',
    Feet = '',
}

layers.Sets.Midcast['Flash'] = {
    Head    = 'Horror Head'
    --Head = 'Bahamut\'s Mask',
    --Legs = 'Valor Breeches',
    --Body = 'Valor Surcoat',
	--Ring1 = 'Sattva Ring',
    --Ring2 = 'Hercules\' Ring',
    --Hands = 'Valor Gauntlets',
    --Waist = 'Warwolf Belt',
    --Ring2 = 'Hercules\' Ring',
}

layers.Sets.Midcast['Regen'] = {
}

layers.Sets.Midcast.Stoneskin = {
}

layers.Sets.Midcast.Elemental = {
}

layers.Sets.Midcast.Divine = {
    --Ammo = 'Happy Egg',
    --Head = 'Gallant Coronet',
    --Neck = 'Divine Torque',
--    Ear1 = 'Pigeon Earring +1',
--    Ear2 = 'Bloodbead Earring',
    --Body = 'Gallant Surcoat',
    --Hands = 'Gallant Gauntlets',
    --Ring1 = 'Sattva Ring',
    --Ring2 = 'Woodsman Ring',
    --Back = '',
--    Waist = 'Life Belt',
    --Legs = 'Gallant Breeches',
--    Feet = 'Gallant Leggings',
}

layers.Sets.Midcast['Enfeebling Elemental'] = {
}

layers.Sets.Midcast.Dark = {
}

layers.Sets.Midcast['Black Magic Enfeebling'] = {
}

layers.Sets.Midcast['White Magic Enfeebling'] = {
}

layers.Sets.Midcast['Skill Exempt'] = {
    Ammo = 'Happy Egg',
    Head = 'Bahamut\'s Mask',
    Neck = 'Parade Gorget',
    Ear1 = 'Pigeon Earring +1',
    Ear2 = 'Bloodbead Earring',
    Body = 'Homam Corazza',
    Hands = 'Homam Manopolas',
    Ring1 = 'Sattva Ring',
    Ring2 = 'Woodsman Ring',
    Back = 'Forager\'s Mantle',
    Waist = 'Warwolf Belt',
    Legs = 'Blood Cuisses',
    Feet = 'Homam Gambieras',
}

layers.Sets.Midcast['Status Removal'] = {
}

layers.Sets.Midcast['Protect IV'] = layers.Sets.Midcast['Skill Exempt']

layers.Sets.Midcast['Shell III'] = layers.Sets.Midcast['Skill Exempt']

layers.Sets.Midcast['raise'] = layers.Sets.Midcast['Skill Exempt']

layers.Sets.Midcast['Stealth'] = {
	Back = 'Skulker\'s Cape',
}

layers.Sets.Midcast.Utsusemi = {
}

--[[ This will become easier
layers.Sets.Midcast['Earth Magic Damage'] = { Main = "Terra's Staff" }
layers.Sets.Midcast['Water Magic Damage'] = { Main = "Neptune's Staff" }
layers.Sets.Midcast['Wind Magic Damage'] = { Main = "Auster's Staff" }
layers.Sets.Midcast['Fire Magic Damage'] = { Main = "Vulcan's Staff" }
layers.Sets.Midcast['Ice Magic Damage'] = { Main = "Aquilo's Staff" }
layers.Sets.Midcast['Lightning Magic Damage'] = { Main = "Jupiter's Staff" }
layers.Sets.Midcast['Light Magic Damage'] = { Main = "Apollo's Staff" }
layers.Sets.Midcast['Dark Magic Damage'] = { Main = "Pluto's Staff" }
layers.Sets.Midcast['Earth Enfeeblement'] = layers.Sets.Midcast['Earth Magic Damage']
layers.Sets.Midcast['Water Enfeeblement'] = layers.Sets.Midcast['Water Magic Damage']
layers.Sets.Midcast['Wind Enfeeblement'] = layers.Sets.Midcast['Wind Magic Damage']
layers.Sets.Midcast['Fire Enfeeblement'] = layers.Sets.Midcast['Fire Magic Damage']
layers.Sets.Midcast['Ice Enfeeblement'] = layers.Sets.Midcast['Ice Magic Damage']
layers.Sets.Midcast['Lightning Enfeeblement'] = layers.Sets.Midcast['Lightning Magic Damage']
layers.Sets.Midcast['Light Enfeeblement'] = layers.Sets.Midcast['Light Magic Damage']
layers.Sets.Midcast['Dark Enfeeblement'] = layers.Sets.Midcast['Dark Magic Damage']
layers.Sets.Midcast['Absorption'] = layers.Sets.Midcast['Dark Magic Damage']
]]

layers.Sets.Weaponskill = {
    Neck    = 'Spike Necklace',
    Hands   = 'Custom M Gloves',
    Ring1   = 'Courage Ring',
    Ring2   = 'Courage Ring',
    Legs    = 'Republic Subligar'
}

layers.Sets.Weaponskill.RedLotusBlade = {
    Ammo = '',
    Head = '',
    Neck = 'Spike Necklace',
    Ear1 = 'Beetle Earring +1',
    Ear2 = 'Beetle Earring +1',
    Body = '',
    Hands = 'Custom M Gloves',
    Ring1 = 'Eremite\'s Ring +1',
    Ring2 = 'Eremite\'s Ring +1',
    Back = '',
    Waist = 'Warrior\'s Belt +1',
    Legs = '',
    Feet = 'Custom M Boots',
}

--local HPDownSet = {
--    Head = {Name = 'Zenith Crown', Priority = 0},
--    Feet = {Name = 'Rostrum Pumps', Priority = 0},
--    Ring2 = {Name = 'Minstrel\'s Ring', Priority = -2},	
--}

--Auto-equip Dream Gloves +1/Boots +1 and Skulker's Cape for spells
layers.RegisterCallback("PostHandleMidcast", function(spell)
    gFunc.EquipSet(bee_lac_utils.StealthGearOption(spell))
end, "Stealth Enhancement")

--Auto-equip Dream Gloves +1/Boots +1 for silent oils and prism powders
layers.RegisterCallback("PreHandleItem", function(item)
    gFunc.EquipSet(bee_lac_utils.StealthGearOption(item))
end, "Stealth Enhancement (oils & powders)")

layers.RegisterCallback("PostHandleIdle", function()
    bee_lac_utils.UpdateMacrosAndLockstyle({WAR={7,1},RDM={7,1},NIN={7,2,},SAM={7,1},BLM={7,1},WHM={7,1}}, 1)
end,"Subjob profile management")

layers.UserOnUnload = function()
end


local logger = gFunc.LoadFile('Taxonomy\\Logger.lua')

return layers;