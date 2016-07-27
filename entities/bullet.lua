require(ENTITIES_PATH..'baseEntity')
--[[
  Entity: Bullet
]]

Bullet = BaseEntity:new{}

function Bullet:new()
  description = BaseEntity:new()
  description.speed = 10
  description.moving = false
  description.angle = 0
  description.sound_shoot = love.audio.newSource('assets/sounds/shoot.wav', "static")
  description:setSprite(love.graphics.newImage('assets/bullet.png'), true)
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
  if self.moving and not self:touchingEdge(self) then
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
