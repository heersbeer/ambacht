textbox = {}
textbox.topX = love.graphics.getWidth() * 0.16
textbox.topY = love.graphics.getHeight() * 0.8
textbox.width = love.graphics.getWidth() * 0.68
textbox.height = love.graphics.getHeight() * 0.15
textbox.margin = 10

function textbox:update()

end

function textbox:draw()
    if player.talks == true then
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.rectangle("fill", textbox.topX, textbox.topY, textbox.width, textbox.height, 5, 5)
      love.graphics.setColor(0, 0, 0, 1)
      love.graphics.print(player.text, textbox.topX + textbox.margin, textbox.topY + textbox.margin)
      love.graphics.setColor(1, 1, 1, 1)
    end
end
