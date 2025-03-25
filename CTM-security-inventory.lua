-- qb-security-inventory.lua
-- Inventory Management for Security Detailing Job in QBCore

local QBCore = exports['qb-core']:GetCoreObject()

-- Config for Security Detailing Job Items
Config = {
    JobName = 'security',  -- Security Job Name
    SecurityItems = {  -- List of items for the security detailing job
        { name = 'flashlight', label = 'Flashlight', description = 'Use it to see in the dark.', type = 'item', quantity = 1 },
        { name = 'baton', label = 'Baton', description = 'Use it to subdue suspects.', type = 'item', quantity = 1 },
        { name = 'handcuffs', label = 'Handcuffs', description = 'Used to restrain suspects.', type = 'item', quantity = 2 },
        { name = 'firstaidkit', label = 'First Aid Kit', description = 'Used to heal injuries.', type = 'item', quantity = 1 },
        { name = 'fireextinguisher', label = 'Fire Extinguisher', description = 'Used to put out fires.', type = 'item', quantity = 1 },
        { name = 'radio', label = 'Radio', description = 'Used for communication with the team.', type = 'item', quantity = 1 },
        { name = 'pepper_spray', label = 'Pepper Spray', description = 'Used for self-defense against aggressors.', type = 'item', quantity = 1 },
        { name = 'walkie_talkie', label = 'Walkie Talkie', description = 'For communicating with other officers or security personnel.', type = 'item', quantity = 1 },
        { name = 'security_camera', label = 'Security Camera', description = 'Used for monitoring security footage.', type = 'item', quantity = 1 },
        { name = 'flashbang', label = 'Flashbang', description = 'Used to disorient suspects temporarily.', type = 'item', quantity = 1 },
        { name = 'night_vision', label = 'Night Vision Goggles', description = 'Used to see in the dark.', type = 'item', quantity = 1 },
        { name = 'bulletproof_vest', label = 'Bulletproof Vest', description = 'Provides protection from gunfire.', type = 'item', quantity = 1 },
        { name = 'spike_strips', label = 'Spike Strips', description = 'Used to stop fleeing vehicles by puncturing tires.', type = 'item', quantity = 1 },
        { name = 'flares', label = 'Flares', description = 'Used to signal for help or mark locations.', type = 'item', quantity = 3 },
        { name = 'clothing_set', label = 'Security Uniform', description = 'Wear this uniform for security details.', type = 'item', quantity = 1 },
        { name = 'lockpicks', label = 'Lockpicks', description = 'Used to unlock doors or gates.', type = 'item', quantity = 1 },
        { name = 'toolkit', label = 'Toolkit', description = 'Contains various tools for repairs.', type = 'item', quantity = 1 },
        { name = 'megaphone', label = 'Megaphone', description = 'For making announcements in large areas.', type = 'item', quantity = 1 },
        { name = 'taser', label = 'Taser', description = 'For incapacitating suspects without lethal force.', type = 'item', quantity = 1 },
        { name = 'cctv_access_card', label = 'CCTV Access Card', description = 'Used to access security camera footage.', type = 'item', quantity = 1 },
        { name = 'firearms_permit', label = 'Firearms Permit', description = 'Required to carry a weapon on duty.', type = 'item', quantity = 1 },
        { name = 'vehicle_keys', label = 'Security Vehicle Keys', description = 'Keys to the security vehicle.', type = 'item', quantity = 1 },
        { name = 'gps', label = 'GPS Device', description = 'Used for navigation to assigned locations.', type = 'item', quantity = 1 },
        { name = 'police_report', label = 'Police Report', description = 'Used to document any incidents that occur during the shift.', type = 'item', quantity = 1 },
        { name = 'baton_clip', label = 'Baton Clip', description = 'Used for carrying the baton securely on your uniform.', type = 'item', quantity = 1 },
        { name = 'badge', label = 'Security Badge', description = 'Represents your authority as security detail.', type = 'item', quantity = 1 },
        { name = 'escort_request', label = 'Escort Request Form', description = 'Used for requesting an escort for VIPs or important personnel.', type = 'item', quantity = 1 },
        { name = 'biohazard_kit', label = 'Biohazard Kit', description = 'Used for handling hazardous material situations.', type = 'item', quantity = 1 },
        { name = 'sound_level_meter', label = 'Sound Level Meter', description = 'Used to monitor noise levels in restricted areas.', type = 'item', quantity = 1 },
        { name = 'disruptive_protest_sign', label = 'Disruptive Protest Sign', description = 'Used for handling protests or crowds.', type = 'item', quantity = 1 },
        { name = 'cargo_seal', label = 'Cargo Seal', description = 'Used for sealing cargo areas during inspection.', type = 'item', quantity = 1 }
    }
}

-- Initialize Player's Inventory on Job Assignment
RegisterNetEvent('qb-security-inventory:assignJobItems', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if Player and Player.Job.name == Config.JobName then
        for _, item in ipairs(Config.SecurityItems) do
            Player.Functions.AddItem(item.name, item.quantity)
            TriggerClientEvent('QBCore:Notify', source, "You have received your security detailing equipment.", 'success')
        end
    end
end)

-- Create Inventory UI Event for Job Inventory
RegisterNetEvent('qb-security-inventory:openInventory', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if Player and Player.Job.name == Config.JobName then
        TriggerClientEvent('qb-inventory:openJobInventory', source, Config.SecurityItems)
    else
        TriggerClientEvent('QBCore:Notify', source, "You must be in the security job to access the job inventory.", 'error')
    end
end)

-- Check if Player has Required Items to Perform Tasks
RegisterNetEvent('qb-security-inventory:checkItem', function(itemName)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player:HasItem(itemName) then
        TriggerClientEvent('QBCore:Notify', source, "You have the required item: " .. itemName, 'success')
    else
        TriggerClientEvent('QBCore:Notify', source, "You don't have the required item: " .. itemName, 'error')
    end
end)
