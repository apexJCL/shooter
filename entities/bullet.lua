require(ENTITIES_PATH..'baseEntity')
--[[
  Entity: Bullet
]]

Bullet = BaseEntity:new{}

function Bullet:new()
  description = BaseEntity:new()
  description.speed = 800
  description.moving = false
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
  if self.moving then
    if self:touchingEdge() == false and self.touchingEnemy == false then
      self.x = self.x + self.speed * dt * math.cos(self.direction)
      self.y = self.y + self.speed * dt * math.sin(self.direction)
    else
      self.sound_shoot:rewind()
      self.x = 0
      self.y = 0
      self.moving = false
      return self.touchingEnemy
    end
  end
end

function Bullet:init_shoot (direction)
  if not self.moving and not self.touchingEnemy then
    self:setDirection(direction)
    self.moving = true
    self.touchingEnemy = false
    self.sound_shoot:play()
  end
end
