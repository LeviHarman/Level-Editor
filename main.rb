require 'rubygems'
require 'gosu'
require './tileclasses.rb'
include Gosu

module ZOrder
  Background, Stars, UI, Mouse = *0..3
end

class Grid
end
#800 #640
class LevelEditorWindow < Gosu::Window
    attr_reader :x, :y
    
  def initialize
    super(800, 640, false)
    self.caption = "Negfaron."
    @background_image = Gosu::Image.new(self, "media/GrayBackground640x480.png", true)
    @cursor = Gosu::Image.new(self, "media/Cursor.png", false)
    @grass = GrassTile.new(self)
    @grass.warp(760, 0)
    @dirt = DirtTile.new(self)
    @dirt.warp(720, 0)
    @water = WaterTile.new(self)
    @water.warp(680, 0)
  end
  
  def under_point?(mouse_x, mouse_y)
    mouse_x > x and mouse_x < x + width and
    mouse_y > y and mouse_y < y + height
  end
  
  def draw
    @background_image.draw(0,0, ZOrder::Background)
    @cursor.draw(mouse_x, mouse_y, ZOrder::Mouse)
    @grass.draw
    @dirt.draw
    @water.draw
  end
end

def button_down(id)
  if id == Gosu::MsLeft then
    if grass.image.underpoint?
      Process.exit
    end
  end
end

LevelEditorWindow.new.show