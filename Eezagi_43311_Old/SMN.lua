
local profile = {};

local sets = {

    Idle_NoPet ={
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

sets.Idle_Carbuncle = gFunc.Combine(sets.Idle_Base, {
    Hands = 'Carbuncle Mitts'
});
--sets.Idle_Garuda     = gFunc.Combine(sets.Idle_Base, {Head = 'Karura Hachigane'});
sets.BP_RPhys       = gFunc.Combine(sets.BP_Base, {
    Feet    = 'Smn. Pigaches +1'
});
sets.BP_RMag        = gFunc.Combine(sets.BP_Base, {});
sets.BP_Ward        = gFunc.Combine(sets.BP_Base, {
    Legs    = 'Austere Slops' --Penance Slops
});
sets.BP_SRuby        = gFunc.Combine(sets.BP_Ward, {
    Hands   = 'Carbuncle\'s Cuffs'
});
sets.BP_RFenrir     = gFunc.Combine(sets.BP_Base, {
    Head = 'Fenrir\'s Crown'
});
sets.PB_RLevi       = gFunc.Combine(sets.BP_Base, {
    Hands = 'Evoker\'s Gages'
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
    elseif(args[1] == 'Salvage') then
        Settings.Salvage_Mode = not Settings.Salvage_Mode;
        if(Settings.Salvage_Mode) then
            gFunc.Message("Salvage Mode is ON");
        else
            gFunc.Message("Salvage Mode is OFF");
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
            if (Settings.petName == 'Carbuncle') --[[or (Settings.petName == 'Garuda')]] then
                gFunc.EquipSet('Idle_' .. Settings.petName);     
            else
                gFunc.EquipSet(sets.Idle_Base); 
            end
            gFunc.Equip('main', EleStaffTable[Settings.petEleVar])
            if (Settings.petName == 'Carbuncle') then
                --Do Nothing
            elseif (envVar.DayElement == Settings.petEleVar) then
                gFunc.Equip('Body', 'Summoner\'s Dblt.');
            end
            if (envVar.WeatherElement == Settings.petEleVar) then
                gFunc.Equip('Head', 'Summoner\'s Horn');
            end
            if (Settings.SalvageMode) then
                gFunc.Equip('Ear1', 'Gamma Earring');
            end
        else
            gFunc.EquipSet(sets.Idle_NoPet);
        end
    end
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandleAbility = function()
    local action = gData.GetAction();

    if(action.Type == 'Blood Pact: Ward') then
        if(action.Name == 'Shining Ruby') then
            gFunc.EquipSet(sets.BP_SRuby);
        else
            gFunc.EquipSet(sets.BP_Ward);
        end
    elseif(action.Type == 'Blood Pact: Rage') then
        gFunc.EquipSet(sets.BP_RPhys);
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
    local pet = gData.GetPet();

    if (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
    elseif (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Healing);
    elseif (action.Skill == 'Summoning') then
        gFunc.EquipSet(sets.MidCast);
        if (pet == nil) then
            Settings.petName = '' + action.Name;
            Settings.petEleVar = '' + action.Element;
        end
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