--local imageSheet = graphics.newImageSheet("icon.png")
local physics = require("physics")
physics.start()

local _W = display.contentWidth
local _H = display.contentHeight

local platform = display.newRect(
	--x =
	 _W/2,
	--y = 
	 _H/2,
	--width = 
	 100,
	--height = 
	 100
)

--platform.surfaceType = "rectangle"	

local myImage = display.newImage("icon.png",_W/2,50)


local iconCollision = {
	friction = 0.0, --attrito
	bounce = 0.0, --rimbalzo (forse)
	isSensor = true --collisione con altri oggetti
}

physics:addBody(physics,platform,"static") 
physics:addBody(physics,myImage,"dynamic",iconCollision)

--local function onGyroscopeDataReceived(self,event)
  --  local deltaRadians = event.zRotation * event.deltaTime
  --  local deltaDegrees = deltaRadians * (180/math.pi)
--end

local function dragImage(event)
	local t=event.target
	print(event.phase)
	if(event.phase == "moved") then
		t.x = event.x
		t.y = event.y
	end
end

local function onCollision(event)
        if ( event.phase == "began" ) then
            print("toccato")
        end
end

platform.collision = onCollision
--if system.hasEventSource( "gyroscope" ) then
--    Runtime:addEventListener( "gyroscope", onGyroscopeDataReceived )
--end
Runtime:addEventListener("collision",platform)
Runtime:addEventListener("touch",dragImage)