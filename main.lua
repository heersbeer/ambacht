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

  map = loadTiledMap('gfx/tiles/rpg_pack')
  print(player.x, player.y)
  camera = _camera(player.x, player.y)
--[[
  camera:lockWindow(
    player.x,
    player.y,
    player.x - 50,
    player.x + 50,
    player.y -50,
    player.y +50
  )
]]--
end

function love.update(dt)
  local dx,dy = player.x - camera.x, player.y - camera.y
  camera:move(dx, dy)
  print(player.x, player.y)
  map:update(dt)
  player:update(dt)
  world:update(dt)

end

function love.draw()
  camera:attach()
  world:draw()
  map:draw()
  player:draw()
  camera:detach()
end
