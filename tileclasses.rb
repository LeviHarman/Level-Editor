class GrassTile
  attr_accessor :x, :y
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
end

class DirtTile
  attr_accessor :x, :y
  def initialize(window)
    @x = x
    @y = y
    @image = Gosu::Image.new(window, "media/dirt.png", false)
  end
  def draw
    @image.draw(@x, @y, ZOrder::UI)
  end
  def warp(x, y)
    @x, @y = x, y
  end
end

class WaterTile
  attr_accessor :x, :y
  def initialize(window)
    @x = x
    @y = y
    @image = Gosu::Image.new(window, "media/water.png", false)
  end
  def draw
    @image.draw(@x, @y, ZOrder::UI)
  end
  def warp(x, y)
    @x, @y = x, y
  end
end