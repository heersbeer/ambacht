function love.load()
  -- hier alle init shit definieren, globals, libs, etc

  windfield = require('lib/windfield/windfield')
  anim8 = require('lib/anim8/anim8')
  world = windfield.newWorld()
  local _camera = require('lib/hump.camera')

  require("src/collisionClasses")
  createCollisionClasses()

  require('src/resources')
  require('src/player')
  require('src/tiledmap')

  map = loadTiledMap('gfx/tiles/map')
  camera = _camera(player.x, player.y)
  --camera.smoother = _camera.smooth.linear(500)



end

function love.update(dt)
-- gameloop, elke frame update
  world:update(dt)
  map:update(dt)

  player:update(dt)
  camX, camY = player:getPosition()
  --camera:lookAt(camX, camY)

  camera:lockWindow(
    camX,
    camY,
    300,
    500,
    220,
    380
  )

  if love.keyboard.isDown("escape") then
      love.event.quit()
  end

end

function love.draw()
-- ook gameloop, elke frame, vooral voor graphics, geen vars veranderen
  camera:attach()
  world:draw()
  map:draw()
  player:draw()
  camera:detach()
end
