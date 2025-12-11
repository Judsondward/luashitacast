layers = gFunc.LoadFile('layers\\layers.lua')
local bee_lac_utils = gFunc.LoadFile('..\\common\\bee_lac_utils.lua')
gFunc.LoadFile('..\\common\\sticky.lua')

local idleMode = layers.CreateModeGroup('Fish', {'Off', 'Fish'}, '^F1')
local Sai = layers.CreateModeGroup('Sai', {'Off', 'Sai'}, '^f2')
local AccuracyMode = layers.CreateModeGroup('Accuracy', {'MidAcc', 'HighAcc', 'NormalAcc',}, 'f9')
local DefenseMode = layers.CreateModeGroup('Defense', {'Off', 'PDT', 'MDT'},'f10')

layers.Sets.Idle_Priority = {
        Head    = {'Irn.Msk. Armet', 'Centurion\'s Visor'},
        Neck    = {'Spike Necklace'},
        Ear1    = {'Beetle Earring +1'},
        Ear2    = {'Beetle Earring +1'},
        Body    = {'Ryl.Sqr. Chainmail', 'Ctr. Scale Mail'},
        Hands   = {'Irn.Msk. Guantlets','Custom M Gloves'},
        Ring1   = {'Bastokan Ring'},
        Ring2   = {'Woodsman Ring', 'Balance Ring'},
        Back    = {'Dhalmel Mantle +1'},
        Waist   = {'Tilt Belt','Brave Belt'},
        Legs    = {'Ryl.Sqr. Breeches','Republic Subligar'},
        Feet    = {'Irn.Msk. Sabatons','Ctr. Greaves'}
}

layers.Sets.Fish.Idle = {
    Range   = 'Lu Shang\'s F. Rod',
    Body    = 'Fsh. Tunica',
    Hands   = 'Fsh. Gloves',
    Waist   = 'Fisherman\'s Belt',
    Legs    = 'Fisherman\'s Hose',
    Feet    = 'Fisherman\'s Boots'
}

layers.Sets.Sai.Idle = {
    Hands   = "Dream Mittens +1",
    Feet    = "Dream Boots +1",
}

layers.Sets['Nation'].Idle = { Body = "Republic Aketon"}

layers.Sets.Engaged_Priority = {
        Head    = {'Irn.Msk. Armet', 'Centurion\'s Visor'},
        Neck    = {'Spike Necklace'},
        Ear1    = {'Beetle Earring +1'},
        Ear2    = {'Beetle Earring +1'},
        Body    = {'Ryl.Sqr. Chainmail', 'Ctr. Scale Mail'},
        Hands   = {'Irn.Msk. Guantlets','Custom M Gloves'},
        Ring1   = {'Woodsman Ring', 'Balance Ring', 'Bastokan Ring'},
        Ring2   = {'Woodsman Ring', 'Balance Ring'},
        Back    = {'Dhalmel Mantle +1'},
        Waist   = {'Tilt Belt','Brave Belt'},
        Legs    = {'Ryl.Sqr. Breeches','Republic Subligar'},
        Feet    = {'Irn.Msk. Sabatons','Ctr. Greaves'}
}

layers.Sets.MidAcc.Engaged = gFunc.Combine(layers.Sets.Engaged, {
    Neck    = 'Spike Necklace',
    Hands   = 'Custom M Gloves'
})
layers.Sets.HighAcc.Engaged = gFunc.Combine(layers.Sets.Engaged, {}) 

--layers.Sets['Target Distance > 4.0'].Engaged = {Hands = "Dst. Mittens +1", Feet = "Dst. Leggings +1",}

layers.Sets.Midshot = {}

layers.Sets.Midshot['Player Ammo == Bloody Bolt'] = {
    Head    = 'Erd. Headband',          -- +1
    --Neck    = 'Black Neckerchief',      -- +1, Need to do quest to kill silkworm NM
    Ear1    = 'Morion Earring',         -- +1 (The +1 Earring has 1 more int but costs 450k/ea.)
    Ear2    = 'Morion Earring',         -- +1
    Ring1   = 'Eremite\'s ring',        -- +2 (Can Upgrade to the level 36 Int rings if this shows promise)
    Ring2   = 'Eremite\'s ring',        -- +2
    Feet    = 'Custom M Boots'          -- +3
}

layers.Sets.Weaponskill = {
    Neck    = 'Spike Necklace',
    Hands   = 'Custom M Gloves',
    Ring1   = 'Courage Ring',
    Ring2   = 'Courage Ring',
    Legs    = 'Republic Subligar'
}

--layers.Sets.Weaponskill['Decimation'] = gFunc.Combine(layers.Sets.Weaponskill, {Neck = "Breeze Gorget", Ear2 = "Merman's Earring", Legs = "Warrior's Cuisses",})
--layers.Sets.Weaponskill['Steel Cyclone'] = gFunc.Combine(layers.Sets.Weaponskill, {Body = "Kirin's Osode", Ear2 = "Merman's Earring", Legs = "Warrior's Cuisses",})

layers.Sets.Precast = {
    Waist = 'Heko Obi +1',
}

layers.Sets.Midcast = {}

layers.Sets.PDT.Idle = {
    Head    = 'Eisenschaller',
    Neck    = 'Bloodbead Amulet',   --[[ +15 HP ]]
    Ear1    = 'Shield Earring',     --[[ +10 HP ]]  --[[ Ear1 = 'Bloodbead Earring'  --[[ +25 HP, 200k ]]
    Ear2    = 'Shield Earring',     --[[ +10 HP ]]
    Body    = 'Eisenbrust',
    Hands   = 'Eisenhentzes',
    Ring1   = 'Bastokan Ring',
    Legs    = 'Eisendiechlings',
    Feet    = 'Eisenschuhs'
}
layers.Sets.PDT.Engaged = layers.Sets.PDT.Idle

layers.Sets.MDT.Idle = {
    Head    = 'Eisenschaller',
    Neck    = 'Bloodbead Amulet',   --[[ +15 HP ]]
    Ear1    = 'Shield Earring',     --[[ +10 HP ]]  --[[ Ear1 = 'Bloodbead Earring'  --[[ +25 HP, 200k ]]
    Ear2    = 'Shield Earring',     --[[ +10 HP ]]
    Body    = 'Eisenbrust',
    Hands   = 'Eisenhentzes',
    Ring1   = 'Bastokan Ring',
    Legs    = 'Eisendiechlings',
    Feet    = 'Eisenschuhs'
}
layers.Sets.MDT.Engaged = layers.Sets.MDT.Idle

--layers.Sets.Ability['Warcry'] = {Head = "Warrior's Mask"}

--[[
        Misc Logic
--]]

--[[Blink on JA
layers.RegisterCallback("PostHandleAbility", function ()
    local delay = 0.7
    (function() AshitaCore:GetChatManager():QueueCommand(-1, '/sexchange hair 32') end):once(delay)
end, "Blink on JA use")
]]

--Fillout your Macro Book and Set inside {Subjob={book,set}, lockstyle #}
layers.RegisterCallback("PostHandleIdle", function()
    bee_lac_utils.UpdateMacrosAndLockstyle({NIN={1,1},THF={1,1},RNG={1,1},SAM={1,1},WHM={1,1}, BLM={1,1}}, 1)
end,"Subjob profile management")

--Precast Delay. Important for Interim Casts, etc
layers.RegisterCallback("PreHandleMidcast", function (spell) 
    local castDelay = bee_lac_utils.CalculateMidcast(spell)
    local packetDelay = 0.4
    if castDelay >= packetDelay and gData.GetCurrentCall() == "HandleMidcast" then
        gFunc.SetMidDelay(castDelay)
    end
end, "Midcast Mid Delay")

--Auto-equip Dream Gloves +1/Boots +1 and Skulker's Cape for spells
layers.RegisterCallback("PostHandleMidcast", function(spell)
    gFunc.EquipSet(bee_lac_utils.StealthGearOption(spell))
end, "Stealth Enhancement")

--Auto-equip Dream Gloves +1/Boots +1 for silent oils and prism powders
layers.RegisterCallback("PreHandleItem", function(item)
    gFunc.EquipSet(bee_lac_utils.StealthGearOption(item))
end, "Stealth Enhancement (oils & powders)")

layers.UserOnLoad = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/alias add /sai /lac fwd cycle Sai')
end

layers.UserOnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/alias del /sai')
end

return layers