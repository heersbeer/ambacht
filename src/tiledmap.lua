function loadTiledMap(path)
  local map = require(path)

  map.quads = {}

  local tileset = map.tilesets[1]
  map.tileset = tileset
  map.image = love.graphics.newImage(tileset.image)

  map.frame = 0
  map.timer = 0.0
  map.maxTimer = 0.1

  for y = 0, (tileset.imageheight / tileset.tileheight) - 1 do
      for x = 0, (tileset.imagewidth / tileset.tilewidth) - 1 do
          local quad = love.graphics.newQuad(
              x * tileset.tilewidth,
              y * tileset.tileheight,
              tileset.tilewidth,
              tileset.tileheight,
              tileset.imagewidth,
              tileset.imageheight
          )
          table.insert(map.quads, quad)
      end
  end

  function map:update(dt)
      if self.timer > self.maxTimer then
          self.frame = self.frame + 1
          self.timer = 0
      end

      self.timer = self.timer + dt
  end

  function map:draw()
      for i, layer in ipairs(self.layers) do
          for y = 0, layer.height - 1 do
              for x = 0, layer.width - 1 do
                  local index = (x + y * layer.width) + 1
                  local tid = layer.data[index]

                  if tid ~= 0 then
                      local quad = self.quads[tid]
                      local xx = x * self.tileset.tilewidth
                      local yy = y * self.tileset.tileheight

                      love.graphics.draw(
                          self.image,
                          quad,
                          xx,
                          yy
                      )
                      -- nu in map 2 bools, Collision en Queryable. Straks anders doen, bv met object types
                      if self.tileset.tiles[tid].properties["Collision"] == true then
                        testBlock = world:newRectangleCollider(
                          xx,
                          yy,
                          self.tileset.tilewidth,
                          self.tileset.tileheight
                        )
                        testBlock:setType('static')
                        testBlock:setCollisionClass('Solid')
                      end

                      if self.tileset.tiles[tid].properties["Queryable"] == true then
                        testBlock = world:newRectangleCollider(
                          xx,
                          yy,
                          self.tileset.tilewidth,
                          self.tileset.tileheight
                        )
                        testBlock:setType('static')
                        testBlock:setCollisionClass('Queryable')
                        testBlock.text = self.tileset.tiles[tid].properties["QueryText"]
                        
                      end
                  end
              end
          end
      end
    end

  return map
end
