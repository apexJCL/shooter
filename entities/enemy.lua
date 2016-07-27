require(ENTITIES_PATH..'baseEntity')
math.randomseed(os.time())
math.random()
math.random()
math.random()

local width_bound = love.graphics.getWidth() / 2
local height_bound = love.graphics.getHeight() / 2

Enemy = BaseEntity:new()

function Enemy:new()
  description = BaseEntity:new()
  description.x = math.random(-width_bound, width_bound)
  description.y = math.random(-height_bound, height_bound)
  description:setSprite(love.graphics.newImage('assets/enemy.png'), true)
  self.__index = self
  return setmetatable(description, self)
end

function Enemy:act (dt, bullet)
  if self:shooted(bullet) then
    bullet.touchingEnemy = true
    self.x, self.y = math.random(-width_bound, width_bound), math.random(-height_bound, height_bound)
  end
end

function Enemy:shooted (bullet)
  -- Basic axis collision detection
  return (math.abs(self.x - bullet.x) * 2 <= (self.width + bullet.width)) and
         (math.abs(self.y - bullet.y) * 2 <= (self.height + bullet.height))
end
