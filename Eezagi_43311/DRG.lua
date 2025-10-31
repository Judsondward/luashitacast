local profile = {};
local sets = {
    Idle_Base ={},
    Rest_Base = {},
    TP_Base = {},
    TP_Priority = {     --  Using for Idle and TP until Level 30+
        Head    = {'Beetle Mask +1', 'Bone Mask +1', 'Legionnaire\'s Cap'},
        Neck    = {'Tiger Stole', 'Dog Collar'},
        Ear1    = {'Beetle Earring +1', 'Bone Earring +1', 'Opal Earring'},
        Ear2    = {'Beetle Earring +1', 'Bone Earring +1', 'Opal Earring'},
        Body    = {'Beetle Harness +1', 'Bone Harness +1', 'Lgn. Harness'},
        Hands   = {'Lgn. Mittens'},
        Ring1   = {'Bastokan Ring'},
        Ring2   = {'Courage Ring'},
        Back    = {'Dhalmel Mantle +1', 'Rabbit Mantle'},
        Waist   = {'Brave Belt', 'Leather Belt'},
        Legs    = {'Republic Subligar', 'Lgn. Subligar', 'Brass Subligar'},
        Feet    = {'Btl. Leggings +1', 'Bone Leggins +1', 'Lgn. Leggings'}
    },
    WS_Base = {},
    OV_RBase = {},

    PCast_Base = {},
    MCast_Base = {},

    BreathWeapon = {},

    Tail = {}
};
sets.Idle_Off        = gFunc.Combine(sets.Idle_Base, {});
sets.Idle_PDT        = gFunc.Combine(sets.Idle_Base, {});
sets.Idle_MDT        = gFunc.Combine(sets.Idle_Base, {});

sets.OV_REarth       = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RWind        = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RWater       = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RFire        = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RIce         = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RLight       = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RThunder     = gFunc.Combine(sets.OV_RBase, {});
sets.OV_RDark        = gFunc.Combine(sets.OV_RBase, {});

sets.TP_Low_Off      = gFunc.Combine(sets.Idle_Base, {});
sets.TP_Low_PDT      = gFunc.Combine(sets.TP_Low_Off, {});
sets.TP_Low_MDT      = gFunc.Combine(sets.TP_Low_Off, {});
sets.TP_Mid_Off      = gFunc.Combine(sets.TP_Low_Off, {});
sets.TP_Mid_PDT      = gFunc.Combine(sets.TP_Mid_Off, {});
sets.TP_Mid_MDT      = gFunc.Combine(sets.TP_Mid_Off, {});
sets.TP_High_Off     = gFunc.Combine(sets.TP_Mid_Off, {});
sets.TP_High_PDT     = gFunc.Combine(sets.TP_High_Off, {});
sets.TP_High_MDT     = gFunc.Combine(sets.TP_High_Off, {});

--[[
    HP Push Set to Trigger Wyvern Healing
    PCast for -HP and Drachen Armet
        Low = No HP Down
        Mid = Little HP Down
        High = Full Push to 50%
    MCast for +HP and Wyrm Armet
]]
sets.PCast_HP_Low = gFunc.Combine(sets.PCast_Base, {});
sets.PCast_HP_Mid = gFunc.Combine(sets.PCast_Base, {});
sets.PCast_HP_High = gFunc.Combine(sets.PCast_Base, {});
sets.MCast_HP_Low = gFunc.Combine(sets.MCast_Base, {});
sets.MCast_HP_Mid = gFunc.Combine(sets.MCast_Base, {});
sets.MCast_HP_High = gFunc.Combine(sets.MCast_Base, {});

profile.Sets = sets;
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

--profile.Packer = {};

local Settings = {
    TP_Mode = 1,
    DT_Mode = 1,
    OV_Mode = 1,
    M_Heal = false
};

local JATable = T{
    --[[
        ['Jump'] = 'Jump',
        ['High Jump'] = 'HighJump',
        ['Super Jump'] = 'SuperJump',
    ]]
};

local TPModeTable = T{
    [1] = 'Low',
    [2] = 'Mid',
    [3] = 'High'
};

local DTModeTable = T{
    [1] = 'Off',
    [2] = 'PDT',
    [3] = 'MDT',
};

local OVModeTable = T{
    [1] = 'Off',
    [2] = 'RFire',
    [3] = 'RIce',
    [4] = 'RThunder',
    [5] = 'RLight',
    [6] = 'RDark',
    [7] = 'REarth',
    [8] = 'RWind',
    [9] = 'RWater'
};

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 15');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 15');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
    
    AshitaCore:GetChatManager():QueueCommand(2, '/bind F7 /lac fwd OV_Off');
    AshitaCore:GetChatManager():QueueCommand(2, '/bind F8 /lac fwd OV_Mode');
    AshitaCore:GetChatManager():QueueCommand(2, '/bind F9 /lac fwd TP_Mode');
    AshitaCore:GetChatManager():QueueCommand(2, '/bind F10 /lac fwd DT_Mode');
end

profile.OnUnload = function()
    gcinclude.Unload();
    AshitaCore:GetChatManager():QueueCommand(-1, '/lockstyle off');
    
    AshitaCore:GetChatManager():QueueCommand(2, '/unbind F7');
    AshitaCore:GetChatManager():QueueCommand(2, '/unbind F8');
    AshitaCore:GetChatManager():QueueCommand(2, '/unbind F9');
    AshitaCore:GetChatManager():QueueCommand(2, '/unbind F10');
end

profile.HandleCommand = function(args)
    -- Accuracy Toggle
    if (args[1] == 'TP_Mode') then
        Settings.TP_Mode = Settings.TP_Mode +1;
        if (Settings.TP_Mode > #TPModeTable) then
            Settings.TP_Mode = 1;
        end
        gFunc.Message('TP_Mode: ' .. TPModeTable[Settings.TP_Mode] .. ' Accuracy');
    -- Defense Toggle
    elseif (args[1] == 'DT_Mode') then
        Settings.DT_Mode = Settings.DT_Mode +1;
        if (Settings.DT_Mode > #DTModeTable) then
            Settings.DT_Mode = 1;
        end
        gFunc.Message('DT_Mode: ' .. DTModeTable[Settings.DT_Mode]);
    -- Full Gearswap Override Toggle.
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
    -- Force Cancel Override Mode
    elseif (args[1] == 'OV_Off') then
        Settings.OV_Mode = 1;
        AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable');
        gFunc.Message('Gear Unlocked! Override Mode: ' .. OVModeTable[Settings.OV_Mode]);
    -- Enable Main Heal Mode
    elseif (args[1] == 'M_Heal') then
        Settings.MH_Mode = not Settings.MH_Mode;
        if(Settings.MH_Mode) then
            gFunc.Message("Main Healing Mode is ON");
        else
            gFunc.Message("Main Healing Mode is OFF");
        end
    else
        gFunc.Message('Argument Required');
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();

    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.TP_Priority);
        --[[
            High Level Logic requiring Multiple gear options

        if (player.MainJobSync < player.MainJobLevel) then
            gFunc.EquipSet(sets.TP_Priority);
        else
            gFunc.EquipSet('TP_' .. TPModeTable[Settings.TP_Mode] .. '_' .. DTModeTable[Settings.DT_Mode]);
        end
        ]]
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Rest_Base);
    else
        gFunc.EquipSet(sets.TP_Priority);
        --gFunc.EquipSet('Idle_' .. DTModeTable[Settings.DT_Mode]);
    end
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandleAbility = function()
    local action = gData.GetAction();
    local petAction = gData.GetPetAction();

    if (petAction ~= nil) then
        gFunc.EquipSet(sets.BreathWeapon);
    elseif(JATable:contains(action.Name)) then
        gFunc.EquipSet('JA_' .. JATable[action.Name]);
    end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local action = gData.GetAction();

    --[[
        Equip HP Down Gear and Drachen Armet to trigger Healing Breath Earlier
    ]]

    if (action.Type == 'Spell') then
        if (MH_Mode) then
            if (player.HPP <= 50) then
                gFunc.EquipSets(sets.PCast_HP_Low);
            elseif (player.HPP <= 75) then
                gFunc.EquipSets(sets.PCast_HP_Mid);
            else
                gFunc.EquipSets(sets.PCast_HP_High);
            end
        else
            gFunc.EquipSet(sets.PCast_Base);
        end
    end
end

profile.HandleMidcast = function()
    local envVar = gData.GetEnvironment();
    local action = gData.GetAction();
    local player = gData.GetPlayer();

    --[[
        Equip Wyrm Armet during midcast to increase Breath Potency.
        Saurian Helm is a knockoff Wyrm Armet from WoTG. Ignore.
    ]]
    if (MH_Mode) then
        gFunc.EquipSets(sets.MCast_Base);
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