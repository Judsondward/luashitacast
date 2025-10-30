--[[
    Pets that need their own special sets. 

    sets.Idle_Carbuncle = gFunc.Combine(Idle_Base, {});

    local SpecialIdleTable = T{ Carbuncle, etc.}

    if SpecialIdleTable:ontains(pet.Name) then

    else
        the shit that's arleady there
]]

local profile = {};

local sets = {

    FriendlessHo ={
        Main    = 'Earth Staff', --Terra's Staff
        --Sub     = '',
        Ammo    = 'Hedgehog Bomb',
        Head    = 'Summoner\'s Horn', --Summoner's Horn +1
        Neck    = 'Evasion Torque',
        Ear1    = 'Loquac. Earring',
        Ear2    = 'Magnetic Earring',
        Body    = 'Yinyang Robe',
        Hands   = 'Summoner\'s Brcr.', --Summoner's Brcr. +1
        Ring1   = 'Tamas Ring',
        Ring2   = 'Evoker\'s Ring',
        Back    = 'Astute Cape',
        Waist   = 'Hierarch Belt',
        Legs    = 'Evoker\'s Spats', --Evoker's Spats +1
        Feet    = 'Rostrum Pumps' --Herald's Gaiters
    },

    Idle_Base ={
        --Main    = 'Bahamut\'s Staff', 
        --Sub     = '',
        Ammo    = 'Hedgehog Bomb',
        Head    = 'Summoner\'s Horn', --Summoner's Horn +1
        Neck    = 'Smn. Torque',
        Ear1    = 'Beastly Earring',
        Ear2    = 'Magnetic Earring', --Summoning Earring
        Body    = 'Yinyang Robe', --Penance Robe  --Summoner's Doublet (day dependant)
        Hands   = 'Summoner\'s Brcr.', --Nashira Gages
        Ring1   = 'Tamas Ring',
        Ring2   = 'Evoker\'s Ring',
        Back    = 'Astute Cape',
        Waist   = 'Hierarch Belt',
        Legs    = 'Evoker\'s Spats', --Evoker's Spats +1
        Feet    = 'Evk. Pigaches +1'
    },

 --   RPhys ={
        --Main    = '',
        --Sub     = '',
 --       Ammo    = 'Hedgehog Bomb',
 --       Head    = 'Evoker\'s Horn', --Evoker's Horn +1
 --       Neck    = 'Smn. Torque',
 --       Ear1    = 'Beastly Earring',
 --       Ear2    = 'Magnetic Earring', --Summoning Earring
 --       Body    = 'Yinyang Robe', --Summoner's Doublet
 --       Hands   = 'Summoner\'s Brcr.', --Nashira Gages
 --       Ring1   = 'Tamas Ring',
 --       Ring2   = 'Evoker\'s Ring',
 --       Back    = 'Astute Cape',
 --       Waist   = 'Hierarch Belt',
 --       Legs    = 'Evoker\'s Spats', --Evoker's Spats +1
 --       Feet    = 'Smn. Pigaches +1'
 --   },

    BP_Base ={
        --Main    = '',
        --Sub     = '',
        Ammo    = 'Hedgehog Bomb',
        Head    = 'Evoker\'s Horn', --Buffalo helm
        Neck    = 'Smn. Torque',
        Ear1    = 'Beastly Earring',
        Ear2    = 'Magnetic Earring', --Summoning Earring
        Body    = 'Yinyang Robe', --Shepherd's Doublet
        Hands   = 'Summoner\'s Brcr.', --Summoner's Brcr. +1
        Ring1   = 'Tamas Ring',
        Ring2   = 'Evoker\'s Ring',
        Back    = 'Astute Cape',
        Waist   = 'Hierarch Belt',
        Legs    = 'Evoker\'s Spats', --Evoker's Spats +1
        Feet    = 'Nashira crackows'
    },

 --   Ward ={
        --Main    = '',
        --Sub     = '',
 --       Ammo    = 'Hedgehog Bomb',
 --       Head    = 'Evoker\'s Horn', --Evoker's Horn +1
 --       Neck    = 'Smn. Torque',
 --       Ear1    = 'Beastly Earring',
 --       Ear2    = 'Magnetic Earring', --Summoning Earring
 --       Body    = 'Yinyang Robe',
 --       Hands   = 'Summoner\'s Brcr.', --Summoner's Brcr. +1
 --       Ring1   = 'Tamas Ring',
 --       Ring2   = 'Evoker\'s Ring',
 --       Back    = 'Astute Cape',
 --       Waist   = 'Hierarch Belt',
 --       Legs    = 'Austere Slops', --Penance Slops
 --       Feet    = 'Nashira crackows'
 --   },

    Healing ={
        Main    = 'Light Staff', --Apollo's Staff
        --Sub     = '',
        Ammo    = 'Hedgehog Bomb',
        Head    = 'Errant hat', --Mahatma hat
        Neck    = 'Promise Badge',
        Ear1    = 'Loquac. Earring',
        Ear2    = 'Magnetic Earring',
        Body    = 'Errant Hpl.', --Mahatma Hpl.
        Hands   = 'Devotee\'s mitts',
        Ring1   = 'Sapphire Ring',
        Ring2   = 'Tamas Ring',
        Back    = 'Rainbow Cape',
        Waist   = 'Mrc.Cpt. Belt',
        Legs    = 'Errant Slops', --Mahatma Slops
        Feet    = 'Errant Pigaches' --Mahatma Pigaches
    },

    Enhancing ={
        Main    = 'Water Staff', --Apollo's Staff
        --Sub     = '',
        Ammo    = 'Hedgehog Bomb',
        Head    = 'Errant hat', --Mahatma hat
        Neck    = 'Enhancing Torque',
        Ear1    = 'Loquac. Earring',
        Ear2    = 'Magnetic Earring',
        Body    = 'Errant Hpl.', --Mahatma Hpl.
        Hands   = 'Devotee\'s mitts',
        Ring1   = 'Sapphire Ring',
        Ring2   = 'Tamas Ring',
        Back    = 'Merciful Cape',
        Waist   = 'Mrc.Cpt. Belt',
        Legs    = 'Errant Slops', --Mahatma Slops
        Feet    = 'Errant Pigaches' --Mahatma Pigaches
    },

    Resting ={
        Main    = 'Dark Staff', --Pluto's staff
        --Sub     = '',
        Ammo    = 'Hedgehog Bomb',
        Head    = 'Summoner\'s Horn', --Summoner's Horn +1
        Neck    = 'Checkered Scarf',
        Ear1    = 'Relaxing Earring',
        Ear2    = 'Magnetic Earring',
        Body    = 'Errant Hpl.', --Mahatma Hpl.
        Hands   = 'Summoner\'s Brcr.', --Summoner's Brcr. +1
        Ring1   = 'Tamas Ring',
        Ring2   = 'Evoker\'s Ring',
        Back    = 'Astute Cape',
        Waist   = 'Hierarch Belt',
        Legs    = 'Baron\'s Slops',
        Feet    = 'Rostrum Pumps'
    },

    TP_Base ={
        --Main    = '',
        --Sub     = '',
        --Ranged  = '',
        --Ammo    = '',
        Head    = 'Crow Beret', 
        Neck    = 'Agile Gorget', --Temp. Torque
        --Ear1    = '',
        --Ear2    = '',
        --Body    = '',
       -- Hands   = '',
        --Ring1   = '',
        --Ring2   = '',
        --Back    = '',
        Waist   = 'Mithran Stone',
        Legs    = 'Crow Hose',
        --Feet    = ''
    },

	WS_Base ={
        --Main    = '',
        --Sub     = '',
        --Ranged  = '',
        --Ammo    = '',
        Head    = 'Pineal hat', 
        Neck    = 'Agile gorget', --Temp. Torque
        --Ear1    = '',
        --Ear2    = '',
        Body    = 'Crow Jupon',
        Hands   = 'Battle Bracers +1',
        --Ring1   = '',
        --Ring2   = '',
        --Back    = '',
        Waist   = 'Mithran Stone',
        Legs    = 'Crow Hose',
        --Feet    = ''
    },

    PreCast ={
        --Main    = '',
        --Sub     = '',
        Ammo    = 'Hedgehog Bomb',
        Head    = 'Nashira\'s Turban',
        Neck    = 'Smn. Torque',
        Ear1    = 'Beastly Earring',
        Ear2    = 'Loquac. Earring',
        Body    = 'Nashira Manteel',
        Hands   = 'Summoner\'s Brcr.', --Nashira Gages
        Ring1   = 'Tamas Ring', 
        Ring2   = 'Evoker\'s Ring', 
        Back    = 'Astute Cape',
        Waist   = 'Hierarch Belt', --Swift belt
        Legs    = 'Nashira Seraweels',
        Feet    = 'Rostrum Pumps'
    },

    MidCast ={
        --Main    = '',
        --Sub     = '',
        Ammo    = 'Hedgehog Bomb',
        Head    = 'Evoker\'s Horn', --Evoker's Horn +1
        Neck    = 'Smn. Torque',
        Ear1    = 'Beastly Earring',
        Ear2    = 'Magnetic Earring', --Summoning Earring
        Body    = 'Yinyang Robe',
        Hands   = 'Summoner\'s Brcr.', --Summoner's Brcr. +1
        Ring1   = 'Tamas Ring',
        Ring2   = 'Evoker\'s Ring',
        Back    = 'Astute Cape',
        Waist   = 'Hierarch Belt', --Druid's Rope
        Legs    = 'Austere Slops', --Penance Slops
        Feet    = 'Nashira Crackows'
    },
};

profile.Sets = sets;

sets.Idle_Carbuncle = gFunc.Combine(sets.Idle_Base, {Hands = 'Carbuncle Mitts'});
sets.Idle_Garuda     = gFunc.Combine(sets.Idle_Base, {});
sets.BP_RPhys       = gFunc.Combine(sets.BP_Base, {
    Feet    = 'Smn. Pigaches +1'
});
sets.BP_RMag        = gFunc.Combine(sets.BP_Base, {});
sets.BP_Ward        = gFunc.Combine(sets.BP_Base, {
    Legs    = 'Austere Slops' --Penance Slops
});
sets.BP_SRuby        = gFunc.Combine(sets.BP_Base, {
    Hands   = 'Carbuncle\'s Cuffs'
});
--profile.Packer = {};

local Settings = {
    LockAll = false,
    petName = 'Bahamut',   -- You wish
    petEleVar = 'Light'
};

local EleStaffTable = {
    --[[
    To Update. Change only the right side of the equal's sign.
    a \ character needs to go before any apostraphe.

    i.e.: ['Ice'] = 'Aquilo\'s Staff',
    ]]
    ['Earth']   = 'Earth Staff',
    ['Wind']    = 'Wind Staff',
    ['Water']   = 'Water Staff',
    ['Fire']    = 'Fire Staff',
    ['Ice']     = 'Ice Staff',
    ['Thunder'] = 'Thunder Staff',
    ['Light']   = 'Light Staff',
    ['Dark']    = 'Dark Staff'
};

local WSTable = T{
    ['Heavy Swing'] = 'WS_Base',
    ['Rock Crusher'] = 'WS_Base',
    ['Earth Crusher'] = 'WS_Base',
    ['Starburst'] = 'WS_Base',
    ['Sunburst'] = 'WS_Base',
    ['Shell Crusher'] = 'WS_Base',
    ['Full Swing'] = 'WS_Base',
    ['Spirit Taker'] = 'WS_Base',
    ['Retribution'] = 'WS_Base',
    ['Cataclysm'] = 'WS_Base',
    ['Shattersoul'] = 'WS_Base',
    ['Gate of Tartarus'] = 'WS_Base',
    ['Myrkr'] = 'WS_Base',
    ['Vidohunir'] = 'WS_Base',
    ['Garland of Bliss'] = 'WS_Base',
    ['Omniscience'] = 'WS_Base',
    ['Tartarus Torpor'] = 'WS_Base'
};

local BPTable = T{
    --Carbuncle M Rage
    ['Searing Light'] = 'RMag',
    ['Meteorite'] = 'RMag',
    ['Holy Mist'] = 'RMag',
    --Carbuncle P Rage
    ['Poison Nails'] = 'RPhys',
    --Carbuncle Ward
    ['Healing Ruby'] = 'Ward',
    ['Shining Ruby'] = 'SRuby',
    ['Glittering Ruby'] = 'Ward',
    ['Healing Ruby II'] = 'Ward',
    ['Soothing Ruby'] = 'Ward',
    ['Pacifying Ruby'] = 'Ward',
    --Fenrir M Rage
    ['Howling Moon'] = 'RMag',
    ['Lunar Bay'] = 'RMag',
    --Fenrir P Rage
    ['Moonlit Charge'] = 'RPhys',
    ['Crescent Fang'] = 'RPhys',
    ['Eclipse Bite'] = 'RPhys',
    ['Impact'] = 'RPhys',
    --Fenrir Ward
    ['Lunar Cry'] = 'Ward',
    ['Lunar Roar'] = 'Ward',
    ['Ecliptic Growl'] = 'Ward',
    ['Ecliptic Howl'] = 'Ward',
    ['HeavenWard Howl'] = 'Ward',
    --Ifrit M Rage
    ['Inferno'] = 'RMag',
    ['Fire II'] = 'RMag',
    ['Fire IV'] = 'RMag',
    ['Meteor Strike'] = 'RMag',
    ['Conflag Strike'] = 'RMag',
    --Ifrit P Rage
    ['Punch'] = 'RPhys',
    ['Burning Strike'] = 'RPhys',
    ['Double Punch'] = 'RPhys',
    ['Flaming Crush'] = 'RPhys',
    --Ifrit Ward
    ['Crimson Howl'] = 'Ward',
    ['Inferno Howl'] = 'Ward',
    --Titan M Rage
    ['Earthen Fury'] = 'RMag',
    ['Stone II'] = 'RMag',
    ['Stone IV'] = 'RMag',
    ['Geocrush'] = 'RMag',
    --Titan P Rage
    ['Rock Throw'] = 'RPhys',
    ['Rock Buster'] = 'RPhys',
    ['Megalith Throw'] = 'RPhys',
    ['Mountain Buster'] = 'RPhys',
    ['Crag Throw'] = 'RPhys',
    --Titan Ward
    ['Earthen Ward'] = 'Ward',
    ['Earthen Armor'] = 'Ward',
    --Leviathan M Rage
    ['Tidal Wave'] = 'RMag',
    ['Water II'] = 'RMag',
    ['Water IV'] = 'RMag',
    ['Grand Fall'] = 'RMag',
    --Leviathan P Rage
    ['Barracuda Dive'] = 'RPhys',
    ['Tail Whip'] = 'RPhys',
    ['Spinning Dive'] = 'RPhys',
    --Leviathan Ward
    ['Slowga'] = 'Ward',
    ['Spring Water'] = 'Ward',
    ['Tidal Roar'] = 'Ward',
    ['Soothing Current'] = 'Ward',
    --Garuda M Rage
    ['Aerial Blast'] = 'RMag',
    ['Aero II'] = 'RMag',
    ['Aero IV'] = 'RMag',
    ['Wind Blade'] = 'RMag',
    --Garuda P Rage
    ['Claw'] = 'RPhys',
    ['Predator Claws'] = 'RPhys',
    --Garuda Ward
    ['Aerial Armor'] = 'Ward',
    ['Whispering Wind'] = 'Ward',
    ['Hastega'] = 'Ward',
    ['Fleet Wind'] = 'Ward',
    ['Hastega II'] = 'Ward',
    --Shiva M Rage
    ['Diamond Dust'] = 'RMag',
    ['Blizzard II'] = 'RMag',
    ['Blizzard IV'] = 'RMag',
    ['Heavenly Strike'] = 'RMag',
    --Shiva P Rage
    ['Axe Kick'] = 'RPhys',
    ['Double Slap'] = 'RPhys',
    ['Rush'] = 'RPhys',
    --Shiva Ward
    ['Frost Armor'] = 'Ward',
    ['Sleepga'] = 'Ward',
    ['Diamond Storm'] = 'Ward',
    ['Crystal Blessing'] = 'Ward',
    --Ramuh M Rage
    ['Judgment Bolt'] = 'RMag',
    ['Thunder II'] = 'RMag',
    ['Thunderspark'] = 'RMag',
    ['Thunder IV'] = 'RMag',
    ['Thunderstorm'] = 'RMag',
    --Ramuh P Rage
    ['Shock Strike'] = 'RPhys',
    ['Chaotic Strike'] = 'RPhys',
    ['Volt Strike'] = 'RPhys',
    --Ramuh Ward
    ['Rolling Thunder'] = 'Ward',
    ['Lightning Armor'] = 'Ward',
    ['Shock Squall'] = 'Ward',
    --Diabolos M Rage
    ['Ruinous Omen'] = 'RMag',
    ['Nether Blast'] = 'RMag',
    ['Night Terror'] = 'RMag',
    --Diabolos P Rage
    ['Camisado'] = 'RPhys',
    ['Blindside'] = 'RPhys',
    --Diabolos Ward: Somn. is not a mistake.
    ['Somnolence'] = 'RMag',
    ['Nightmare'] = 'Ward',
    ['Ultimate Terror'] = 'Ward',
    ['Noctoshield'] = 'Ward',
    ['Dream Shroud'] = 'Ward',
    ['Pavor Nocturnus'] = 'Ward',
    --Cait Sith M Rage
    ['Level ? Holy'] = 'RMag',
    --Cait Sith P Rage
    ['Regal Scratch'] = 'RPhys',
    --Cait Sith Ward
    ['Altana\'s Favor'] = 'Ward',
    ['Raise II'] = 'Ward',
    ['Mewing Lullaby'] = 'Ward',
    ['Reraise II'] = 'Ward',
    ['Eerie Eye'] = 'Ward',
    --Siren M Rage
    ['Clarsach Call'] = 'RMag',
    ['Sonic Buffet'] = 'RMag',
    ['Tornado II'] = 'RMag',
    --Siren P Rage
    ['Welt'] = 'RPhys',
    ['Roundhouse'] = 'RPhys',
    ['Hysteric Assault'] = 'RPhys',
    --Siren Ward
    ['Lunatic Voice'] = 'Ward',
    ['Katabatic Blades'] = 'Ward',
    ['Chinook'] = 'Ward',
    ['Bitter Elegy'] = 'Ward',
    ['Wind\'s Blessing'] = 'Ward',
    --Odin M Rage
    ['Zantetsuken'] = 'RMag',
    --Alexander Ward
    ['Perfect Defense'] = 'Ward',
    --Atomos Type Null
    ['Deconstruction'] = 'RMag',
    ['Chronoshift'] = 'RMag'
};

local PetEleTable = T{
    ['Carbuncle']   = 'Light',
    ['Titan']       = 'Earth',
    ['Garuda']      = 'Wind',
    ['Leviathan']   = 'Water',
    ['Ifrit']       = 'Fire',
    ['Shiva']       = 'Ice',
    ['Ramuh']       = 'Thunder',
    ['Fenrir']      = 'Dark',
    ['Diabolos']    = 'Dark',
    ['LightSpirit'] = 'Light',
    ['EarthSpirit'] = 'Earth',
    ['WindSpirit']  = 'Wind',
    ['WaterSpirit'] = 'Water',
    ['FireSpirit']  = 'Fire',
    ['IceSpirit']   = 'Ice',
    ['ThunderSpirit'] = 'Thunder',
    ['DarkSpirit']  = 'Dark',
    ['Cait Sith']   = 'Light',
    ['Siren']      	= 'Wind',
    ['Odin']  		= 'Dark',
    ['Atomos']  	= 'Dark',
    ['Alexander']   = 'Light'
};

gcinclude = gFunc.LoadFile('common/gcinclude.lua');
	
profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(-1, '/macro book 5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/macro set 1');
    --AshitaCore:GetChatManager():QueueCommand(-1, '/lockstyleset 12');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind F7 /lac fwd LockAll');
end

profile.OnUnload = function()
    gcinclude.Unload();
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F7');
end

profile.HandleCommand = function(args)
	if(args[1] == 'LockAll') then
        Settings.LockAll = not Settings.LockAll;
        if(Settings.LockAll) then
            AshitaCore:GetChatManager():QueueCommand(2, '/lac disable');
        else
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable');
        end
	end
end

profile.HandleDefault = function()
    local pet = gData.GetPet();
    local player = gData.GetPlayer();
    local envVar = gData.GetEnvironment();

    if(player.Status == 'Engaged') then
        gFunc.EquipSet(sets.TP_Base);
    elseif(player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
        -- Idle SMN BS Goes here
        if(pet ~= nil) then 
            --Just use an Or when Luna asks about this later.
            if (Settings.petName == 'Carbuncle') then
                gFunc.EquipSet('Idle_' .. Settings.petName);     
            else
                gFunc.EquipSet(sets.Idle_Base); 
            end
            gFunc.Equip('main', EleStaffTable[Settings.petEleVar]);
            if (envVar.DayElement == PetEleVar) and (Settings.petName ~= 'Carubuncle') then
                gFunc.Equip('Body', 'Summoner\'s Dblt.');
            end
            if (envVar.WeatherElement == PetEleVar) then
                gFunc.Equip('Head', 'Summoner\'s Horn');
            end
        else
            gFunc.EquipSet(sets.FriendlessHo);
        end
    end
end

profile.HandleAbility = function()
    local action = gData.GetAction();

    if(action ~= nil) and BPTable:contains(action.Name) then
        gFunc.EquipSet('BP_' .. BPTable[action.Name]);
    end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local action = gData.GetAction();
    if (action.ActionType == 'Spell') then
        gFunc.EquipSet(sets.PreCast);
    end
end

profile.HandleMidcast = function()
    local action = gData.GetAction();
    if (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
    elseif (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Healing);
    elseif (action.Skill == 'Summoning') then
        gFunc.EquipSet(sets.MidCast);
        Settings.petName = action.Name;
        Settings.petEleVar = PetEleTable[Settings.petName];
    end
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if(WSTable:contains(action.Name)) then
        -- I've made a set for it.
        gFunc.EquipSet(WSTable[action.Name]);
    else
        -- I didn't. 
        gFunc.EquipSet(sets.WS_Base);
    end
end

return profile;