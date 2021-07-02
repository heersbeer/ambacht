block comment = --[[]]--

Table printen:

for index, data in ipairs(table) do
    print(index)

    for key, value in pairs(data) do
        print('\t', key, value)
    end
end

hump.timer
Timer.during(1, function(dt)
  local px, py = player:getPosition()
  love.graphics.print(player.text, px + 15, py -30)
end
)
