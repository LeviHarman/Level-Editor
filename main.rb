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
    @cursor = Gosu::Image.new(self, "media/carrotcursor.png", false)

    @grass_button = GrassButton.new(self)
    @dirt_button = DirtButton.new(self)
    @water_button = WaterButton.new(self)
    @end_button = EndButton.new(self)
    @eraser_button = EraserButton.new(self) 
    @undo_button = UndoButton.new(self)
    @tilled_dirt_button = TilledDirtButton.new(self)
    @wet_dirt_button = WetDirtButton.new(self)


    @grass_button.warp(760, 0)
    @dirt_button.warp(720, 0)
    @water_button.warp(680, 0)
    @end_button.warp(640, 0)
    @eraser_button.warp(760, 40)
    @undo_button.warp(720, 40)
    @tilled_dirt_button.warp(680, 40)
    @wet_dirt_button.warp(640, 40)

    @tiles = Array.new
  end

  def update
    if button_down? Gosu::MsLeft and @grass_button.under_point?(mouse_x, mouse_y)
      @selected_tile = 'grass_selected'
    elsif button_down? Gosu::MsLeft and @dirt_button.under_point?(mouse_x, mouse_y)
      @selected_tile = 'dirt_selected'
    elsif button_down? Gosu::MsLeft and @water_button.under_point?(mouse_x, mouse_y)
      @selected_tile = 'water_selected'
    elsif button_down? Gosu::MsLeft and @wet_dirt_button.under_point?(mouse_x, mouse_y)
      @selected_tile = 'wet_dirt_button_selected'
    elsif button_down? Gosu::MsLeft and @tilled_dirt_button.under_point?(mouse_x, mouse_y)
      @selected_tile = 'tilled_dirt_button_selected'
    elsif button_down? Gosu::MsLeft and @eraser_button.under_point?(mouse_x, mouse_y)
      @selected_tile = 'eraser_selected'
    elsif button_down? Gosu::MsLeft and @undo_button.under_point?(mouse_x, mouse_y)
      @selected_tile = 'undo_selected'
    end

    if button_down? Gosu::MsLeft and mouse_x >= 0 and mouse_x <= 640 and mouse_y >= 0 and mouse_y <= 480
      case @selected_tile
      when 'grass_selected'
        if @tiles.each{|tile| if tile.under_point?(mouse_x, mouse_y) then return false end}
          @tiles.push(GrassTile.new(self))
          @tiles[-1].tile_position(mouse_x, mouse_y)
        end
      when 'dirt_selected'
        if @tiles.each{|tile| if tile.under_point?(mouse_x, mouse_y) then return false end}
          @tiles.push(DirtTile.new(self))
          @tiles[-1].tile_position(mouse_x, mouse_y)
        end
      when 'water_selected'
        if @tiles.each{|tile| if tile.under_point?(mouse_x, mouse_y) then return false end}
          @tiles.push(WaterTile.new(self))
          @tiles[-1].tile_position(mouse_x, mouse_y)
        end
      when 'wet_dirt_button_selected'
        if @tiles.each{|tile| if tile.under_point?(mouse_x, mouse_y) then return false end}
          @tiles.push(WetDirtTile.new(self))
          @tiles[-1].tile_position(mouse_x, mouse_y)
        end
      when 'tilled_dirt_button_selected'
        if @tiles.each{|tile| if tile.under_point?(mouse_x, mouse_y) then return false end}
          @tiles.push(TilledDirtTile.new(self))
          @tiles[-1].tile_position(mouse_x, mouse_y)
        end
      when 'eraser_selected'
        @tiles.each{|tile| if tile.under_point?(mouse_x,mouse_y) then @tiles.delete(tile) end}
      when 'undo_selected'
        @tiles.pop
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
    @wet_dirt_button.draw
    @tilled_dirt_button.draw
    @water_button.draw
    @end_button.draw
    @eraser_button.draw
    @undo_button.draw

    @tiles.each { |tile| tile.draw }
  end
end
LevelEditorWindow.new.show