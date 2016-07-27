ENTITIES_PATH = 'entities/'

function love.load(arg)
  -- Center screen
  camera = {
    x = love.graphics.getWidth() / 2,
    y = love.graphics.getHeight() / 2
  }
  -- Player Init
  require(ENTITIES_PATH..'player')
  player = Player:new()
end

function love.update(dt)
  player:script(dt)
  player.bullet:script(dt)
  player:act(dt)
end

function love.draw()
  -- Centers camera on screen
  love.graphics.translate(camera.x, camera.y)
  debug()
  -- Draws the player and centers
  player:draw()
end

function debug ()
  love.graphics.print("Screen Info, Width: "..love.graphics.getWidth()..' Height: '..love.graphics.getHeight(), -camera.x, -camera.y)
  love.graphics.print("X: "..player.x, -camera.x, 25 - camera.y)
  love.graphics.print("Y: "..player.y, -camera.x, 50 - camera.y)
  love.graphics.print("Width: "..player.width, -camera.x, 75 - camera.y)
  love.graphics.print("Height: "..player.height, -camera.x, 100 - camera.y)
  love.graphics.print("Rotation: "..player.direction, -camera.x, 125 - camera.y)
  love.graphics.print("Bullet", -camera.x, 150 - camera.y)
  love.graphics.print("X: "..player.bullet.x, -camera.x, 175 - camera.y)
  love.graphics.print("Y: "..player.bullet.y, -camera.x, 200 - camera.y)
  love.graphics.print("Width: "..player.bullet.width, -camera.x, 225 - camera.y)
  love.graphics.print("Height: "..player.bullet.height, -camera.x, 250 - camera.y)
  love.graphics.print("Direction: "..player.bullet.direction, -camera.x, 275 - camera.y)
  love.graphics.print("Angle: "..player.bullet.angle, -camera.x, 300 - camera.y)

  love.graphics.setColor(255, 255, 0, 255)
  love.graphics.print("FPS: "..love.timer.getFPS(), camera.x - 100, -camera.y + 100)
  love.graphics.setColor(255, 255, 255, 255)

  -- Crosshair
  love.graphics.line(0, -camera.y, 0, camera.y)
  love.graphics.line(-camera.x, 0, camera.x, 0)
end
