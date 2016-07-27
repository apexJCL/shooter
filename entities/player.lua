--[[
  Entity: Player
]]

Player = {}

function Player:new()
  require(ENTITIES_PATH..'bullet')
  description = {
    x = 0,
    y = 0,
    direction = 0,
    speed = 2,
    sprite = love.graphics.newImage('assets/shooter.png'),
    bullet = Bullet:new(),
    width = 0,
    height = 0
  }
  description.width, description.height = description.sprite:getDimensions()
  self.__index = self
  return setmetatable(description, self)
end

--[[

  Player: Drawing

]]
function Player:draw ()
  -- Draws player
  love.graphics.draw(self.sprite, self.x, self.y, self.direction, 1, 1, self.width / 2, self.height / 2)
  -- Draws the bullet
  self.bullet:draw()
end

--[[

  Player: Acting

]]
function Player:act (dt)
  self.bullet:setDirection(self.direction)
  self.bullet:act(dt)
  -- Cannon points automatically
  self.direction = (self.direction >= (2*math.pi) and 0) or self.direction + (self.speed * dt)
end

--[[

  Player: Scripting for actions

]]

function Player:script(dt)
  if love.keyboard.isDown('space') then
    self.bullet.moving = true
  end
end

--[[

  Extra Functions

]]

function Player:setDirection (direction)
  self.direction = (math.pi * direction) / 4
end
