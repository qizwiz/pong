require 'gosu'

class GameWindow < Gosu::Window

  def initialize
    super(640, 480, false)
    self.caption = "Gosu Pong"

    @background_image = Gosu::Image.new(self, "data/playing-field.png", true)

    @player = Player.new(self)
    @player.warp(25, 75)

    @ball = Ball.new(self)
    @ball.warp(320, 240)

  end

  def update
    if button_down? Gosu::Button::KbUp or button_down? Gosu::Button::GpUp then
      @player.move_up
    end

    if button_down? Gosu::Button::KbDown or button_down? Gosu::Button::GpDown then
      @player.move_down
    end

    @player.move
  end

  def draw
    @player.draw
    @ball.draw
    @background_image.draw(0, 0, 0);
  end

  def button_down(id)
    if id.eql? Gosu::Button::KbEscape or id.eql? Gosu::Button::KbQ
      close
    end
  end

end
