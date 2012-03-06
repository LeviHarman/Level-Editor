class Tile
  attr_accessor :x, :y, :width, :height
  def initialize(window, x, y, width, height)
    @x = x
    @y = y
    @width = width
    @height = height
  end
  def tile_position( mouse_x, mouse_y )
    @x = (mouse_x / 40).floor  * 40
    @y = (mouse_y / 40).floor  * 40
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

class GrassTile < Tile
  def initialize(window)
    super(window, x, y, width, height)
    @image = Gosu::Image.new(window, "media/grass.png", false)
  end
end

class WaterTile < Tile
  def initialize(window)
    super(window, x, y, width, height)
    @image = Gosu::Image.new(window, "media/water.png", false)
  end
end

class DirtTile < Tile
  def initialize(window)
    super(window, x, y, width, height)
    @image = Gosu::Image.new(window, "media/dirt.png", false)
  end
end

class TilledDirtTile < Tile
  def initialize(window)
    super(window, x, y, width, height)
    @image = Gosu::Image.new(window, "media/tilled_dirt.png", false)
  end
end

class WetDirtTile < Tile
  def initialize(window)
    super(window, x, y, width, height)
    @image = Gosu::Image.new(window, "media/wet_dirt.png", false)
  end
end