local profile = {};
local sets = {
    Fish            = {
        Body    = 'Fsh. Tunica',
        Hands   = 'Fsh. Gloves',
        Waist   = 'Fisherman\'s Belt',
        Legs    = 'Fisherman\'s Hose',
        Feet    = 'Fisherman\'s Boots'
    },
    Idle_Base = {
        --Head    = '',
        Neck    = 'Justice Badge',
        Ear1    = 'Onyx Earring',
        Ear2    = 'Onyx Earring',
        Body    = 'Ryl.Ftm. Tunic',
        Hands   = 'Mitts',
        Ring1   = 'Eremite\'s Ring',
        Ring2   = 'Eremite\'s Ring',
        Back    = 'Cape',
        Waist   = 'Heko Obi +1',
        Legs    = 'Freesword\'s Slops',
        Feet    = 'Solea'
    },
    HMP_Weapon = {},
    Idle_WP_Staff = {
        Main = 'Earth Staff'
    },
    Rest_Base = {},
    PCast_Base = {},
    Haste_Base = {},

    WS_Base = {
        Ring1 = {'Courage Ring'},
        Ring2 = {'Courage Ring'}
    },
    TP_Base = {
        Ring1 = 'Bastokan Ring',
        Ring2 = 'Courage Ring'
    },

    Heal_Base = {},
    Elem_Base = {},
    Enha_Base = {},
    Enfe_Base = {},
    Divi_Base = {},
    Dark_Base = {},
    Blue_Base = {},
    Ninj_Base = {},
    Song_Base = {}
};

sets.Enfe_MND = gFunc.Combine(sets.Enfe_Base, {
    Ring1 = 'Saintly Ring',
    Ring2 = 'Saintly Ring',
});
sets.Enfe_INT = gFunc.Combine(sets.Enfe_Base, {
    Ring1 = 'Eremite\'s Ring',
    Ring2 = 'Eremite\'s Ring',
});
sets.Enha_MND = gFunc.Combine(sets.Enha_Base, {
    Ring1 = 'Saintly Ring',
    Ring2 = 'Saintly Ring',
});
sets.Enha_INT = gFunc.Combine(sets.Enha_Base, {
    Ring1 = 'Eremite\'s Ring',
    Ring2 = 'Eremite\'s Ring',
});

sets.wS_BBlade = gFunc.Combine(sets.WS_Base,{
    Ring1 = 'Eremite\'s Ring',
    Ring2 = 'Eremite\'s Ring',
});

profile.Sets = sets;
gcinclude = gFunc.LoadFile('common/gcinclude.lua');

--profile.Packer = {};

local Settings = {
    TP_Mode = 1,
    DT_Mode = 1,
    OV_Mode = 1,
    Idle_WP = 1,
    CC_Mode = false,
    MG_Mode = true,
    LockAll = false,
    Fish = false,
    Sync_Mode = false
};

local JATable = T{
    ['Provoke'] = 'Provoke',
};

local TPModeTable = {
    [1] = 'Low',
    [2] = 'Mid',
    [3] = 'High'
};

local IdleWPTable = {
    [1] = 'H2H',
    [2] = 'Dagger',
    [3] = 'Sword',
    [4] = 'GSword',
    [5] = 'Axe',
    [6] = 'GAxe',
    [7] = 'Scythe',
    [8] = 'Pole',
    [9] = 'Katana',
    [10] = 'GKatana',
    [11] = 'Club',
    [12] = 'Staff'
};

local DTModeTable = {
    [1] = 'Off',
    [2] = 'PDT',
    [3] = 'MDT',
};

local OVModeTable = {
    [1]  = 'Off',
    [2]  = 'Shield',
    [3]  = 'RFire',
    [4]  = 'RIce',
    [5]  = 'RThunder',
    [6]  = 'RLight',
    [7]  = 'RDark',
    [8]  = 'REarth',
    [9]  = 'RWind',
    [10] = 'RWater'
};

local cureCheatTable = T{
    ['Cure II']  = 'C2',
    ['Cure III'] = 'C3',
    ['Cure IV']  = 'C4'
};

local WSTable = T{
    ['Savage Blade'] = 'SavageBlade',
    ['Starlight'] = 'ClubSkill',
    ['Moonlight'] = 'ClubSkill'
};


profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(-1, '/macro book 4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/macro set 1');

    --AshitaCore:GetChatManager():QueueCommand(1, '/alias /mage /lac fwd MG_Mode');

    AshitaCore:GetChatManager():QueueCommand(500, '/lockstyleset 4');
end

profile.OnUnload = function()
    gcinclude.Unload();

    --AshitaCore:GetChatManager():QueueCommand(1, '/alias delete /mage');

    AshitaCore:GetChatManager():QueueCommand(500, '/lockstyle off');
end

profile.HandleCommand = function(args)
    if(args[1] == 'CC_Mode') then
        Settings.CC_Mode = not Settings.CC_Mode;
        if(Settings.CC_Mode) then
            gFunc.Message("Cure Cheat Mode is ON");
        else
            gFunc.Message("Cure Cheat Mode is OFF");
        end
    elseif(args[1] == 'Fish') then
        Settings.Fish = not Settings.Fish;
        if(Settings.Fish) then
            gFunc.Message("Fishing");
        else
            gFunc.Message("Not Fishing");
        end
    elseif(args[1] == 'Sync_Mode') then
        Settings.Sync_Mode = not Settings.Sync_Mode;
        if(Settings.Sync_Mode) then
            gFunc.Message("Sync Mode is ON");
        else
            gFunc.Message("Sync Mode is OFF");
        end
    elseif(args[1] == 'LockAll') then
        Settings.LockAll = not Settings.LockAll;
        if(Settings.LockAll) then
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable');
        else
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable');
        end
    elseif(args[1] == 'MG_Mode') then
        Settings.MG_Mode = not Settings.MG_Mode;
        if(Settings.MG_Mode) then
            gFunc.Message("Melee Mode is ON");
        else
            gFunc.Message("Melee Mode is OFF");
        end
    elseif (args[1] == 'TP_Mode') then
        Settings.TP_Mode = Settings.TP_Mode +1;
        if (Settings.TP_Mode > #TPModeTable) then
            Settings.TP_Mode = 1;
        end
        gFunc.Message('TP_Mode: ' .. TPModeTable[Settings.TP_Mode] .. ' Accuracy');
    elseif (args[1] == 'Idle_WP') then
        Settings.Idle_WP = Settings.Idle_WP +1;
        if (Settings.Idle_WP > #IdleWPTable) then
            Settings.Idle_WP = 1;
        end
        gFunc.Message('Idle Weapon: ' .. IdleWPTable[Settings.Idle_WP]);
    elseif (args[1] == 'DT_Mode') then
        Settings.DT_Mode = Settings.DT_Mode +1;
        if (Settings.DT_Mode > #DTModeTable) then
            Settings.DT_Mode = 1;
        end
        gFunc.Message('DT_Mode: ' .. DTModeTable[Settings.DT_Mode]);
    elseif (args[1] == 'OV_Mode') then
        Settings.OV_Mode = Settings.OV_Mode +1;
        if (Settings.OV_Mode > 1) and (Settings.OV_Mode <= #OVModeTable) then
            --AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable');
            gFunc.ForceEquipSet('OV_' .. OVModeTable[Settings.OV_Mode]);
            AshitaCore:GetChatManager():QueueCommand(2, '/lac disable');
            gFunc.Message('Gear Locked! Override Mode: ' .. OVModeTable[Settings.OV_Mode]);
        elseif (Settings.OV_Mode > #OVModeTable) then
            Settings.OV_Mode = 1;
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable');
            gFunc.Message('Gear Unlocked! Override Mode: ' .. OVModeTable[Settings.OV_Mode]);
        end
    elseif (args[1] == 'OV_Off') then
        Settings.OV_Mode = 1;
        AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable');
        gFunc.Message('Gear Unlocked! Override Mode: ' .. OVModeTable[Settings.OV_Mode]);
    else
        gFunc.Message('Argument Required');
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();

    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
    end

    if (Settings.Fish) then
        gFunc.EquipSet(sets.Fish);
    elseif(player.Status == 'Engaged') then
        gFunc.EquipSet(sets.TP);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Rest_Base);
        if (Settings.MG_Mode) then
            gFunc.EquipSet(sets.HMP_Weapon);
        end
    else
        gFunc.EquipSet(sets.Idle_Base);
        if (Settings.MG_Mode) then
            --gFunc.Equip(sets.Idle_WP_Staff);
        end
    end
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local action = gData.GetAction();
    if (action.Type == 'Spell') then
        gFunc.EquipSet(sets.PCast_Base);
    end
end

profile.HandleMidcast = function()
    local action = gData.GetAction();
    if (action.Type == 'White Magic') then
        if (action.Skill == 'Healing Magic') then
            gFunc.EquipSet(sets.Heal_Base);
        elseif (action.Skill == 'Enfeebling Magic') then
            gFunc.EquipSet(sets.Enfe_MND);
        elseif (action.Skill == 'Enhancing Magic') then
            gFunc.EquipSet(sets.Enha_MND)
        elseif (action.Skill == 'Divine Magic') then
            gFunc.EquipSet(sets.Divi_Base)
        end
    elseif (action.Type == 'Black Magic') then
        if (action.Skill == 'Elemental Magic') then
            gFunc.EquipSet(sets.Enha_Base)
        elseif (action.Skill == 'Enfeebling Magic') then
            gFunc.EquipSet(sets.Enfe_INT)
        elseif (action.Skill == 'Enhancing Magic') then
            gFunc.EquipSet(sets.Enha_INT)
        elseif (action.Skill == 'Dark Magic') then
            gFunc.EquipSet(sets.Dark_Base)
        end
    elseif (action.Type == 'Ninjutsu') then
        gFunc.EquipSet(sets.Ninj_Base);
    elseif (action.Type == 'Summoning') then
        -- Why?
    elseif (action.Type == 'Blue Magic') then
        gFunc.EquipSet(sets.Blue_Base);
    elseif (action.Type == 'Bard Song') then
        gFunc.EquipSet(sets.Song_Base);
    else
        -- How?
    end
    if (MG_Mode) then
        gcinclude.EquipStaff();
    end
    gcinclude.EquipObi(action);
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if(WSTable[action.Name] ~= nil) then
        -- I've made a set for it.
        gFunc.EquipSet('WS_' .. WSTable[action.Name]);
    else
        -- I didn't. Equip STR
        gFunc.EquipSet(sets.WS_Base);
    end
end

return profile;