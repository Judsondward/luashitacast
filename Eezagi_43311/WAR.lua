local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local sets = {
    Idle = {
        Head    = "Beetle Mask +1",          --[[Head    = "Dream Ribbon",          --[[]]
        Neck    = "Tiger Stole",             --[[Neck    = "Jeweled Collar",        --[[Neck    = {"Orochi Nodowa","Orochi Nodowa +1"},--[[]]
        Ear1    = "Beetle Earring +1",       --[[Ear1    = "Merman's Earring",      --[[Ear1    = "Brutal Earring",        --[[]]
        Ear2    = "Beetle Earring +1",       --[[Ear1    = "Merman's Earring",      --[[]]
        Body    = "Beetle Harness +1",       --[[Body    = {"Barone Corazza","Conte Corazza","Scorpion Breastplate","Scorpion Breastplate +1"},--[[]]
        Hands   = "Lgn. Mittens",            --[[Hands   = "Dst. Mittens +1",       --[[Hands   = "Heavy Gauntlets",       --[[]]
        Ring1   = "Bastokan Ring",           --[[Ring1   = "Merman's Ring",         --[[Ring1   = "Defending Ring",        --[[Yeah, Right.]]
        Ring2   = "Courage Ring",            --[[Ring2   = "Merman's Ring",         --[[Ring2   = "Hercules' Ring",        --[[]]
        Back    = "Dhalmel Mantle +1",       --[[Back    = "Boxer's Mantle",        --[[]]
        Waist   = "Brave Belt",              --[[Waist   = "Warwolf Belt",          --[[]]
        Legs    = "Republic Subligar",       --[[Legs    = "Dst. Subligar +1",      --[[]]
        Feet    = "Beetle Leggings +1",      --[[Feet    = "Dst. Leggings +1",      --[[]]
	},
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {},

    DT = {},
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {},
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {},
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},
    TP_Aggressor = {},

    WS = {
        Neck    = "Spike Necklace",          --[[Neck    = ""]]
        Ring1   = "Courage Ring",            --[[Ring2   = ""]]
        Ring2   = "Courage Ring",            --[[Ring2   = ""]]
    },
    WS_HighAcc = {},

    Warcry = {},
    Provoke = {},

    DW = {
        Ear1 = 'Stealth Earring',
    },
    SAM = {
        Ear1 = 'Attila\'s Earring',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    -- AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    -- AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == 'Warcry') then
        gFunc.EquipSet(sets.Warcry)
    elseif (action.Name == 'Provoke') then
        gFunc.EquipSet(sets.Provoke)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'dw'})
    gcdisplay.CreateToggle('DW', false)
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'dw'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'dw') then
        gcdisplay.AdvanceToggle('DW')
        gcinclude.Message('DW', gcdisplay.GetToggle('DW'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local aggressor = gData.GetBuffCount('Aggressor')
    if (aggressor == 1 and gcdisplay.IdleSet == 'LowAcc') then
        gFunc.EquipSet(sets.TP_Aggressor)
    end

    local player = gData.GetPlayer()
    if (player.SubJob == 'SAM') then
        gFunc.EquipSet(sets.SAM)
    end
    if (gcdisplay.GetToggle('DW') and player.Status == 'Engaged') then
        gFunc.EquipSet(sets.DW)
    end

    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
