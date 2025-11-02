local profile = {};
local sets = {
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
    Rest_Base = {},
    PCast_Base = {},
    Haste_Base = {},

    WS_Base = {},

    TP_Priority = {},

    Heal_Base = {},
    Elem_Base = {},
    Enha_Base = {},
    Enfe_Base = {},
    Divi_Base = {},
    Dark_Base = {},
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

profile.Sets = sets;
gcinclude = gFunc.LoadFile('common/gcinclude.lua');

--profile.Packer = {};

local Settings = {
    ML_Mode = false
};

local WSTable = {};

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(-1, '/macro book 4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/macro set 1');

    AshitaCore:GetChatManager():QueueCommand(1, '/alias /mage /lac fwd ML_Mode');

    AshitaCore:GetChatManager():QueueCommand(500, '/lockstyleset 4');
end

profile.OnUnload = function()
    gcinclude.Unload();

    AshitaCore:GetChatManager():QueueCommand(1, '/alias delete /mage');

    AshitaCore:GetChatManager():QueueCommand(500, '/lockstyle off');
end

profile.HandleCommand = function(args)
    if(args[1] == 'ML_Mode') then
        Settings.ML_Mode = not Settings.ML_Mode;
        if(Settings.ML_Mode) then
            gFunc.Message("Melee Mode is ON");
        else
            gFunc.Message("Melee Mode is OFF");
        end
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();

    if(player.Status == 'Engaged') then
        gFunc.EquipSet(sets.TP_Priority);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Rest_Base);
        if (ML_Mode) then
            --gFunc.Equip('Main', 'Dark Staff');
        end
    else
        gFunc.EquipSet(sets.Idle_Base);
        if (ML_Mode) then
            --gFunc.Equip('Main', 'Earth Staff');
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
        gFunc.EquipSet(sets.Haste_Base);
    elseif (action.Type == 'Summoning') then
        -- Why?
    elseif (action.Type == 'Blue Magic') then
    elseif (action.Type == 'Bard Song') then
    else
        -- How?
    end
    if (ML_Mode) then
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
    if WSTable.Contains(action.Name) then
        gFunc.EquipSet('WS_' + WSTable[action.Name]);
    else
        gFunc.EquipSet(sets.WS_Base);
    end
end

return profile;