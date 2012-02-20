class GrassTile
  attr_accessor :x, :y, :width, :height
  def initialize(window)
    @x = x
    @y = y
    @image = Gosu::Image.new(window, "media/grass.png", false)
  end
  def draw
    @image.draw(@x, @y, ZOrder::UI)
  end
  def warp(x, y)
    @x, @y = x, y
  end
  def button_down(id)
    if id == Gosu::MsLeft then
      if @self.under_point? then
        Process.exit
      end
    end
  end
  def under_point?(mouse_x, mouse_y)
    mouse_x > @x and mouse_x < @x + 40 and
    mouse_y > @y and mouse_y < @y + 40
  end
end

class DirtTile
  attr_accessor :x, :y, :width, :height
  def initialize(window)
    @x = x
    @y = y
    @width = width
    @height = height
    @image = Gosu::Image.new(window, "media/dirt.png", false)
  end
  def draw
    @image.draw(@x, @y, ZOrder::UI)
  end
  def warp(x, y)
    @x, @y = x, y
  end
  def under_point?(mouse_x, mouse_y)
    mouse_x > @x and mouse_x < @x + 40 and
    mouse_y > @y and mouse_y < @y + 40
  end
end

class WaterTile
  attr_accessor :x, :y, :width, :height
  def initialize(window)
    @x = x
    @y = y
    @width = width
    @height = height
    @image = Gosu::Image.new(window, "media/water.png", false)
  end
  def draw
    @image.draw(@x, @y, ZOrder::UI)
  end
  def warp(x, y)
    @x, @y = x, y
  end
  def under_point?(mouse_x, mouse_y)
    mouse_x > @x and mouse_x < @x + 40 and
    mouse_y > @y and mouse_y < @y + 40
  end
end