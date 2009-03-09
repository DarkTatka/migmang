require File.join(File.expand_path(File.dirname(__FILE__)), "../enhancements/array_enhancements")

module Rules
  EMPTY    = 0
  WHITEMAN = 1
  BLACKMAN = 2
=begin rdoc
vygeneruje vsechny mozne tahy pro jednoho hrace
=end
  def moves_for(player_color)
    moves = Array.new
    board.each_with_keys do |x, y, value|
      if value.eql?(player_color)
        moves.concat generate_for(x,y)
      end
    end
    moves
  end

  def ended?
    !!winner
  end

  def winner
    return WHITEMAN unless board.has?(BLACKMAN)
    return BLACKMAN unless board.has?(WHITEMAN)
    return nil
  end

  def draw!

  end

private
  def generate_for(x,y)
    moves = [x,y].neighbours.delete_if {|coord| board[coord[0], coord[1]].full?}
    #TODO generovani tahu
    #
    #
  end

  def can_move?(x,y)
    ![x,y].neighbours.all? do |coord|
      board[coord[0], coord[1]].full?
    end
  end
end