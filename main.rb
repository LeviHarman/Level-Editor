require 'rubygems'
require 'gosu'
require './tileclasses.rb'
include Gosu

module ZOrder
  Background, Bottom, UI, Mouse = *0..3
end

class LevelEditorWindow < Gosu::Window
    attr_reader :x, :y
    
  def initialize
    super(800, 640, false)
    self.caption = "Level Editor."
    
    @background_image = Gosu::Image.new(self, "media/GrayBackground640x480.png", true)
    @cursor = Gosu::Image.new(self, "media/Cursor.png", false)
    
    @grass_button = GrassButton.new(self)
    @water_button = WaterButton.new(self)
    @dirt_button = DirtButton.new(self)
    @end_button = EndButton.new(self) 
 
    @grass_button.warp(760, 0)
    @water_button.warp(680, 0)
    @dirt_button.warp(720, 0)
    @end_button.warp(640, 0)

    @grasses = Array.new
  end

  def update
    if button_down? Gosu::MsLeft and mouse_x >= 0 and mouse_x <= 640 and mouse_y >= 0 and mouse_y <= 480 then
      @grasses.push(GrassTile.new(self))
      @grasses[-1].tile_position(mouse_x, mouse_y)
    end
  end
  
def button_down(id)
  if id == Gosu::MsLeft then
    if @dirt_button.under_point?(mouse_x, mouse_y) then
      @grass_button.warp(500, 0)
    elsif @grass_button.under_point?(mouse_x, mouse_y) then
      @grass_button.warp(760, 0)
    elsif @end_button.under_point?(mouse_x, mouse_y) then
      Process.exit
    end
  end
end

  def draw
    @background_image.draw(0,0, ZOrder::Background)
    @cursor.draw(mouse_x, mouse_y, ZOrder::Mouse)
    
    @grass_button.draw
    @dirt_button.draw
    @water_button.draw
    @end_button.draw
    
    @button_down
    @grasses.each { |grass| grass.draw }
  end
end
LevelEditorWindow.new.show