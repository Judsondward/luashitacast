local profile = {};
local sets = {
    Idle = {};
};
profile.Sets = sets;
gcinclude = gFunc.LoadFile('common/gcinclude.lua');

--profile.Packer = {};

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(-1, '/macro book 5');
    AshitaCore:GetChatManager():QueueCommand(-1, '/macro set 1');
    --AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 3');
end

profile.OnUnload = function()
    gcinclude.Unload();
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyle off');
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
end

profile.HandleMidcast = function()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;