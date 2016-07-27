ENTITIES_PATH = 'entities/'
require(ENTITIES_PATH..'player')
require(ENTITIES_PATH..'enemy')

--[[

  Love: Loading

]]
function love.load(arg)
  -- Center screen
  camera = {
    x = love.graphics.getWidth() / 2,
    y = love.graphics.getHeight() / 2
  }

  objects = {
    player = Player:new(),
    enemy = Enemy:new()
  }
end

function love.update(dt)
  for k,v in pairs(objects) do
    v:script(dt)
    v:act(dt)
  end
end

function love.draw()
  -- Centers camera on screen
  love.graphics.translate(camera.x, camera.y)
  for k,v in pairs(objects) do
    v:draw()
  end
end
