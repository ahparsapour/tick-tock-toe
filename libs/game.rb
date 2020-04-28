require_relative 'board'

class Game
  def initialize player1, player2
    @players = {o: player1,x: player2}
    @scores = {}
    @padding = 50
  end

  public

  def start
    puts "#{@players[:o]} will be 'o' and #{@players[:x]} will be 'x'"
    @board = Board.new
    (1..9).each do |turn|
      mark =( turn%2 > 0 ? :o : :x )
      puts "#{@players[mark]}'s Turn"

      @board.draw_board @padding

      print  "#{@players[mark]}, please enter a valid number>>"

      playing = true
      used = false
      while playing
        begin
          tile_index = Integer(gets.chomp) - 1
          used = @board.isUsed tile_index
        rescue
          used = true
        end
        if used
          print "\nenter a valid number>>"
          next
        end
        playing = false
        @board.play tile_index, mark.to_s
      end
      victory = victory?(mark.to_s, turn)
      if victory
        print_resaults victory, @players[mark]
        break
      end

    end
  end

  private

  def victory? mark, turn
    player = @players[mark]
    victory = @board.winning_tiles.any? do |group|
      group.all? {|tile_index| @board.tiles[tile_index] == mark}
    end
    !victory && turn > 8 ? nil : victory
  end

  def print_resaults victory, player
    puts '-' *50
    @board.draw_board @padding

    if victory
      puts '-' * 50,
      "#{player} won!".center(50, '-'),
      '-' * 50
    elsif !victory
      player = @players.reject {|key, obj| obj == player}.values[0]
      puts '-' * 50,
      "#{player} won!".center(50, '-'),
      '-' * 50
    else
      puts '-' * 50,
      "draw!".center(50, '-'),
      '-' * 50
    end
  end

end