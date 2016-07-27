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
  player = Player:new()
  enemy = Enemy:new()
end

function love.update(dt)
  player:script(dt)
  player:act(dt)
  enemy:act(dt, player.bullet)
end

function love.draw()
  -- Centers camera on screen
  love.graphics.translate(camera.x, camera.y)
  player:draw()
  enemy:draw()
  debug()
end

function debug ()
  love.graphics.print("Direction: "..player.direction, -camera.x, -camera.y + 10)
  mx, my = s2m()
  love.graphics.print("Mouse: X="..mx..", Y="..my, -camera.x, -camera.y + 25)
  love.graphics.print("Camera: X: "..camera.x..", Y: "..camera.y, -camera.x, -camera.y + 50)
  love.graphics.print("Enemies shooted: "..player.bullet.enemiesShooted, -camera.x, -camera.y + 75)
end

function s2m ()
  x, y = love.mouse.getPosition()
  x = x - camera.x
  y = y - camera.y
  return x, y
end
