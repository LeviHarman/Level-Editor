require 'rubygems'
require 'gosu'
require './tileclasses.rb'
include Gosu

module ZOrder
  Background, Stars, UI, Mouse = *0..3
end

class LevelEditorWindow < Gosu::Window
    attr_reader :x, :y
    
  def initialize
    super(800, 640, false)
    self.caption = "Level Editor."
    @background_image = Gosu::Image.new(self, "media/GrayBackground640x480.png", true)
    @cursor = Gosu::Image.new(self, "media/Cursor.png", false)
    @grass = GrassTile.new(self)
    @grass.warp(760, 0)
    @dirt = DirtTile.new(self)
    @dirt.warp(720, 0)
    @water = WaterTile.new(self)
    @water.warp(680, 0)
  end
  
  def draw
    @background_image.draw(0,0, ZOrder::Background)
    @cursor.draw(mouse_x, mouse_y, ZOrder::Mouse)
    @grass.draw
    @dirt.draw
    @water.draw
  end
  
  def button_down(id)
    if id == Gosu::MsLeft then
      if @dirt.under_point?(mouse_x, mouse_y) then
        @grass.warp(500, 0)
      end
    end
  end
end

LevelEditorWindow.new.show