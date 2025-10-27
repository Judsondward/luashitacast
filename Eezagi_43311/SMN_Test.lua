--[[
    gData.GetPet().Name() doesn't work. Refactor for last summon cast
]]

local profile = {};
local sets = {
};
profile.Sets = sets;

profile.Packer = {
};

local settings = {
    petName = 'Odin'
}

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
end

profile.HandleAbility = function()
    local petAction = gData.GetPetAction();
    local currPet = gData.GetPet();
    local action = gData.GetAction();

    if (action ~= nil) then
        AshitaCore:GetChatManager():QueueCommand(2, '/echo ' .. action.Name);
    end
    if(petAction ~= nil) then
        AshitaCore:GetChatManager():QueueCommand(2, '/echo ' .. settings.petName);
    end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
end

profile.HandleMidcast = function()
    local action = gData.GetAction();
    if (action.Skill == 'Summoning') then
        settings.petName = action.Name;
        AshitaCore:GetChatManager():QueueCommand(2, '/echo ' .. settings.petName);
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

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

return profile;