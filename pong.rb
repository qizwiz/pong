#!/usr/bin/env ruby

require 'sdl'

SDL.init(SDL::INIT_VIDEO)
screen = SDL::setVideoMode(640, 480, 16, SDL::SWSURFACE)
SDL::WM::setCaption $0, $0
splash_logo = SDL::Surface.load("splash.png")

while true
  screen.put(splash_logo, 0, 0)
  screen.updateRect(0, 0, 0, 0)
  while event = SDL::Event2.poll
    case event
    when SDL::Event2::KeyDown, SDL::Event2::Quit
      exit
    end
  end
end

