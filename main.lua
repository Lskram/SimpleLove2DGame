local player = {
    x = 300,
    y = 400,
    speed = 200,
    image = nil,
    scale = 0.08 -- ปรับขนาดภาพลง 50%
}

function love.load()
    -- โหลดรูปภาพของ player
    player.image = love.graphics.newImage("player.png")
end

function love.update(dt)
    -- ควบคุมการเคลื่อนที่ของ player ด้วยปุ่มลูกศร
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
    elseif love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    end

    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed * dt
    elseif love.keyboard.isDown("up") then
        player.y = player.y - player.speed * dt
    end
end

function love.draw()
    -- วาดภาพ player ที่ตำแหน่ง (player.x, player.y) และปรับขนาดภาพ
    love.graphics.draw(player.image, player.x, player.y, 0, player.scale, player.scale)

    -- พิมพ์ข้อความ "Hello, Love2D!" ที่ตำแหน่ง (400, 300)
    love.graphics.print("Hello, Love2D!", 400, 300)
end
