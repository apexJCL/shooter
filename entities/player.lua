--[[
  Entity: Player
]]

Player = {}

local screen_width = love.graphics.getWidth() / 2
local screen_height = love.graphics.getHeight() / 2

function Player:new()
  require(ENTITIES_PATH..'bullet')
  description = {
    x = 0,
    y = 0,
    direction = 0,
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
  -- Draws the bullet
  self.bullet:draw()
  -- Draws player
  love.graphics.draw(self.sprite, self.x, self.y, self.direction, 1, 1, self.width / 2, self.height / 2)
end

--[[

  Player: Acting

]]
function Player:act (dt)
  -- Bullet act
  self.bullet:act(dt)
  -- Cannon points to mouse position
  self.direction = math.atan2(love.mouse.getY() - screen_height, love.mouse.getX() - screen_width)
end

--[[

  Player: Scripting for actions

]]

function Player:script(dt)
  if love.keyboard.isDown('space') then
    self.bullet:init_shoot(self.direction)
  end
end

--[[

  Extra Functions

]]

function Player:setDirection (direction)
  self.direction = (math.pi * direction) / 4
end
