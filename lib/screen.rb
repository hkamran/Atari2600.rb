
require "ruby2d"

MAX_ZOOM = 5
MIN_ZOOM = 1

SCREEN_HEIGHT = 144
SCREEN_WEIGHT = 160

class Screen

  def initialize(&procedure)
    @zoom = 2
    @window = Window.new
    @window.set({
                    :title => "Hooboy",
                    :resizable => true,
                    :width => SCREEN_WEIGHT * @zoom,
                    :height => SCREEN_HEIGHT * @zoom,
                })
    @window.update do
      procedure.call
    end
    @window.show
  end

end