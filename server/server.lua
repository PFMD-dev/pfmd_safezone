local GetCurrentResourceName = GetCurrentResourceName()
RegisterServerEvent('pfmd_safezone:setImmune')
AddEventHandler('pfmd_safezone:setImmune', function(isImmune)
    local playerId = source
    TriggerClientEvent('pfmd_safezone:setImmune', playerId, isImmune)
end)


AddEventHandler('onResourceStart', function()
    if GetCurrentResourceName == "pfmd_safezone" then
        if Config.VersionCheck == true then
            print('version check')
            lib.versionCheck('Pixel-FiveM-Development/pfmd_safezone')
        end
    else 
        print('Script name should be pfmd_safezone or it wont work  !!')
    end
end)