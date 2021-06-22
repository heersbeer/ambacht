player = world:newRectangleCollider(400, 368, 30, 50)
player:setCollisionClass("Player")

player.x = love.graphics.getWidth() / 2
player.y = love.graphics.getHeight() / 2
player.width = 64
player.height = 64
player.speed = 130
player.isMoving = false
player.dir = "down"

player.grids = {}
player.grids.walk = anim8.newGrid(player.width, player.height, textures.player:getWidth(), textures.player:getHeight(), 0, 6, 0)

player.animations = {}
player.animations.walkUp = anim8.newAnimation(player.grids.walk('1-9', 1), 0.07)
player.animations.walkLeft = anim8.newAnimation(player.grids.walk('1-9', 2), 0.09)
player.animations.walkDown = anim8.newAnimation(player.grids.walk('1-9', 3), 0.07)
player.animations.walkRight = anim8.newAnimation(player.grids.walk('1-9', 4), 0.09)

player.anim = player.animations.walkDown

function player:update(dt)
  if player.isMoving then
      player.anim:update(dt)
  end

  local vectorX = 0
  local vectorY = 0

  if love.keyboard.isDown("a") then
      vectorX = -1
      player.anim = player.animations.walkLeft
      player.dir = "left"
      player.x = player.x - player.speed*dt
  end
  if love.keyboard.isDown("d") then
      vectorX = 1
      player.anim = player.animations.walkRight
      player.dir = "right"
      player.x = player.x + player.speed*dt
  end
  if love.keyboard.isDown("w") then
      vectorY = -1
      player.anim = player.animations.walkUp
      player.dir = "up"
      player.y = player.y - player.speed*dt
  end
  if love.keyboard.isDown("s") then
      vectorY = 1
      player.anim = player.animations.walkDown
      player.dir = "down"
      player.y = player.y + player.speed*dt
  end

  player:setLinearVelocity(vectorX * player.speed, vectorY * player.speed)

  if vectorX == 0 and vectorY == 0 then
      player.isMoving = false
      player.anim:gotoFrame(1) -- go to standing frame
  elseif not player.isMoving then
      player.isMoving =  true
      player.anim:gotoFrame(2)
  end
end

function player:draw()
    love.graphics.setColor(1, 1, 1, 1)
    local px = player:getX()
    local py = player:getY()
    player.anim:draw(textures.player, px, py, nil, sx, 1, player.width/2, player.height/2)
end
