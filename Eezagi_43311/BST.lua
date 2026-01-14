layers = gFunc.LoadFile('layers\\layers.lua')
local bee_lac_utils = gFunc.LoadFile('..\\common\\bee_lac_utils.lua')
gFunc.LoadFile('..\\common\\sticky.lua')

local idleMode = layers.CreateModeGroup('Fish', {'Off', 'Fish'}, '^F1')
local Sai = layers.CreateModeGroup('Sai', {'Off', 'Sai'}, '^f2')
local AccuracyMode = layers.CreateModeGroup('Accuracy', {'NormalAcc', 'MidAcc', 'HighAcc'}, 'f9') -- remove ,'r' if wanna use a macro like /lac fwd cycle Accuracy

--[[
        Gear Sets
--]]
layers.Sets.Fish.Idle = {
    Range   = 'Lu Shang\'s Rod',
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

layers.Sets.Idle_Priority = {
        Head    = {'Centurion\'s Visor', 'Beetle Mask +1', 'Bone Mask +1', 'Legionnaire\'s Cap'},
        Neck    = {'Spike Necklace', 'Dog collar'},
        Ear1    = {'Beetle Earring +1', 'Bone Earring +1', 'Opal Earring'},
        Ear2    = {'Beetle Earring +1', 'Bone Earring +1', 'Opal Earring'},
        Body    = {'Ryl.Sqr. Chainmail', 'Ctr. Scale Mail', 'Beetle Harness +1', 'Bone Harness +1', 'Lgn. Harness'},
        Hands   = {'Battle Gloves'},
        Ring1   = {'Woodsman Ring', 'Balance Ring', 'Bastokan Ring'},
        Ring2   = {'Woodsman Ring', 'Balance Ring'},
        Back    = {'Dhalmel Mantle +1', 'Rabbit Mantle'},
        Waist   = {'Tilt Belt','Brave Belt', 'Leather Belt'},
        Legs    = {'Republic Subligar', 'Lgn. Subligar', 'Brass Subligar'},
        Feet    = {'Ctr. Greaves', 'Btl. Leggings +1', 'Bone Leggins +1', 'Lgn. Leggings'}
}

layers.Sets['Nation'].Idle = { Body = "Republic Aketon"}

layers.Sets.Engaged_Priority = {
        Head    = {'Centurion\'s Visor', 'Beetle Mask +1', 'Bone Mask +1', 'Legionnaire\'s Cap'},
        Neck    = {'Spike Necklace', 'Dog collar'},
        Ear1    = {'Beetle Earring +1', 'Bone Earring +1', 'Opal Earring'},
        Ear2    = {'Beetle Earring +1', 'Bone Earring +1', 'Opal Earring'},
        Body    = {'Ryl.Sqr. Chainmail', 'Ctr. Scale Mail', 'Beetle Harness +1', 'Bone Harness +1', 'Lgn. Harness'},
        Hands   = {'Battle Gloves'},
        Ring1   = {'Woodsman Ring', 'Balance Ring', 'Bastokan Ring'},
        Ring2   = {'Woodsman Ring', 'Balance Ring'},
        Back    = {'Dhalmel Mantle +1', 'Rabbit Mantle'},
        Waist   = {'Tilt Belt','Brave Belt', 'Leather Belt'},
        Legs    = {'Republic Subligar', 'Lgn. Subligar', 'Brass Subligar'},
        Feet    = {'Ctr. Greaves', 'Btl. Leggings +1', 'Bone Leggins +1', 'Lgn. Leggings'}
}

layers.Sets.Precast = {
    --Ear1    = "Loquac. Earring",
}

layers.Sets.Midcast = {
    --Waist   = "Swift Belt",
}

layers.Sets.HighAcc.Engaged = {
    --Waist   = "Life Belt",
}

layers.Sets.HandleWeaponskill = {
    Neck    = 'Spike Necklace',
    Hands   = 'Custom M Gloves',
    Ring1   = 'Courage Ring',
    Ring2   = 'Courage Ring',
    Legs    = 'Republic Subligar'
}

--[[
        Misc Logic
--]]

--Fillout your Macro Book and Set inside {Subjob={book,set}, lockstyle #}
layers.RegisterCallback("PostHandleIdle", function()
    bee_lac_utils.UpdateMacrosAndLockstyle({NIN={9,1}}, 1)
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

--Default to Party Chat on load
layers.UserOnLoad = function()
    --bee_lac_utils.SetChatmode()
    --(function() AshitaCore:GetChatManager():QueueCommand(1, '/displayhead off'); end):once(3)-- delay in seconds
end

layers.UserOnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/displayhead on')
end

--gFunc.LoadFile('..\\common\\helm_utils.lua')
return layers