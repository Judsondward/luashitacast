layers = gFunc.LoadFile('layers\\layers')
local idleMode = layers.CreateModeGroup('Idle', {'Off', 'DT'}, '^F11')
local EnmityMode = layers.CreateModeGroup('Enmity', {'Off', 'Enmity'}, '^F12')
local idleMode = layers.CreateModeGroup('Fish', {'Off', 'Fish'}, '^F1')
local bee_lac_utils = gFunc.LoadFile('..\\common\\bee_lac_utils.lua')
gFunc.LoadFile('C:\\Horizon\\HorizonXI\\Game\\config\\addons\\LuAshitacast\\Common\\sticky')


-- Default Idle Set
layers.Sets.Idle = {
    Main = 'Earth Staff',
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
}

layers.Sets.Engaged = {
}

--layers.Sets['Player HPP <= 50'].Engaged = gFunc.Combine(layers.Sets.Engaged, {Ring2 = "Hercules\' Ring", })

--layers.Sets['Player Status Effect == sleep'].Idle = { Neck = 'Opo-Opo Necklace', }

--layers.Sets['Player Status Effect == sleep'].Engaged = layers.Sets['Player Status Effect == sleep'].Idle

layers.Sets.Precast = {
}

layers.Sets.Midcast['Healing'] = {
}

layers.Sets.Midcast['Elemental'] = {
}

layers.Sets.Midcast['Dark'] = {
}

layers.Sets.Midcast['Divine'] = {
}

layers.Sets.Midcast['Enhancing'] = {
}

layers.Sets.Midcast['Black Magic Enfeebling'] = {
}

layers.Sets.Midcast['White Magic Enfeebling'] = {
}

layers.Sets.Midcast['Enfeebling Elemental'] = {
}


layers.Sets.Midcast['Regen'] = gFunc.Combine(layers.Sets.Midcast['Enhancing'], {
    Head = 'Telchine Cap',
    Legs = 'Telchine Braconi',
    Feet = 'Telchine Pigaches',
})

layers.Sets.Midcast['Stoneskin'] = gFunc.Combine(layers.Sets.Midcast['Enhancing'], {
    Head = 'Telchine Cap',
    Legs = 'Telchine Braconi',
    Feet = 'Telchine Pigaches',
})


layers.Sets.Midcast['Skill Exempt'] = {
}

layers.Sets.Midcast['Status Removal'] = {
}

layers.Sets.Midcast['Raise'] = layers.Sets.Midcast['Skill Exempt']

layers.Sets.Midcast['Stealth'] = {
	Back = 'Skulker\'s Cape',
}

layers.Sets.Midcast.Utsusemi = {
}

--[[ This will become easier ]]
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

layers.Sets.Weaponskill = {
}

layers.Sets.Weaponskill['Starlight'] = {
}

--Auto-equip Dream Gloves +1/Boots +1 and Skulker's Cape for spells
layers.RegisterCallback("PostHandleMidcast", function(spell)
    gFunc.EquipSet(bee_lac_utils.StealthGearOption(spell))
end, "Stealth Enhancement")

--Auto-equip Dream Gloves +1/Boots +1 for silent oils and prism powders
layers.RegisterCallback("PreHandleItem", function(item)
    gFunc.EquipSet(bee_lac_utils.StealthGearOption(item))
end, "Stealth Enhancement (oils & powders)")

--[[
    Format: ({JOB = {Book, Page}, JOB = {Book, Page}}, Lock Style Set)
]]

layers.RegisterCallback("PostHandleIdle", function()
    bee_lac_utils.UpdateMacrosAndLockstyle({BLM={1,2},RDM={1,3},SMN={1,4}}, 10)
end,"Subjob profile management")

layers.UserOnUnload = function()
end

local logger = gFunc.LoadFile('Taxonomy\\Logger.lua')

return layers;