class Button
  attr_accessor :x, :y, :width, :height
  def initialize(window, x, y, width, height)
    @x = x
    @y = y
    @width = width
    @height = height
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

class GrassButton < Button
  def initialize(window)
    super(window, x, y, width, height)
    @image = Gosu::Image.new(window, "media/grass.png", false)
  end
end

class DirtButton < Button
  def initialize(window)
    super(window, x, y, width, height)
    @image = Gosu::Image.new(window, "media/dirt.png", false)
  end
end

class WaterButton < Button
  def initialize(window)
    super(window, x, y, width, height)
    @image = Gosu::Image.new(window, "media/water.png", false)
  end
end

class EndButton < Button
  def initialize(window)
    super(window, x, y, width, height)
    @image = Gosu::Image.new(window, "media/end.png", false)
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