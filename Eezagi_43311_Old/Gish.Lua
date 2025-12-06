--[[
]]
local profile = {};
local gcinclude = gFunc.LoadFile('common/gcinclude.lua');
local sets = {
    Fish            = {
        Body    = 'Fsh. Tunica',
        Hands   = 'Fsh. Gloves',
        Waist   = 'Fisherman\'s Belt','
        Legs    = 'Fisherman\'s Hose',
        Feet    = 'Fisherman\'s Boots'
    },

    Idle_Base       = {},
    Idle_WP_H2H     = {},
    Idle_WP_Dagger  = {},
    Idle_WP_Sword   = {},
    Idle_WP_GSword  = {},
    Idle_WP_Axe     = {},
    Idle_WP_GAxe    = {},
    Idle_WP_Scythe  = {},
    Idle_WP_Pole    = {},
    Idle_WP_Katana  = {},
    Idle_WP_GKatana = {},
    Idle_WP_Club    = {},
    Idle_WP_Staff   = {},
    

    HMP_Weapon      = {},
    Rest_Base       = {},
    Haste_Base      = {},
    Hate_Base       = {},

    TP_Base         = {},
    TP_Priority     = {
        Head    = {},
        Neck    = {},
        Ear1    = {},
        Ear2    = {},
        Body    = {},
        Hands   = {},
        Ring1   = {},
        Ring2   = {},
        Back    = {},
        Waist   = {},
        Legs    = {},
        Feet    = {}
    },

    OV_Shield       = {},
    OV_RBase        = {},

    WS_Base         = {},
    WS_Priority     = {},

    HP_Down_Base    = {},
    HP_Up_Base      = {},

    -- Basic Magic Sets.
    PCast_Base      = {},

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

profile.Sets = sets;

-- Combine Block
sets.Idle_Off       = gFunc.Combine(sets.Idle_Base, {});
sets.Idle_PDT       = gFunc.Combine(sets.Idle_Base, {});
sets.Idle_MDT       = gFunc.Combine(sets.Idle_Base, {});

sets.OV_REarth      = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RWind       = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RWater      = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RFire       = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RIce        = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RLight      = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RThunder    = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RDark       = gFunc.Combine(sets.OV_RBase, {});

sets.TP_Low_Off     = gFunc.Combine(sets.TP_Base, {});
sets.TP_Low_PDT     = gFunc.Combine(sets.TP_Low_Off, {});
sets.TP_Low_MDT     = gFunc.Combine(sets.TP_Low_Off, {});
sets.TP_Mid_Off     = gFunc.Combine(sets.TP_Low_Off, {});
sets.TP_Mid_PDT     = gFunc.Combine(sets.TP_Low_PDT, {});
sets.TP_Mid_MDT     = gFunc.Combine(sets.TP_Low_MDT, {});
sets.TP_High_Off    = gFunc.Combine(sets.TP_Mid_Off, {});
sets.TP_High_PDT    = gFunc.Combine(sets.TP_Mid_PDT, {});
sets.TP_High_MDT    = gFunc.Combine(sets.TP_Mid_MDT, {});

sets.Enfe_MND       = gFunc.Combine(sets.Enfe_Base, {});
sets.Enfe_INT       = gFunc.Combine(sets.Enfe_Base, {});
sets.Enha_MND       = gFunc.Combine(sets.Enha_Base, {});
sets.Enha_INT       = gFunc.Combine(sets.Enha_Base, {});

sets.Divi_Nuke       = gFunc.Combine(sets.Divi_Base, {});
sets.Divi_Flash      = gFunc.Combine(sets.Haste_Base, {});

sets.WS_SavageBlade = gFunc.Combine(sets.WS_Base, {});
sets.WS_ClubSkill   = gFunc.Combine(sets.WS_Base, {});

sets.Provoke        = gFunc.Combine(sets.Hate_Base, {});

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


-- Create a function for all the binds and possibly the macro book and lockstyles
profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(-1, '/macro book 1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/macro set 1');

    AshitaCore:GetChatManager():QueueCommand(2000, '/lockstyleset 7');
end

profile.OnUnload = function()
    gcinclude.Unload();

    AshitaCore:GetChatManager():QueueCommand(2000, '/lockstyle off');
end

-- Didn't like the varhelper route. Possible to create a function to handle all this.
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
    elseif (player.Status == 'Engaged') then
        if (Settings.Sync_Mode) then
            gFunc.EquipSet(sets.TP);
        else
            gFunc.EquipSet('TP_' .. TPModeTable[Settings.TP_Mode] .. '_' .. DTModeTable[Settings.DT_Mode]);
        end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Rest_Base);
        if (Settings.MG_Mode) then
            gFunc.EquipSet(sets.HMP_Weapon);
        end
    else
        gFunc.EquipSet('Idle_' .. DTModeTable[Settings.DT_Mode]);
        if (Settings.MG_Mode) then
            gFunc.EquipSet('Idle_WP_'  .. IdleWPTable[Settings.Idle_WP]);
        end
    end
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandleAbility = function()
    local action = gData.GetAction();

    if(JATable:contains(action.Name)) then
        gFunc.EquipSet('JA_' .. JATable[action.Name]);
    else
        gFunc.EquipSet(sets.Hate_Base);
    end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local action = gData.GetAction();
    if(Settings.CC_Mode) then
        gFunc.EquipSet(sets.HP_Down_Base);
    else
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
    if (Settings.CC_Mode) then
        gFunc.EquipSet(sets.HP_Up_Base)
    end
    if (Settings.MG_Mode) then
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
    if(Sync_Mode) then
        gFunc.EquipSet(sets.WS_Priority);
    elseif(WSTable[action.Name] ~= nil) then
        -- I've made a set for it.
        gFunc.EquipSet('WS_' .. WSTable[action.Name]);
    else
        -- I didn't. Equip STR
        gFunc.EquipSet(sets.WS_Base);
    end
end

return profile;