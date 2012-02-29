class GrassButton
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
  def under_point?(mouse_x, mouse_y)
    mouse_x > @x and mouse_x < @x + 40 and
    mouse_y > @y and mouse_y < @y + 40
  end
end

class DirtButton
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

class WaterButton
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

class GrassTile
  attr_accessor :x, :y, :width, :height, :x_tile, :y_tile
  def initialize(window)
    @x = x
    @y = y
    @width = width
    @height = height
    @x_tile = x_tile
    @y_tile = y_tile
    @image = Gosu::Image.new(window, "media/grass.png", false)
  end
  def tile_position( mouse_x, mouse_y )
    @x_tile = (mouse_x / 40).floor  * 40
    @y_tile = (mouse_y / 40).floor  * 40
  end
  def draw
    @image.draw(x_tile, y_tile, ZOrder::UI)
  end 
  def warp(x, y)
    @x, @y = x, y
  end
  def under_point?(mouse_x, mouse_y)
    mouse_x > @x and mouse_x < @x + 40 and
    mouse_y > @y and mouse_y < @y + 40
  end
end

class EndButton
  attr_accessor :x, :y, :width, :height
  def initialize(window)
    @x = x
    @y = y
    @image = Gosu::Image.new(window, "media/end.png", false)
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