class Player
  X_MAX = 640
  Y_MAX = 480

  def initialize(window, ai=false)
    if ai
      @image = Gosu::Image.new(window, "data/ai-paddle.png", false)
    else
      @image = Gosu::Image.new(window, "data/player-paddle.png", false)
    end
      @x = @y = 0.0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def move_up
    @y -= 5 unless @y < 0
  end

  def move_down
    @y += 5 unless @y+100 >= Y_MAX
  end

  def move
    return if @x > X_MAX or @y > Y_MAX
    # @x %= 640
    # @y %= 480
  end

  def draw
    @image.draw(@x, @y, 1, 1)
  end
end
