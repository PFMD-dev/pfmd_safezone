 -- ####################################################################
 -- ###  EXAMPLE FOR MODIFICATION CODE BELOW USES LIB NOTIFICATIONS  ###
 -- ####################################################################
 lib.locale()

RegisterNetEvent('pfmd_safezone:notify', function(message)
	lib.notify({
        id = 'some_identifier',
        title = message,
        description = '',
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
                color = '#909296'
            }
        },
        icon = 'info',
        iconColor = '#C53030'
    })
end)



RegisterNetEvent('pfmd_safezone:notiiiiiiii', function(msg, msgg)
	lib.notify({
        id = 'g',
        title = msg,
        description = msgg,
        position = 'top',
        showDuration = false,
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
                color = '#909296'
            }
        },
        icon = 'info',
        iconColor = '#C53030'
    })
end)

--[[

 -- ####################################################################
 -- ###  EXAMPLE FOR MODIFICATION CODE BELOW USES ESX NOTIFICATIONS  ###
 -- ####################################################################


RegisterNetEvent('pfmd_safezone:notify', function(message)
    ESX.ShowNotification(message)
end)
]]

