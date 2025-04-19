ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('ny8_dirtywithdraw:convert')
AddEventHandler('ny8_dirtywithdraw:convert', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local dirty = xPlayer.getAccount('black_money').money
    if dirty > 0 then
        local reward = math.floor(dirty * (Config.Percentage / 100))
        xPlayer.setAccountMoney('black_money', 0)
        xPlayer.addMoney(reward)
        TriggerClientEvent('ny8_dirtywithdraw:notify', source, "Tu as retiré ~g~$" .. reward .. "~s~ sur ~r~$" .. dirty, 'success')
    else
        TriggerClientEvent('ny8_dirtywithdraw:notify', source, "Tu n'as pas d'argent sale.", 'error')
    end
end)