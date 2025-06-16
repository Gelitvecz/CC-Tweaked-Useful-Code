local monitor = peripheral.find("monitor")
local relay = peripheral.find("redstone_relay")

function getSeason(per,str)
  if per.getAnalogInput("front") > 0 then
    if str == "number" then return per.getAnalogInput("front")
    else return "Spring" end
  elseif per.getAnalogInput("left") > 0 then
    if str == "number" then return per.getAnalogInput("left")
    else return "Summer" end
  elseif per.getAnalogInput("back") > 0 then
    if str == "number" then return per.getAnalogInput("back")
    else return "Autumn" end
  elseif per.getAnalogInput("right") > 0 then
    if str == "number" then return per.getAnalogInput("right")
    else return "Winter" end
  else error("No season founded") end
end
function resetMonitor(per)
  per.setBackgroundColor(colors.white)
  per.setTextColor(colors.black)
  per.setCursorPos(1,1)
  per.setTextScale(1)
  per.clear()
end
function seasonExtra(num)
  if num <= 5 then return "Early"
  elseif num <= 10 then return "Mid"
  elseif num <= 15 then return "Late"
  else error("Out of range") end
end

while true do
  resetMonitor(monitor)
  season = getSeason(relay)
  exSeason = seasonExtra(getSeason(relay,"number"))
  monitor.write(("Season:%s %s"):format(exSeason,season))
  sleep(1)
end
