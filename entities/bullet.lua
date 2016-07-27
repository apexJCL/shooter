--[[
  Entity: Bullet
]]

Bullet = {}

function Bullet:new()
  require(ENTITIES_PATH..'baseEntity')
  description = {
    x = 0,
    y = 0,
    direction = 0,
    speed = 10,
    sprite = love.graphics.newImage('assets/bullet.png'),
    moving = false,
    angle = 0,
    sound_shoot = love.audio.newSource('assets/sounds/shoot.wav', "static")
  }
  description.width, description.height = description.sprite:getDimensions()
  self.__index = self
  return setmetatable(description, self)
end

--[[

  Bullet: Acting

]]
function Bullet:act (dt)
  self:shoot(dt)
end

--[[

  Bullet: Drawing

]]
function Bullet:draw ()
  love.graphics.draw(self.sprite, self.x, self.y, self.direction, 1, 1, self.width / 2, self.height / 2)
  -- Drawing trajectory
  love.graphics.line(
    0,
    0,
    100 * math.cos(self.direction),
    100 * math.sin(self.direction)
  )
end

--[[

  Bullet: Scripting

]]

function Bullet:script (dt)
end

--[[

  Extra Functions

]]

function Bullet:setDirection (direction)
  if not self.moving then
    self.direction = direction
  end
end

function Bullet:shoot (dt)
  self.angle = (self.direction * 360) / (2 * math.pi)
  if self.moving and not touchingEdge(self) then
    self.x = self.x + self.speed * math.cos(self.direction)
    self.y = self.y + self.speed * math.sin(self.direction)
  else
    self.moving = false
    self.x = 0
    self.y = 0
  end
end

function Bullet:init_shoot (direction)
  if not self.moving then
    self:setDirection(direction)
    self.moving = true
    self.sound_shoot:play()
  end
end
