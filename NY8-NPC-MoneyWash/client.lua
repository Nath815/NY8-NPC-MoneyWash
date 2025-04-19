CreateThread(function()
    RequestModel(Config.WithdrawPedModel)
    while not HasModelLoaded(Config.WithdrawPedModel) do Wait(0) end

    local ped = CreatePed(0, Config.WithdrawPedModel, Config.WithdrawPedCoords.x, Config.WithdrawPedCoords.y, Config.WithdrawPedCoords.z - 1.0, Config.WithdrawPedCoords.w, false, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)

    exports.ox_target:addLocalEntity(ped, {
        {
            name = 'withdraw_dirty',
            icon = 'fas fa-money-bill-wave',
            label = '💸 Convertir argent sale',
            onSelect = function(data)
                TriggerServerEvent('ny8_dirtywithdraw:convert')
            end
        }
    })
end)

RegisterNetEvent('ny8_dirtywithdraw:notify')
AddEventHandler('ny8_dirtywithdraw:notify', function(msg, type)
    lib.notify({type = type or 'info', description = msg})
end)