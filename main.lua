function love.load()

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
  camera.smoother = _camera.smooth.linear(130)
  --[[
  camera:lockWindow(
    player.x,
    player.y,
    200,
    600,
    150,
    450
  )
  ]]--
end

function love.update(dt)


  world:update(dt)

  map:update(dt)

  local dx,dy = player.x - camera.x, player.y - camera.y
  camera:move(dx, dy)
  player:update(dt)

  if love.keyboard.isDown("escape") then
      love.event.quit()
  end

end

function love.draw()
  camera:attach()
  world:draw()
  map:draw()
  player:draw()
  camera:detach()
end
