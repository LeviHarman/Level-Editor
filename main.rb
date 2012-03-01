require 'rubygems'
require 'gosu'
require './tileclasses.rb'
require './buttonclasses.rb'
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
    @eraser_button = EraserButton.new(self) 

    @grass_button.warp(760, 0)
    @water_button.warp(680, 0)
    @dirt_button.warp(720, 0)
    @end_button.warp(640, 0)
    @eraser_button.warp(760, 40)

    @grasses = Array.new
    @dirts = Array.new
    @waters = Array.new
  end

  def update
    if button_down? Gosu::MsLeft and @grass_button.under_point?(mouse_x, mouse_y)
      @selected_tile = 'grass_selected'
    elsif button_down? Gosu::MsLeft and @dirt_button.under_point?(mouse_x, mouse_y)
      @selected_tile = 'dirt_selected'
    elsif button_down? Gosu::MsLeft and @water_button.under_point?(mouse_x, mouse_y)
      @selected_tile = 'water_selected'
    elsif button_down? Gosu::MsLeft and @water_button.under_point?(mouse_x, mouse_y)
      @selected_tile = 'water_selected'
    elsif button_down? Gosu::MsLeft and @eraser_button.under_point?(mouse_x, mouse_y)
      @selected_tile = 'eraser_selected'
    end

    if button_down? Gosu::MsLeft and mouse_x >= 0 and mouse_x <= 640 and mouse_y >= 0 and mouse_y <= 480
      case @selected_tile
      when 'grass_selected'
        @grasses.push(GrassTile.new(self))
        @grasses[-1].tile_position(mouse_x, mouse_y)
      when 'dirt_selected'
        @dirts.push(DirtTile.new(self))
        @dirts[-1].tile_position(mouse_x, mouse_y)
      when 'water_selected'
        unless @waters[0..-1].underpoint
          @waters.push(WaterTile.new(self))
          @waters[-1].tile_position(mouse_x, mouse_y)
        end
      when 'eraser_selected'
        @waters.pop
        @dirts.pop
        @grasses.pop
      end
    end
  end

  def button_down(id)
    if id == Gosu::MsLeft then
      if @end_button.under_point?(mouse_x, mouse_y) then
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
    @eraser_button.draw

    @button_down
    @grasses.each { |grass| grass.draw }
    @dirts.each { |dirt| dirt.draw }
    @waters.each { |water| water.draw }
  end
end
LevelEditorWindow.new.show