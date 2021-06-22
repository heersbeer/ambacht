function love.load()

  windfield = require('lib/windfield/')
  anim8 = require('lib/anim8/anim8')
  world = windfield.newWorld()
  require('conf')

  require("src/collisionClasses")
  createCollisionClasses()

  require('src/resources')
  require('src/player')
  require('src/tiledmap')

  map = loadTiledMap('gfx/tiles/rpg_pack')

end

function love.update(dt)
  map:update(dt)
  player:update(dt)
  world:update(dt)
end

function love.draw()
  map:draw()
  player:draw()
  world:draw()
end
