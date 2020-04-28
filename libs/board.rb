# frozen_string_literal: true
class Board

  attr_reader :tiles, :winning_tiles

  def initialize
    @tiles = %w[1 2 3 4 5 6 7 8 9]
    @winning_tiles = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
  end
  def draw_board padding=0
    res = ''
    temp_res = ''
    counter = 0

    tiles.each do |tile|
      if counter == 2
        temp_res += "#{tile}"
        temp_res = temp_res.center(padding)
        temp_res += "\n"
        counter = 0
        res += temp_res
        temp_res = ''
        next
      end

      temp_res += "#{tile} | "
      counter += 1
    end
    puts res
  end

  def play tile, value
    @tiles[tile] = value
  end

  def isUsed tile
    (1..9).include? @tiles[tile]
  end

end
