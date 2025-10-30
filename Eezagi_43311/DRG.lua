local profile = {};
local sets = {
};
profile.Sets = sets;
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

--profile.Packer = {};

profile.OnLoad = function()
    gSettings.AllowAddSet = false;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(-1, '/macro book 15');
    AshitaCore:GetChatManager():QueueCommand(-1, '/macro set 1');
    AshitaCore:GetChatManager():QueueCommand(2, '/lockstyleset 15');
	--AshitaCore:GetChatManager():QueueCommand(1, '/bind F7 /lac fwd LockAll');
end

profile.OnUnload = function()
    gcinclude.Unload();
    AshitaCore:GetChatManager():QueueCommand(2, '/lockstyle off');
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
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