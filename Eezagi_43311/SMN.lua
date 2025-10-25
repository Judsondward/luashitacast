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

    Resting = {},

    BP_Base = {},
    PreCast = {},
    MidCast = {},

    Healing = {},
    Enhancing = {},

    TP_Base = {},
    WS_Base = {}

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
sets.BP_RP          = gFunc.Combine(sets.BP_Base, {});
sets.BP_RM          = gFunc.Combine(sets.BP_Base, {});
sets.BP_W           = gFunc.Combine(sets.BP_Base, {});

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

local WSTable = T{
    ['Heavy Swing'] = 'WS_Base',
    ['Rock Crusher'] = 'WS_Base',
	['Earth Crusher'] = 'WS_Base',
    ['Starburst'] = 'WS_Base',
	['Sunburst'] = 'WS_Base',
    ['Shell Crusher'] = 'WS_Base',
	['Full Swing'] = 'WS_Base',
	['Spirit Taker'] = 'WS_Base',
	['Retribution'] = 'WS_Base',
	['Cataclysm'] = 'WS_Base',
	['Shattersoul'] = 'WS_Base',
    ['Gate of Tartarus'] = 'WS_Base',
	['Myrkr'] = 'WS_Base',
	['Vidohunir'] = 'WS_Base',
	['Garland of Bliss'] = 'WS_Base',
	['Omniscience'] = 'WS_Base',
	['Tartarus Torpor'] = 'WS_Base'
};

local BPTable = T{
--Carbuncle M Rage
    ['Searing Light'] = 'BP_RM',
    ['Meteorite'] = 'BP_RM',
	['Holy Mist'] = 'BP_RM',
--Carbuncle P Rage
    ['Poison Nails'] = 'BP_RP',
--Carbuncle Ward
	['Healing Ruby'] = 'BP_W',
    ['Shining Ruby'] = 'BP_W',
	['Glittering Ruby'] = 'BP_W',
    ['Healing Ruby II'] = 'BP_W',
	['Soothing Ruby'] = 'BP_W',
    ['Pacifying Ruby'] = 'BP_W',
--Fenrir M Rage
	['Howling Moon'] = 'BP_RM',
    ['Lunar Bay'] = 'BP_RM',
--Fenrir P Rage
	['Moonlit Charge'] = 'BP_RP',
    ['Crescent Fang'] = 'BP_RP',
	['Eclipse Bite'] = 'BP_RP',
    ['Impact'] = 'BP_RP',
--Fenrir Ward
	['Lunar Cry'] = 'BP_W',
    ['Lunar Roar'] = 'BP_W',
	['Ecliptic Growl'] = 'BP_W',
    ['Ecliptic Howl'] = 'BP_W',
	['Heavenward Howl'] = 'BP_W',
--Ifrit M Rage
    ['Inferno'] = 'BP_RM',
	['Fire II'] = 'BP_RM',
    ['Fire IV'] = 'BP_RM',
	['Meteor Strike'] = 'BP_RM',
    ['Conflag Strike'] = 'BP_RM',
--Ifrit P Rage 
	['Punch'] = 'BP_RP',
    ['Burning Strike'] = 'BP_RP',
	['Double Punch'] = 'BP_RP',
    ['Flaming Crush'] = 'BP_RP',
--Ifrit Ward
	['Crimson Howl'] = 'BP_W',
    ['Inferno Howl'] = 'BP_W',
--Titan M Rage
	['Earthen Fury'] = 'BP_RM',
    ['Stone II'] = 'BP_RM',
	['Stone IV'] = 'BP_RM',
    ['Geocrush'] = 'BP_RM',
--Titan P Rage
	['Rock Throw'] = 'BP_RP',
    ['Rock Buster'] = 'BP_RP',
	['Megalith Throw'] = 'BP_RP',
    ['Mountain Buster'] = 'BP_RP',
	['Crag Throw'] = 'BP_RP',
--Titan Ward
    ['Earthen Ward'] = 'BP_W',
	['Earthen Armor'] = 'BP_W',
--Leviathan M Rage
    ['Tidal Wave'] = 'BP_RM',
	['Water II'] = 'BP_RM',
    ['Water IV'] = 'BP_RM',
	['Grand Fall'] = 'BP_RM',
--Leviathan P Rage
    ['Barracuda Dive'] = 'BP_RP',
	['Tail Whip'] = 'BP_RP',
	['Spinning Dive'] = 'BP_RP',
--Leviathan Ward
    ['Slowga'] = 'BP_W',
	['Spring Water'] = 'BP_W',
    ['Tidal Roar'] = 'BP_W',
	['Soothing Current'] = 'BP_W',
--Garuda M Rage
    ['Aerial Blast'] = 'BP_RM',
    ['Aero II'] = 'BP_RM',
	['Aero IV'] = 'BP_RM',
    ['Wind Blade'] = 'BP_RM',
--Garuda P Rage
	['Claw'] = 'BP_RP',
    ['Predator Claws'] = 'BP_RP',
--Garuda Ward
	['Aerial Armor'] = 'BP_W',
    ['Whispering Wind'] = 'BP_W',
	['Hastega'] = 'BP_W',
	['Fleet Wind'] = 'BP_W',
    ['Hastega II'] = 'BP_W',
--Shiva M Rage
	['Diamond Dust'] = 'BP_RM',
    ['Blizzard II'] = 'BP_RM',
	['Blizzard IV'] = 'BP_RM',
    ['Heavenly Strike'] = 'BP_RM',
--Shiva P Rage
    ['Axe Kick'] = 'BP_RP',
	['Double Slap'] = 'BP_RP',
    ['Rush'] = 'BP_RP',
--Shiva Ward
	['Frost Armor'] = 'BP_W',
    ['Sleepga'] = 'BP_W',
	['Diamond Storm'] = 'BP_W',
    ['Crystal Blessing'] = 'BP_W',
--Ramuh M Rage
	['Judgment Bolt'] = 'BP_RM',
	['Thunder II'] = 'BP_RM',
    ['Thunderspark'] = 'BP_RM',
	['Thunder IV'] = 'BP_RM',
    ['Thunderstorm'] = 'BP_RM',
--Ramuh P Rage
	['Shock Strike'] = 'BP_RP',
    ['Chaotic Strike'] = 'BP_RP',
    ['Volt Strike'] = 'BP_RP',
--Ramuh Ward
	['Rolling Thunder'] = 'BP_W',
    ['Lightning Armor'] = 'BP_W',
	['Shock Squall'] = 'BP_W',
--Diabolos M Rage
    ['Ruinous Omen'] = 'BP_RM',
	['Nether Blast'] = 'BP_RM',
    ['Night Terror'] = 'BP_RM',
--Diabolos P Rage
	['Camisado'] = 'BP_RP',
	['Blindside'] = 'BP_RP',
--Diabolos Ward: Somn. is not a mistake.
    ['Somnolence'] = 'BP_RM',
	['Nightmare'] = 'BP_W',
    ['Ultimate Terror'] = 'BP_W',
	['Noctoshield'] = 'BP_W',
    ['Dream Shroud'] = 'BP_W',
    ['Pavor Nocturnus'] = 'BP_W',
--Cait Sith M Rage
	['Level ? Holy'] = 'BP_RM',
--Cait Sith P Rage
    ['Regal Scratch'] = 'BP_RP',
--Cait Sith Ward
	['Altana\'s Favor'] = 'BP_W',
    ['Raise II'] = 'BP_W',
	['Mewing Lullaby'] = 'BP_W',
    ['Reraise II'] = 'BP_W',
	['Eerie Eye'] = 'BP_W',
--Siren M Rage
	['Clarsach Call'] = 'BP_RM',
    ['Sonic Buffet'] = 'BP_RM',
	['Tornado II'] = 'BP_RM',
--Siren P Rage
    ['Welt'] = 'BP_RP',
	['Roundhouse'] = 'BP_RP',
    ['Hysteric Assault'] = 'BP_RP',
--Siren Ward
    ['Lunatic Voice'] = 'BP_W',
	['Katabatic Blades'] = 'BP_W',
    ['Chinook'] = 'BP_W',
	['Bitter Elegy'] = 'BP_W',
    ['Wind\'s Blessing'] = 'BP_W',
--Odin M Rage
	['Zantetsuken'] = 'BP_RM',
--Alexander Ward
    ['Perfect Defense'] = 'BP_W',
--Atomos Type Null
	['Deconstruction'] = 'BP_RM',
	['Chronoshift'] = 'BP_RM'
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
    local envVar = gData.GetEnvironment();

    if(player.Status == 'Engaged') then
        gFunc.EquipSet(sets.TP_Base);
    elseif(player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
        -- Idle SMN BS Goes here
        if(pet ~= nil) then
            gFunc.EquipSet('Idle_' .. PetElementTable[pet.Name]); 
            -- Add Logic for Day/Weather Gear. 1 for day and 1 for weather.
            -- if day then equip blahblah
            -- if weather then equip blablah
            gFunc.Equip('main', EleStaffTable[PetElementTable[pet.Name]])
            if (envVar.DayElement == PetElementTable[pet.Name]) then
                -- gFunc.Equip('slot', 'Item Name');
            end
            if (envVar.WeatherElement == PetElementTable[pet.Name]) then
                -- gFunc.Equip('slot', 'Item Name');
            end
        else
            gFunc.EquipSet(sets.FriendlessHo);
        end
    end
end

profile.HandleAbility = function()
    local petAction = gData.GetPetAction();

    if(petAction ~= nil) and BPTable:contains(petAction.Name) then
        gFunc.EquipSet(BPTable[petAction.Name]);
    end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local action = gData.GetAction();
    if (action.ActionType == 'Spell') then
        gFunc.EquipSet(sets.PreCast);
    end
end

profile.HandleMidcast = function()
    local action = gData.GetAction();
    if (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
    elseif (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Healing);
    elseif (action.Skill == 'Summoning') then
        gFunc.EquipSet(sets.MidCast);
    end
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if(WSTable:contains(action.Name)) then
        -- I've made a set for it.
        gFunc.EquipSet(WSTable[action.Name]);
    else
        -- I didn't. Equip STR
        gFunc.EquipSet(sets.WS_Base);
    end
end

return profile;