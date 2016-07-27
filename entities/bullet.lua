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
  description.touchingEnemy = false
  description.enemiesShooted = 0
  description.sound_shoot = love.audio.newSource('assets/sounds/shoot.wav', "static")
  description:setSprite(love.graphics.newImage('assets/bullet.png'), true)
  self.__index = self
  return setmetatable(description, self)
end

--[[

  Bullet: Acting

]]
function Bullet:act (dt)
  if self:shoot(dt) then
    self.enemiesShooted  = self.enemiesShooted + 1
    self.touchingEnemy = false
  end
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
  if self.moving then
    if self:touchingEdge() == false and self.touchingEnemy == false then
      self.x = self.x + self.speed * math.cos(self.direction)
      self.y = self.y + self.speed * math.sin(self.direction)
    else
      self.moving = false
      return self.touchingEnemy
    end
  else
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
