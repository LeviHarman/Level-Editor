class GrassTile
  attr_accessor :x, :y
  def initialize(window)
    @image = Gosu::Image.new(window, "media/grass.png", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
  end
  def draw
    @image.draw_rot(@x, @y, ZOrder::UI, @angle)
  end
  def warp(x, y)
    @x, @y = x, y
  end
end

class DirtTile
  attr_accessor :x, :y
  def initialize(window)
    @image = Gosu::Image.new(window, "media/dirt.png", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
  end
  def draw
    @image.draw_rot(@x, @y, ZOrder::UI, @angle)
  end
  def warp(x, y)
    @x, @y = x, y
  end
end

class WaterTile
  attr_accessor :x, :y
  def initialize(window)
    @image = Gosu::Image.new(window, "media/water.png", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
  end
  def draw
    @image.draw_rot(@x, @y, ZOrder::UI, @angle)
  end
  def warp(x, y)
    @x, @y = x, y
  end
end