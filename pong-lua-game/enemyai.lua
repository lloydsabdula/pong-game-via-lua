ai = {}

function ai:load()
    self.width = 15
    self.height = 100
    self.x = love.graphics.getWidth() - 50 - self.width
    self.y = love.graphics.getHeight() / 2 - self.height / 2
    self.veloY = 0
    self.speed = 300

    self.timer = 0
    self.reactionTime = 0.6
end

function ai:update(dt)
    self:move(dt)
    self.timer = self.timer + dt
    if self.timer > self.reactionTime then
        self.timer = 0
    
    self:followBall()
    end
    self:CheckBoundaries()
end

function ai:move(dt)
    self.y = self.y + self.veloY * dt
end

function ai:CheckBoundaries()
    if self.y < 0 then 
        self.y = 0 end
    if self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function ai:followBall()
    if  Ball.y + Ball.height / 2 < self.y + self.height / 2 then
        self.veloY = -self.speed
        elseif Ball.y + Ball.height / 2 > self.y + self.height / 2 then
            self.veloY = self.speed
            else
                self.veloY = 0
            end
end

function ai:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end