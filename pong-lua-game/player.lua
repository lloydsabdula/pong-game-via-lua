Player = {}

function Player:load()

    self.x = 50
    self.y = love.graphics.getHeight() / 2 - 50
    self.width = 15
    self.height = 100
    self.speed = 300
end

function Player:update(dt)
   self:move(dt)
   self:CheckBoundaries()
end

function Player:move(dt)
    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end 
end

function Player:CheckBoundaries()
    if self.y < 0 then 
        self.y = 0 end
    if self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function Player:draw()

    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
