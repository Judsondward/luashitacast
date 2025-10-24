local profile = {};
local sets = {
    Idle_Base ={
        Main    = '',
        Sub     = '',
        Ranged  = '',
        Ammo    = '',
        Head    = '',
        Neck    = '',
        Ear1    = '',
        Ear2    = '',
        Body    = '',
        Hands   = '',
        Ring1   = '',
        Ring2   = '',
        Back    = '',
        Waist   = '',
        Legs    = '',
        Feet    = ''
    },

    BP_Magical = {};
    BP_Physical = {};
};
profile.Sets = sets;

sets.Idle_Light     = gFunc.Combine(sets.Idle_Base, {});
sets.Idle_Earth     = gFunc.Combine(sets.Idle_Base, {});
sets.Idle_Wind      = gFunc.Combine(sets.Idle_Base, {});
sets.Idle_Water     = gFunc.Combine(sets.Idle_Base, {});
sets.Idle_Fire      = gFunc.Combine(sets.Idle_Base, {});
sets.Idle_Ice       = gFunc.Combine(sets.Idle_Base, {});
sets.Idle_Thunder   = gFunc.Combine(sets.Idle_Base, {});
sets.Idle_Dark      = gFunc.Combine(sets.Idle_Base, {});

--profile.Packer = {};

local Settings = {
    petElement = 'Light';
}

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

local PetElementTable = {
    ['Carbuncle']   = 'Light',
    ['Titan']       = 'Earth',
    ['Garuda']      = 'Wind',
    ['Leviathan']   = 'Water',
    ['Ifrit']       = 'Fire',
    ['Shiva']       = 'Ice',
    ['Ramuh']       = 'Thunder',
    ['Fenrir']      = 'Dark',
    ['Diabolos']    = 'Dark'
};

profile.OnLoad = function()
    gSettings.AllowAddSet = false;

    AshitaCore:GetChatManager():QueueCommand(-1, '/macro book 12');
    AshitaCore:GetChatManager():QueueCommand(-1, '/macro set 1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/lockstyleset 12');
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
    local pet = gData.GetPet();
    local player = gData.GetPlayer();

    if(player.Status == 'Engaged') then
        gFunc.EquipSet(sets.TP);
    elseif(player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
        -- Idle SMN BS Goes here
        if(pet ~= nil) then
            gFunc.EquipSet('Idle_' .. PetElementTable[pet.Name]); 
            gFunc.Equip('main', EleStaffTable[PetElementTable[pet.Name]])
        else
            gFunc.EquipSet(sets.FriendlessHo);
        end
    end
end

profile.HandleAbility = function()
    local petAction = gData.GetPetAction();

    if(petAction ~= nil) and BPTable:contains(petAction.Name) then
        gFunc.EquipSet('BP_' .. BPTable[petAction.Name]);
    end
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