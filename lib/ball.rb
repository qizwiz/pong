class Ball
  def initialize(window)
    @image = Gosu::Image.new(window, "data/ball.png", false)
    @x = 240
    @y = 320
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def move_up
    @y -= 5
  end

  def move_down
    @y += 5
  end

  def move
    @x %= 640
    @y %= 480
  end

  def draw
    @image.draw(@x, @y, 1, 1)
  end
end
