--ext
require "ext.TSerial"
require "ext.console"

--script
require "graphics.import"
require "tiles"
require "generate"
require "car"

function love.load()
  --Create Background
  createTileWorld()

  --Generate Map
  set = generateMap()
  setTileWorldFromSet(set)

  --Create Players
  car1 = newCar(10, 10, IMAGE_CAR_BLUE)
  car2 = newCar(10, 12, IMAGE_CAR_RED)
  car2.controls = {left = "a", right = "d", up = "w", down = "s"}
end

function love.update(dt)
  --Update Players
  updateCar(car1, dt)
  updateCar(car2, dt)
end

function love.draw()
  --Draw Background
  drawTileWorldBackground()

  --Draw Cars
  drawCar(car1)
  drawCar(car2)

  --Draw Foreground
  drawTileWorldForeground()

  --Draw Console
  trace.draw()

end
