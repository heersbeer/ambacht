function love.load()

  love.window.setMode(1024, 768, {resizable=false})

  windfield = require('lib/windfield/')
  anim8 = require('lib/anim8/anim8')
  world = windfield.newWorld()
  require('conf')

  require("src/collisionClasses")
  createCollisionClasses()

  require('src/resources')
  require('src/player')
  require('src/tiledmap')

  map = loadTiledMap('gfx/tiles/tiletest')

  --testBlock = world:newRectangleCollider(282, -90, 198, 198)
  --testBlock:setType('static')
end

function love.update(dt)
  player:update(dt)
  world:update(dt)
end

function love.draw()
  map:draw()
  player:draw()
  world:draw()
end
