--[[
    ToDo:
        Gorget Logic in gcInclude.
        WS Logic and set population.
]]
local profile = {};
gcinclude = gFunc.LoadFile('common/gcinclude.lua');

local sets = {

    Idle_Base        = {
        --Ammo    = 'Balm Sachet',          -- BiS until Tiphia Sting since I don't have Easter Ammos, Pain to get
        Head    = 'Centurion\'s Visor',
        Neck    = 'Tiger Stole',
        Ear1    = 'Beetle Earring +1',
        Ear2    = 'Beetle Earring +1',
        Body    = 'Ctr. Scale Mail',
        Hands   = 'Custom M Gloves',
        Ring1   = 'Bastokan Ring',
        Ring2   = 'Balance Ring',
        Back    = 'Dhalmel Mantle +1',
        Waist   = 'Brave Belt',
        Legs    = 'Republic Subligar',
        Feet    = 'Ctr. Greaves',
    },
    Idle_WP_Sword  = {
        Main    = 'Centurion\'s Sword',
        Sub     = 'Kite shield'
    },
    Idle_WP_CLub   = {
        Main    = 'Republic Hammer',
        Sub     = 'Kite shield'
    },
    Idle_WP_Staff   = {
        Main    = 'Earth Staff'
    },
    Idle_WP_GAxe   = {
        Main    = 'Neckchopper'
    },
    Rest_Base       = {},

    Fish            = {
        Body = 'Fsh. Tunica',
        Hands = 'Fsh. Gloves',
        Legs = 'Fisherman\'s Hose',
        Feet = 'Fisherman\'s Boots'
    },

    Haste_Base      = {},

    TP_Base         = {
        Head    = 'Centurion\'s Visor',
        Neck    = 'Tiger Stole',
        Ear1    = 'Beetle Earring +1',
        Ear2    = 'Beetle Earring +1',
        Body    = 'Ctr. Scale Mail',
        Hands   = 'Custom M Gloves',        -- Cannot equip Battle Gloves
        Ring1   = 'Balance Ring',
        Ring2   = 'Balance Ring',
        Back    = 'Dhalmel Mantle +1',
        Waist   = 'Brave Belt',
        Legs    = 'Republic Subligar',
        Feet    = 'Ctr. Greaves',
    },

    TP_Priority     = {
        Head    = {'Centurion\'s Visor', 'Beetle Mask +1', 'Bone Mask +1', 'Legionnaire\'s Cap'},
        Neck    = {'Spike Necklace', 'Dog collar'},
        Ear1    = {'Beetle Earring +1', 'Bone Earring +1', 'Opal Earring'},
        Ear2    = {'Beetle Earring +1', 'Bone Earring +1', 'Opal Earring'},
        Body    = {'Ctr. Scale Mail', 'Beetle Harness +1', 'Bone Harness +1', 'Lgn. Harness'},
        Hands   = {'Custom M Gloves', 'Lgn. Mittens'},
        Ring1   = {'Balance Ring', 'Bastokan Ring'},
        Ring2   = {'Balance Ring'},
        Back    = {'Dhalmel Mantle +1', 'Rabbit Mantle'},
        Waist   = {'Brave Belt', 'Leather Belt'},
        Legs    = {'Republic Subligar', 'Lgn. Subligar', 'Brass Subligar'},
        Feet    = {'Ctr. Greaves', 'Btl. Leggings +1', 'Bone Leggins +1', 'Lgn. Leggings'}
    },
    Hate_Base       = {
        Head    = 'Horror Head',
    },

    OV_RBase        = {},

    WS_Base         = {
        Neck    = 'Spike Necklace',
        Hands   = 'Custom M Gloves',
        Ring1   = 'Courage Ring',
        Ring2   = 'Courage Ring',
        Legs    = 'Republic Subligar'
    },

    PCast_Base      = {},
    SIRD_Base       = {},
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

sets.TP_Low_Off     = gFunc.Combine(sets.TP_Base, {
    Hands   = 'Lgn. Mittens',
    Legs    = 'Republic Subligar'
});
sets.TP_Low_PDT     = gFunc.Combine(sets.TP_Low_Off, {
    Neck    = 'Bloodbead Amulet',   --[[ +15 HP ]]
    Ear1    = 'Shield Earring',     --[[ +10 HP ]]  --[[ Ear1 = 'Bloodbead Earring'  --[[ +25 HP, 200k ]]
    Ear2    = 'Shield Earring',     --[[ +10 HP ]]
});
sets.TP_Low_MDT     = gFunc.Combine(sets.TP_Low_Off, {
    Neck    = 'Bloodbead Amulet',   --[[ +15 HP ]]
    Ear1    = 'Shield Earring',     --[[ +10 HP ]]  --[[ Ear1 = 'Bloodbead Earring'  --[[ +25 HP, 200k ]]
    Ear2    = 'Shield Earring',     --[[ +10 HP ]]
});
sets.TP_Mid_Off     = gFunc.Combine(sets.TP_Low_Off, {
    Neck    = 'Spike Necklace',
    Hands   = 'Custom M Gloves'
});
sets.TP_Mid_PDT     = gFunc.Combine(sets.TP_Low_PDT, {
    Neck    = 'Spike Necklace',
    Hands   = 'Custom M Gloves'
});
sets.TP_Mid_MDT     = gFunc.Combine(sets.TP_Low_MDT, {
    Neck    = 'Spike Necklace',
    Hands   = 'Custom M Gloves'
});
sets.TP_High_Off    = gFunc.Combine(sets.TP_Mid_Off, {});
sets.TP_High_PDT    = gFunc.Combine(sets.TP_Mid_PDT, {});
sets.TP_High_MDT    = gFunc.Combine(sets.TP_Mid_MDT, {});

sets.WS_SavageBlade = gFunc.Combine(sets.WS_Base, {});
sets.WS_ClubSkill   = gFunc.Combine(sets.WS_Base, {});

sets.Nin_Utsu       = gFunc.Combine(sets.SIRD_Base, {});

sets.JA_Provoke     = gFunc.Combine(sets.Hate_Base, {});
sets.JA_Berserk     = {};
sets.JA_Defender    = {};
sets.JA_Warcry      = {};
sets.JA_Aggressor   = {};

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
    ['Provoke'] = 'Provoke',
    ['Berserk'] = 'Berserk',
    ['Defender'] = 'Defender',
    ['Warcry'] = 'Warcry',
    ['Aggressor'] = 'Aggressor'
};

local TPModeTable = {
    [1] = 'Low',
    [2] = 'Mid',
    [3] = 'High'
};

local IdleWPTable = {
    [1] = 'Sword',
    [2] = 'Club',
    [3] = 'Staff',
    [4] = 'GAxe'
};

local DTModeTable = {
    [1] = 'Off',
    [2] = 'PDT',
    [3] = 'MDT',
};

local OVModeTable = {
    [1]  = 'Off',
    [2]  = 'RFire',
    [3]  = 'RIce',
    [4]  = 'RThunder',
    [5]  = 'RLight',
    [6]  = 'RDark',
    [7]  = 'REarth',
    [8]  = 'RWind',
    [9]  = 'RWater'
};

local WSTable = T{
    ['Savage Blade'] = 'SavageBlade',
    ['Starlight'] = 'ClubSkill',
    ['Moonlight'] = 'ClubSkill'
};

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(100, '/macro book 1');
    AshitaCore:GetChatManager():QueueCommand(100, '/macro set 1');
    AshitaCore:GetChatManager():QueueCommand(500, '/lockstyleset 1');
end

profile.OnUnload = function()
    gcinclude.Unload();

    AshitaCore:GetChatManager():QueueCommand(500, '/lockstyle off');
end

profile.HandleCommand = function(args)
    if(args[1] == 'LockAll') then
        Settings.LockAll = not Settings.LockAll;
        if(Settings.LockAll) then
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable');
        else
            AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable');
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

    if (Settings.Fish) then
        gFunc.EquipSet(sets.Fish);
    elseif (player.Status == 'Engaged') then
        if (Sync_Mode) then
            gFunc.EquipSet(sets.TP_Priority);
        else
            gFunc.EquipSet('TP_' .. TPModeTable[Settings.TP_Mode] .. '_' .. DTModeTable[Settings.DT_Mode]);
        end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Rest_Base);
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
    end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local action = gData.GetAction();
    if(action.Skill == 'Ninjutsu') then
        gFunc.EquipSet(sets.PCast_Base);
    end
end

profile.HandleMidcast = function()
    local envVar = gData.GetEnvironment();
    local action = gData.GetAction();
    if(action.Skill == 'Ninjutsu') then
        gFunc.EquipSet(sets.Nin_Base);
    elseif(action.Skill == 'Blue Magic') then
        gFunc.Message('Friday Finally Arrived, fix your shit');
    else
        gFunc.EquipSet(sets.Haste_Base);
    end
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