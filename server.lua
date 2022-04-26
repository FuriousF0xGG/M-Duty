print("A script created by Max W.#0001") --GIVES ME CREDIT FOR SCRIPT (DO NOT REMOVE PLEASE!)

--PLEASE MAKE SURE YOU GO OFF DUTY AS THE CURRENT DEPARTMENT BEFORE GOING ON DUTY AS ANOTHER AS IT COULD BREAK THE TABLE
local people = { }

--ace permissions
local duty = "furiousfoxgg.duty"
local emsduty = 'furiousfoxgg.emsduty.toggle'
local civduty = 'furiousfoxgg.civ.toggle'

-- Editing stuff below this line will be at your own risk

--add blip and (duty)
RegisterCommand(Config.Duty_Command, function(source, args)
  local name = GetPlayerName(source) -- Gets player name
  if IsPlayerAceAllowed(source, duty) and has_value(people, name) then
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You are now off-duty toggling blips!'}) --make sure you have the mythic_notify resource @ https://github.com/JayMontana36/mythic_notify
    TriggerEvent('eblips:remove', source)
--    TriggerClientEvent('FuriousFoxGG:removeWeapons') --upcoming
    removeFirst(people, name) --Set table to remove the name


  elseif IsPlayerAceAllowed(source, duty) and not has_value(people, name) then
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You are now on-duty toggling blips!'})
    TriggerEvent('eblips:add', {name = GetPlayerName(source), src = source, color = 3})
--    TriggerClientEvent('FuriousFoxGG:giveWeapons') coming soon
    table.insert(people, name)
  else
    print("you lack the permission to toggle on/ off duty")
    end
end)

--You can use this if you have a certified civillian department in your server
RegisterCommand(Config.Civ_Duty_Command, function(source, args)
  local name = GetPlayerName(source) -- Gets player name
  if IsPlayerAceAllowed(source, civduty) and has_value(people, name) then
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You are now off-duty as a Civ!'}) --make sure you have the mythic_notify resource @ https://github.com/JayMontana36/mythic_notify
    removeFirst(people, name) --Set table to remove the name


  elseif IsPlayerAceAllowed(source, civduty) and not has_value(people, name) then
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You are now on-duty as a Civ!'})
    table.insert(people, name)
  else
    print("you lack the permission to toggle on/ off duty")
    end
end)

RegisterCommand(Config.EMS_Duty_Command, function(source, args)
local name = GetPlayerName(source) --Gets The name of the player through the source
 if IsPlayerAceAllowed(source, emsduty) and has_value(people, name) then
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You are now off-duty as EMS!'}) --make sure you have the mythic_notify resource @ https://github.com/JayMontana36/mythic_notify
  TriggerEvent('eblips:remove', source)
  removeFirst(people, name) --removes from table

 elseif IsPlayerAceAllowed(source, emsduty) and not has_value (people, name) then
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You are now on-duty as EMS toggling blips!'})
  TriggerEvent('eblips:add', {name = GetPlayerName(source), src = source, color = 5})
  table.insert(people, name)
 else
  print("you lack the permission to toggle ems on/ off duty")
  end
end)

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function removeFirst(tbl, val)
  for i, v in ipairs(tbl) do
    if v == val then
      return table.remove(tbl, i)
    end
  end
end
