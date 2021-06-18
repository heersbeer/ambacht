function love.load()
  love.window.setMode(1024, 768, {resizable=false})

  windfield = require('lib/windfield/')
  anim8 = require('lib/anim8/anim8')
  world = windfield.newWorld()


  require("src/collisionClasses")
  createCollisionClasses()

  require('src/resources')
  require('src/player')

  testBlock = world:newRectangleCollider(282, -90, 198, 198)
  testBlock:setType('static')

end

function love.update(dt)
  player:update(dt)
  world:update(dt)
end

function love.draw()
  love.graphics.draw(textures.background)

  player:draw()
  world:draw()
end
