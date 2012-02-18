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
  def initialize
    super(800, 640, false)
    self.caption = "Negfaron."
    @background_image = Gosu::Image.new(self, "media/GrayBackground640x480.png", true)
    @cursor = Gosu::Image.new(self, "media/Cursor.png", false)
    @grass = GrassTile.new(self)
    @grass.warp(780, 20)
    @dirt = DirtTile.new(self)
    @dirt.warp(740, 20)
    @water = WaterTile.new(self)
    @water.warp(700,20)
  end
  def draw
    @background_image.draw(0,0, ZOrder::Background)
    @cursor.draw(mouse_x, mouse_y, ZOrder::Mouse)
    @grass.draw
    @dirt.draw
    @water.draw
  end
end

LevelEditorWindow.new.show