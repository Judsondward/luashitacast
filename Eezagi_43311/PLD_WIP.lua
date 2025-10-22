local profile = {}

local cureCheat = false
local acc = {Low, High}
local def = {Off, PDT, MDT}
local override_sets = {Off, Shield, FireRes, IceRes}

local sets = {

}

profile.Sets=sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 7')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 7')
end

function toggleCheat()
    cureCheat = not curecheat
    AshitaCore:GetChatManager():QueueCommand(1, '/echo cureCheat is: ' + cureCheat)
end

profile.OnLoad = {
    --need to make function to make it a command to change accuracy mode and echo
    --need another function for PDT/MDT/Off
    --need a third function for overrides
    --need a fourth function for curecheat

    --AshitaCore:GetChatManager():QueueCommand(1, '/alias add /acc /lac fwd cycle acc')
    --AshitaCore:GetChatManager():QueueCommand(1, '/bind F9 /acc')
    --AshitaCore:GetChatManager():QueueCommand(1, '/alias add /def /lac fwd cycle def')
    --AshitaCore:GetChatManager():QueueCommand(1, '/bind F10 /def')
    --AshitaCore:GetChatManager():QueueCommand(1, '/alias add /ovrd /lac fwd cycle override')
    --AshitaCore:GetChatManager():QueueCommand(1, '/bind F11 /ovrd')
    AshitaCore:GetChatManager():QueueCommand(1, '/alias add /ccure /lac toggleCheat()')
    --AshitaCore:GetChatManager():QueueCommand(1, '/bind F12 /ccure')
}
profile.OnUnload = {
    --AshitaCore:GetChatManager():QueueCommand(1, '/alias del /acc')
}
profile.HandleDefault = {}
profile.HandleAbility = {}
profile.HandlePrecast = {}
profile.HandleMidcast = {}
profile.HandleItem = {}
profile.HandleWeaponskill = {}