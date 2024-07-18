lib.locale()

local isInSafeZone = false

function onEnter(self)
    local playerPed = PlayerPedId()
    print('entered zone', self.id)
    TriggerEvent('pfmd_safezone:notify', locale("inside_safezone"))
    TriggerServerEvent('pfmd_safezone:setImmune', true)
    isInSafeZone = true
    Citizen.CreateThread(function()
        while isInSafeZone do
            Citizen.Wait(1000) -- Check every second
            RemoveAllWeapons(playerPed)
        end
    end)
end

function onExit()
    print('exited zone')
    TriggerEvent('pfmd_safezone:notify', locale("exited_safezone"))
    TriggerServerEvent('pfmd_safezone:setImmune', false)
    isInSafeZone = false
end

function inside(isPointInside, point)
    if isInSafeZone then
        DisableControlAction(0, 24, true) -- Disable attack
        DisableControlAction(0, 25, true) -- Disable aim
        DisableControlAction(0, 142, true) -- Disable melee attack
        DisableControlAction(0, 257, true) -- Disable attack 2
        DisableControlAction(0, 263, true) -- Disable melee attack 1
        DisableControlAction(0, 140, true) -- Disable light melee attack
        DisableControlAction(0, 141, true) -- Disable heavy melee attack
        DisableControlAction(0, 37, true) -- Disable weapon wheel
      --  DisableControlAction(0, 44, true) -- Disable cover
     --   DisableControlAction(0, 23, true) -- Disable enter vehicle
    end
end

function RemoveAllWeapons(playerPed)
    local weapons = Config.weapons
    for _, weapon in ipairs(weapons) do
        if HasPedGotWeapon(playerPed, GetHashKey(weapon), false) then
            RemoveWeaponFromPed(playerPed, GetHashKey(weapon))
        end
    end
end

RegisterNetEvent('pfmd_safezone:setImmune')
AddEventHandler('pfmd_safezone:setImmune', function(isImmune)
    local playerPed = PlayerPedId()
    if isImmune then
        SetEntityInvincible(playerPed, true)
        SetPlayerInvincible(PlayerId(), true)
        ClearPedBloodDamage(playerPed)
        SetPedCanRagdoll(playerPed, false)
        SetPedCanBeTargetted(playerPed, false)
        SetPedSuffersCriticalHits(playerPed, false)
        SetEntityProofs(playerPed, true, true, true, true, true, true, true, true)
    else
        SetEntityInvincible(playerPed, false)
        SetPlayerInvincible(PlayerId(), false)
        SetPedCanRagdoll(playerPed, true)
        SetPedCanBeTargetted(playerPed, true)
        SetPedSuffersCriticalHits(playerPed, true)
        SetEntityProofs(playerPed, false, false, false, false, false, false, false, false)
    end
end)
