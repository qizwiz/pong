class GameWindow < Gosu::Window

  @game_started = false

  def initialize
    super(640, 480, false)
    self.caption = "Awesome Pong"
    @background_image = Gosu::Image.new(self, "data/splash.png", true)
    # Add text for Start
    # Trap keys for up/down selection
    # Play some startup music in a loop.
    self.show
  end


  def start_game
    @background_image = Gosu::Image.new(self, "data/playing-field.png", true)

    @red_player = Player.new(self, false)
    @red_player.warp(25, 75)

    @blue_player = Player.new(self, true)
    @blue_player.warp(600, 75)

    @ball = Ball.new(self)
    @ball.warp(320, 240)
    @game_started = true
  end


  def update
    if @game_started
      if button_down? Gosu::Button::KbUp or button_down? Gosu::Button::GpUp
        @blue_player.move_up
      end

      if button_down? Gosu::Button::KbDown or button_down? Gosu::Button::GpDown
        @blue_player.move_down
      end

      if button_down? Gosu::Button::KbW
        @red_player.move_up
      end

      if button_down? Gosu::Button::KbS
        @red_player.move_down
      end

      @red_player.move
      @blue_player.move

    else
      # we're in the splash screen, so handle the menu selection.
      if button_down? Gosu::Button::KbS
        start_game
      end
    end

  end


  def draw
    if @game_started
      @red_player.draw
      @blue_player.draw
      @ball.draw
    end
    @background_image.draw(0, 0, 0);
  end


  def button_down(id)
    if id.eql? Gosu::Button::KbEscape or id.eql? Gosu::Button::KbQ
      close
    end
  end


end
