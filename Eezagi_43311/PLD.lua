--[[
    ToDo:
        Populate Gear

        Move Staff and Day/Weather Logic to gcinclude.
]]
local profile = {};
local sets = {

    Idle_Base        = {
        Head    = 'Eisenschaller',
        Neck    = 'Tiger Stole',
        Ear1    = 'Beetle Earring +1',
        Ear2    = 'Beetle Earring +1',
        Body    = 'Eisenbrust',
        Hands   = 'Eisenhentzes',
        Ring1   = 'Bastokan Ring',
        Ring2   = 'Courage Ring',
        Back    = 'Dhalmel Mantle +1',
        Waist   = 'Brave Belt',
        Legs    = 'Eisendiechlings',
        Feet    = 'Eisenschuhs'
    },
    Idle_WP_Sword  = {
        Main    = 'Centurion\'s Sword',
        Sub     = 'Kite shield'
    },
    Idle_WP_CLub   = {
        Main    = 'Decurion\'s Hammer',
        Sub     = 'Kite shield'
    },
    Idle_WP_Staff   = {
        Main    = 'Earth Staff'
    },

    Rest_Base       = {},

    Haste_Base      = {},

    TP_Priority     = {
        Head    = {'Eisenschaller', 'Beetle Mask +1', 'Bone Mask +1'},
        Neck    = {'Tiger Stole', 'Dog Collar'},
        Ear1    = {'Beetle Earring +1', 'Bone Earring +1'},
        Ear2    = {'Beetle Earring +1', 'Bone Earring +1'},
        Body    = {'Eisenbrust', 'Beetle Harness +1', 'Bone Harness +1'},
        Hands   = {'Eisenhentzes', 'Lgn. Mittens'},
        Ring1   = {'Bastokan Ring'},
        Ring2   = {'Courage Ring'},
        Back    = {'Dhalmel Mantle +1'},
        Waist   = {'Brave Belt', 'Leather Belt'},
        Legs    = {'Eisendiechlings', 'Republic Subligar', 'Lgn. Subligar'},
        Feet    = {'Eisenschuhs', 'Beetle Leggings +1', 'Bone Leggings +1'}
    },
    Hate_Base       = {
        Head    = 'Horror Head',
        Back    = 'Mercen. Mantle'
    },

    OV_Shield       = {},
    OV_RBase        = {},

    WS_Base         = {
        Neck    = 'Spike Necklace',
        Hands   = 'Custom M Gloves',
        Ring1   = 'Courage Ring',
        Legs    = 'Republic Subligar'
    },

    PCast_Base      = {},
    SIRD_Base       = {
        Waist   = 'Heko Obi +1'
    },

    Div_Base        = {
        Neck    = 'Justice Badge'
    },
    Enh_Base        = {},
    Heal_Base       = {
        Neck    = 'Justice Badge'
    },
};
profile.Sets = sets;
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

-- Combine Block
sets.Idle_Off       = gFunc.Combine(sets.Idle_Base, {});
sets.Idle_PDT       = gFunc.Combine(sets.Idle_Base, {});
sets.Idle_MDT       = gFunc.Combine(sets.Idle_Base, {});

-- 90 HP Delta
sets.HP_Down_C2     = gFunc.Combine(sets.PCast_Base, {
    --[[Head    = 'Empress Hairpin',    --[[ -15 HP ]]
    -- Astral Rings are 60k/ea. For -50 Total
});
sets.HP_Up_C2       = gFunc.Combine(sets.SIRD_Base, {
    --Total = ~73. Can't Use Custom Tunic until 33
    Head    = 'Horror Head',        --[[ +1 Enmity, No HP]]
    Neck    = 'Bloodbead Amulet',   --[[ +15 HP ]]
    Ear1    = 'Shield Earring',     --[[ +10 HP ]]  --[[ Ear1 = 'Bloodbead Earring'  --[[ +25 HP, 200k ]]
    Ear2    = 'Shield Earring',     --[[ +10 HP ]]
    Body    = 'Custom Tunic',       --[[ +32 HP ]]
    Hands   = 'Custom M Gloves',    --[[ +12 HP ]]  --[[ Gigas Bracelets could give another 3 for cheap, but -inv ]]
    --Ring1   = Mythril Ring = 4, Mythril Ring +1 = 5, Bomb Ring = 15
    --Ring2   =
    Back    = 'Mercenary Mantle',   --[[ +1 Enmity, No HP]]
    --Waist   =
    --Legs    = N/A
    Feet    = 'Custom M Boots'      --[[ +4 HP ]]
});
-- 190 HP Delta
sets.HP_Down_C3     = gFunc.Combine(sets.HP_Down_C2, {});
sets.HP_Up_C3       = gFunc.Combine(sets.HP_Up_C2, {});
-- 390 HP Delta
sets.HP_Down_C4     = gFunc.Combine(sets.HP_Down_C3, {});
sets.HP_Up_C4       = gFunc.Combine(sets.HP_Up_C3, {});

sets.OV_REarth      = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RWind       = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RWater      = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RFire       = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RIce        = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RLight      = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RThunder    = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RDark       = gFunc.Combine(sets.OV_RBase, {});

sets.TP_Low_Off     = gFunc.Combine(sets.Idle_Base, {});
sets.TP_Low_PDT     = gFunc.Combine(sets.TP_Low_Off, {});
sets.TP_Low_MDT     = gFunc.Combine(sets.TP_Low_Off, {});
sets.TP_Mid_Off     = gFunc.Combine(sets.TP_Low_Off, {});
sets.TP_Mid_PDT     = gFunc.Combine(sets.TP_Mid_Off, {});
sets.TP_Mid_MDT     = gFunc.Combine(sets.TP_Mid_Off, {});
sets.TP_High_Off    = gFunc.Combine(sets.TP_Mid_Off, {});
sets.TP_High_PDT    = gFunc.Combine(sets.TP_High_Off, {});
sets.TP_High_MDT    = gFunc.Combine(sets.TP_High_Off, {});

sets.WS_SavageBlade = gFunc.Combine(sets.WS_Base, {});
sets.WS_ClubSkill   = gFunc.Combine(sets.WS_Base, {});

sets.Div_Nuke       = gFunc.Combine(sets.Div_Base, {});
sets.Div_Flash      = gFunc.Combine(sets.Haste_Base, {});
sets.Nin_Utsu       = gFunc.Combine(sets.SIRD_Base, {});

--profile.Packer = {};

local Settings = {
    TP_Mode = 1,
    DT_Mode = 1,
    OV_Mode = 1,
    Idle_WP = 4,
    CC_Mode = false,
    ML_Mode = true,
    LockAll = false,
    Fish = false,
    Sync_Mode = false
};

local JATable = T{
    ['Holy Circle'] = 'HolyCircle',
    ['Shield Bash'] = 'Shield Bash',
    ['Sentinel'] = 'Sentinel',
    ['Cover'] = 'Cover',
    ['Chivalry'] = 'Chivalry',
    ['Rampart'] = 'Rampart'
};

local TPModeTable = {
    [1] = 'Low',
    [2] = 'Mid',
    [3] = 'High'
};

local IdleWPTable = {
    [1] = 'Sword',
    [2] = 'Club',
    [3] = 'Staff'
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

local EleStaffTable = {
    ['Earth']   = 'Earth Staff',
    ['Wind']    = 'Wind Staff',
    ['Water']   = 'Water Staff',
    ['Fire']    = 'Fire Staff',
    ['Ice']     = 'Ice Staff',
    ['Thunder'] = 'Thunder Staff',
    ['Light']   = 'Light Staff',
    ['Dark']    = 'Dark Staff'
};

local EleObiTable = {
    ['Earth']   = 'Dorin Obi',
    ['Wind']    = 'Furin Obi',
    ['Water']   = 'Suirin Obi',
    ['Fire']    = 'Karin Obi',
    ['Ice']     = 'Hyorin Obi',
    ['Thunder'] = 'Rairin Obi',
    ['Light']   = 'Korin Obi',
    ['Dark']    = 'Anrin Obi'
};


profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(-1, '/macro book 7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/macro set 1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/lockstyleset 7');

    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /wep /lac fwd Idle_WP');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /mage /lac fwd ML_Mode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /fshmode /lac fwd Fish');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sync /lac fwd Sync_Mode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !l /lac fwd LockAll');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F7 /lac fwd OV_Off');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F8 /lac fwd OV_Mode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /lac fwd TP_Mode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /lac fwd DT_Mode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^c /lac fwd CC_Mode');
end

profile.OnUnload = function()
    gcinclude.Unload();
    AshitaCore:GetChatManager():QueueCommand(-1, '/lockstyle off');

    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /wep');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /mage');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /fshmode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sync');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !l');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F7');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F8');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F10');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^c');
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
    elseif(args[1] == 'ML_Mode') then
        Settings.ML_Mode = not Settings.ML_Mode;
        if(Settings.ML_Mode) then
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

    if (player.Status == 'Engaged') then
        if (Sync_Mode) then
            gFunc.EquipSet(sets.TP_Priority);
        else
            gFunc.EquipSet('TP_' .. TPModeTable[Settings.TP_Mode] .. '_' .. DTModeTable[Settings.DT_Mode]);
        end
    elseif(args[1] == 'Sync_Mode') then
        Settings.Sync_Mode = not Settings.Sync_Mode;
        if(Settings.Sync_Mode) then
            gFunc.Message("Sync Mode is ON");
        else
            gFunc.Message("Sync Mode is OFF");
        end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Rest_Base);
        if (not Settings.ML_Mode) then
            gFunc.Equip('main', "Dark Staff");
        end
    else
        gFunc.EquipSet('Idle_' .. DTModeTable[Settings.DT_Mode]);
        if (not Settings.ML_Mode) then
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
    if string.match(action.Name, 'Cure') and (Settings.CC_Mode) then
        if(cureCheatTable:contains(action.Name)) then
            gFunc.EquipSet('HP_Down_' .. cureCheatTable[action.Name]);
        else
            gFunc.EquipSet(sets.PCast_Base);
        end
    else
        gFunc.EquipSet(sets.PCast_Base);
    end
end

profile.HandleMidcast = function()
    local envVar = gData.GetEnvironment();
    local action = gData.GetAction();
    if(action.Skill == 'Healing Magic') then
        if string.match(action.Name, 'Cure') and (Settings.CC_Mode) then
            gFunc.EquipSet('HP_Up_' .. cureCheatTable[action.Name]);
        else
            gFunc.EquipSet(sets.Heal_Base);
            if(not ML_Mode) then
                gFunc.Equip('main', EleStaffTable[action.Element]);
            end
        end
    elseif(action.Skill == 'Divine Magic') then
        if(action.Name == 'Flash') then
            gFunc.EquipSet(sets.Div_Flash);
        elseif string.match(action.Name, 'Banish') or string.match(acton.Name, 'Holy') then
            gFunc.EquipSet(sets.Div_Nuke);
        else
            -- Enlight
            gFunc.EquipSet(sets.Div_Base);
        end
    elseif(action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enh_Base);
    elseif(action.Skill == 'Ninjutsu') then
        gFunc.EquipSet(sets.Nin_Base);
    elseif(action.Skill == 'Blue Magic') then
        gFunc.Message('Friday Finally Arrived, fix your shit');
    else
        gFunc.EquipSet(sets.Haste_Base);
    end
    if(envVar.DayElement == action.Element) or (envVar.WeatherElement == action.Element) then
        -- equip an obi
        gFunc.Equip('Waist', EleObiTable[action.Element]);
        -- Checked after conditionals to enforce
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if(WSTable:contains(action.Name)) then
        -- I've made a set for it.
        gFunc.EquipSet('WS_' .. WSTable[action.Name]);
    else
        -- I didn't. Equip STR
        gFunc.EquipSet(sets.WS_Base);
    end
end

return profile;