local version = "2025.05.09.01"

--[[
    Fill out gear you own here ! !
--]]
local Obi       = {
    Fire    = {},
    Earth   = {},
    Water   = {},
    Wind    = {},
    Ice     = {},
    Thunder = {},
    Light   = {},
    Dark    = {}
}

local Staff     = {
    Fire        = {},
    Earth       = {},
    Water       = {},
    Wind        = {},
    Ice         = {},
    Thunder     = {},
    Light       = {},
    Dark        = {},
    DrainAspir  = {},
}

local Stealth = {
    Hands="Dream Mittens +1",
    Feet="Dream Boots +1",
    --Back="Skulker's Cape",
}

local UggalepihPendant = {
    --Neck="Uggalepih Pendant",
}

local DiabolosRing = {
    --Ring1 = "Diabolos's Ring",
}

local MastersCastersBracelets = {
    --Hand = "Mst.Cst. Bracelets",
}

local Aketon        = {
    Bastok      = {Body = "Republic Aketon"},
    Sandoria    = {Body = "Kingdom Aketon"},
    Windurst    = {Body = "Federation Aketon"},
    Jeuno       = {Body = "Ducal Aketon"},
}

--for the purposes of calculating midcast mid delay
local FastCastGearTable = {
    LoquaciousEarring   = {owned=false, value=.02},
    RostrumPumps        = {owned=false, value=.03, jobs={WHM=true,BLM=true,SMN=true,BRD=true,PUP=true,GEO=true,SCH=true}},
    WarlocksMantle      = {owned=false, value=.02},
    WarlocksChapeau     = {owned=false, value=.1},
    DuelistsTabard      = {owned=false, value=.1},
    RuckesRung          = {owned=false, value=.1},
    CureClogs           = {owned=false, value=.02},
    CureCastMerits      = {owned=false, value=.2},
    Manteel             = {owned=false, value=.12}, --change this to .14 if you have HQ
    MinstrelsRing       = {owned=false, value=.25},
}

local BRDMinstrelProcHP = 1100

--[[
    End of gear block
--]]

local obi_staff_skills = {
    ['Divine Magic'] = true, 
    ['Healing Magic'] = true, --conditional
    ['Enhancing Magic'] = false, 
    ['Enfeebling Magic'] = true, 
    ['Elemental Magic'] = true, 
    ['Dark Magic'] = true, --conditional (just tractor)
    ['Summoning'] = false, 
    ['Ninjutsu'] = true, --conditional
    ['Singing'] = true, --conditional
    ['Blue Magic'] = true, --conditional
    ['Geomancy'] = true, --conditional
}

local MAB_impacted = {
    ['Divine Magic'] = true, 
    ['Healing Magic'] = false,
    ['Enhancing Magic'] = false, 
    ['Enfeebling Magic'] = false, 
    ['Elemental Magic'] = true, 
    ['Dark Magic'] = false,
    ['Summoning'] = false, 
    ['Ninjutsu'] = true, --conditional
    ['Singing'] = false, 
    ['Blue Magic'] = true, --conditional
    ['Geomancy'] = true, --conditional
}

local element_weaknesses = {
    Light = 'Dark',
    Dark = 'Light',
    Fire = 'Water',
    Water = 'Thunder',
    Thunder = 'Earth',
    Earth = 'Wind',
    Wind = 'Ice',
    Ice = 'Fire',
}

local previous_subjob = nil

local function get_current_subjob()
	return gData.GetPlayer().SubJob
end

local function SetLockStyle(lockstyle_number)
	if(lockstyle_number) then 
		AshitaCore:GetChatManager():ExecuteScriptString("/wait 3;/lockstyleset "..tostring(lockstyle_number), '',true)
	end
end

local function SetMacros(book_number, page_number)
	AshitaCore:GetChatManager():QueueCommand(1, '/macro book ' .. book_number);
	AshitaCore:GetChatManager():QueueCommand(1, '/macro set ' .. page_number);
end

local function UpdateMacrosAndLockstyle(macro_table,lock_style_set)
	local current_subjob = get_current_subjob()
	if current_subjob ~= 'NON' and macro_table[current_subjob] and (not previous_subjob or current_subjob ~= previous_subjob) then
		SetMacros(unpack(macro_table[current_subjob]))
		SetLockStyle(lock_style_set)
    elseif current_subjob ~= 'NON' and macro_table['Default'] and (not previous_subjob or current_subjob ~= previous_subjob) then
        SetMacros(unpack(macro_table['Default']))
		SetLockStyle(lock_style_set)
	end
	previous_subjob = current_subjob
end

local function SetChatmode()
    AshitaCore:GetChatManager():QueueCommand(1, '/cm p');
end

local function CalculateMidcast(spell)
    local player = gData.GetPlayer()
    local classifiers = layers.GetClassifiers('Spell',spell.Name)
    local fastCastValue = 0
    local otherCastTimeBonus = 0
    if(player.MainJobLevel >= 75) then
        if FastCastGearTable.LoquaciousEarring.owned then
            fastCastValue = fastCastValue + FastCastGearTable.LoquaciousEarring.value
        end
        if FastCastGearTable.RostrumPumps.owned and FastCastGearTable.RostrumPumps.jobs[player.MainJob] then
            fastCastValue = fastCastValue + FastCastGearTable.RostrumPumps.value
        end
    end
    if player.MainJob == "RDM" and player.MainJobLevel == 75 then
        fastCastValue = fastCastValue + 0.2 --Fast Cast III
        if(FastCastGearTable.WarlocksChapeau.owned) then
            fastCastValue = fastCastValue + FastCastGearTable.WarlocksChapeau.value
        end
        if(FastCastGearTable.DuelistsTabard.owned) then
            fastCastValue = fastCastValue + FastCastGearTable.DuelistsTabard.value
        end
    elseif player.MainJob == "RDM" and player.MainJobLevel >= 55 then
        fastCastValue = fastCastValue + 0.2 --Fast Cast III
    elseif player.MainJob == "RDM" and player.MainJobLevel >= 35 then
        fastCastValue = fastCastValue + 0.15 --Fast Cast II
    elseif player.MainJob == "RDM" and player.MainJobLevel >= 15 then
        fastCastValue = fastCastValue + 0.1 --Fast Cast I
    end 

    if player.SubJob == "RDM" and player.SubJobLevel >= 15 then
        if(FastCastGearTable.WarlocksMantle.owned) then
            fastCastValue = fastCastValue + FastCastGearTable.WarlocksMantle.value
        end
        if player.SubJobLevel >= 35 then
            fastCastValue = fastCastValue + 0.15 --Fast Cast IdI
        else
            fastCastValue = fastCastValue + 0.1 --Fast Cast I
        end
    end

    --apply WHM-specific cure bonuses
    if classifiers['Cure'] and player.MainJob == "WHM" and player.MainJobLevel >= 75 then
        if(FastCastGearTable.RuckesRung.owned) then
            otherCastTimeBonus = otherCastTimeBonus + FastCastGearTable.RuckesRung.value
        end
        if(FastCastGearTable.CureCastMerits.owned) then
            otherCastTimeBonus = otherCastTimeBonus + FastCastGearTable.CureCastMerits.value
        end
    end
    if classifiers['Cure'] and player.MainJob == "WHM" and player.MainJobLevel >= 59 then
        if(FastCastGearTable.CureClogs.owned) then
            otherCastTimeBonus = otherCastTimeBonus + FastCastGearTable.CureClogs.value
            fastCastValue = fastCastValue - FastCastGearTable.RostrumPumps.value
        end
    end

    --the BRD bonuses
    if classifiers['Singing'] and player.MainJob == "BRD" and player.MainJobLevel >= 72 then
        if(FastCastGearTable.Manteel.owned) then
            otherCastTimeBonus = otherCastTimeBonus + FastCastGearTable.Manteel.value
        end
    end
    if classifiers['Singing'] and player.MainJob == "BRD" and player.MainJobLevel >= 50 and player.HP < BRDMinstrelProcHP then
        if(FastCastGearTable.MinstrelsRing.owned) then
            otherCastTimeBonus = otherCastTimeBonus + FastCastGearTable.MinstrelsRing.value
        end
    end
    
    --floor fastcast
    if(fastCastValue > .4) then fastCastValue = 0.4 end

    local castTimeBonus = fastCastValue + otherCastTimeBonus
    
    local minimumBuffer = 0.3
    local midcast_delay = ((spell.CastTime * (1 - castTimeBonus)) / 1000) - minimumBuffer
    return midcast_delay
end

local function PoleOption(action)
    if (action.Name == 'Drain' or action.Name == 'Aspir') and gData.GetEnvironment().WeatherElement == 'Dark' then
        return Staff.DrainAspir
    else
        return {}
    end
end

local function EleObiOption(action)

    local classifiers = layers.GetClassifiers('Spell',action.Name)
    local weather_element = gData.GetEnvironment().WeatherElement
    local is_double_weather = string.find(gData.GetEnvironment().Weather, '2x') ~= nil
    local day_element = gData.GetEnvironment().DayElement
    
    local day_weather_points = 0
    if(day_element == action.Element) then 
        day_weather_points = day_weather_points + 1
    elseif(day_element == element_weaknesses[action.Element]) then
        day_weather_points = day_weather_points - 1
    end
    if(weather_element == action.Element and is_double_weather) then
        day_weather_points = day_weather_points + 2.5
    elseif(weather_element == action.Element and not is_double_weather) then
        day_weather_points = day_weather_points + 1
    elseif(weather_element == element_weaknesses[action.Element] and is_double_weather) then
        day_weather_points = day_weather_points - 2.5
    elseif(weather_element == element_weaknesses[action.Element] and not is_double_weather) then
        day_weather_points = day_weather_points - 1
    end

    -- gFunc.Message('points: ' .. tostring(day_weather_points))
    -- gFunc.Message(weather_element)
    -- gFunc.Message(action.Element)
    -- gFunc.Message(is_double_weather)

    if day_weather_points > 0
        and gData.GetPlayer().MainJobLevel >= 71
        and obi_staff_skills[action.Skill]
        and not classifiers['Regen']
        and not classifiers['Status Removal']
        and not classifiers['Raise'] 
        and not classifiers['Enhancing Ninjutsu'] 
        and not classifiers['Enhancing Singing'] 
        and action.Name ~= "Tractor" then
        return Obi[action.Element]
    else
        return {}
    end
end

local function StealthGearOption(action)
    local is_stealth_action = action.Name == 'Sneak' or action.Name == 'Invisible'
        or action.Name == 'Silent Oil' or action.Name == 'Prism Powder'
    if is_stealth_action and gData.GetPlayer().MainJobLevel >= 50 then
            return Stealth
    elseif is_stealth_action then
        return {Hands=Stealth.Hands,
            Feet=Stealth.Feet}
    else
        return {}
    end
end

local function MasterCastersOption(action)
    local player = gData.GetPlayer()
    if layers.conquest.GetOutsideControl()
        and (player.MainJob == WHM and player.MainJobLevel >= 75) 
        and player.MainJobLevel >= 65 
        and action.skill == 'Enfeebling Magic' then
        return MastersCastersBracelets
    else
        return {}
    end
end

local function DiabolosRingOption(action)
    local player = gData.GetPlayer()
    if action.Skill == 'Dark Magic'
        and gData.GetEnvironment().DayElement == "Dark"
        and player.MPP < 85
        and player.MainJobLevel >= 65 then 
        return DiabolosRing
    else
        return {}
    end
end

local function UggalepihPendantOption(action)

    local classifiers = layers.GetClassifiers('Spell',action.Name)
    local player = gData.GetPlayer()
    if player.MainJobLevel >= 70 
        and (player.MP - action.MpCost) < (player.MaxMP*.51)
        and (
            classifiers['Elemental Spikes']
            or (MAB_impacted[action.Skill] 
            and not classifiers['Enhancing Ninjutsu'] 
            and not classifiers['Enfeebling Elemental'])
        ) then

        return UggalepihPendant
    else
        return {}
    end
end

local function AketonOption()
    local environment = gData.GetEnvironment()
    local bastok = {
        ['Bastok Markets'] = true,
        ['Bastok Mines'] = true,
        ['Port Bastok'] = true,
        ['Metalworks'] = true,
    }
    local windurst = {
        ['Port Windurst'] = true,
        ['Windurst Waters'] = true,
        ['Windurst Woods'] = true,
        ['Windurst Walls'] = true,
        ['Heavens Tower'] = true,
    }
    local sandoria = {
        ['Port San d\'Oria'] = true,
        ['Southern San d\'Oria'] = true,
        ['Northern San d\'Oria'] = true,
        ['Chateau d\'Oraguille'] = true,
    }    
    local jeuno = {
        ['Port Jeuno'] = true,
        ['Lower Jeuno'] = true,
        ['Upper Jeuno'] = true,
        ['Ru\'Lude Gardens'] = true,
    }
    if bastok[environment.Area] then
        return Aketon.Bastok
    elseif sandoria[environment.Area] then
        return Aketon.Sandoria
    elseif windurst[environment.Area] then
        return Aketon.Windurst
    elseif jeuno[environment.Area] then
        return Aketon.Jeuno
    end
end

--ripped from stickyitems layers
local function getTimeUTC()
    local ptr = ashita.memory.read_uint32(timePointer)
    ptr = ashita.memory.read_uint32(ptr)
    return ashita.memory.read_uint32(ptr + 0x0C)
end

local function getChargeStats(item)
    local currentTime = getTimeUTC()
    local useTimeRemaining = (struct.unpack('L', item.Extra, 5) + vanaOffset) - currentTime
    local remainingCharges = item.Extra:byte(2)
    return useTimeRemaining,remainingCharges
end

local function bootsCanBeUsed(useTimeRemaining,remainingCharges)
    return remainingCharges > 0 and useTimeRemaining <= 0
end

local export = {
    UggalepihPendantOption = UggalepihPendantOption,
    PoleOption = PoleOption,
    EleObiOption = EleObiOption,
    StealthGearOption = StealthGearOption,
    UggalepihPendantOption = UggalepihPendantOption,
    MasterCastersOption = MasterCastersOption,
    DiabolosRingOption = DiabolosRingOption,
    AketonOption = AketonOption,
	UpdateMacrosAndLockstyle = UpdateMacrosAndLockstyle,
	SetLockStyle = SetLockStyle,
    SetChatmode = SetChatmode,
	SetMacros = SetMacros,
    CalculateMidcast = CalculateMidcast,
}

return export