#!/usr/bin/env

# TTT is TicTacToe Game

# First thing we need is a board
class TTTBoard
  def initialize
    @board = [[nil, nil, nil],
              [nil, nil, nil],
              [nil, nil, nil]]
  end

  def [](x,y)
    raise ArgumentError, "x should fall under the 1-3 limit but it is #{x}" unless (1..3).include?(x)
    raise ArgumentError, "y should fall under the 1-3 limit but it is #{y}" unless (1..3).include?(y)
    @board[x-1][y-1]
  end

  def []=(x,y, value)
    raise ArgumentError, "x should fall under the 1-3 limit but it is #{x}" unless (1..3).include?(x)
    raise ArgumentError, "y should fall under the 1-3 limit but it is #{y}" unless (1..3).include?(y)
    raise ArgumentError, "value should be 'X' or 'O' or nil but it is #{value}" unless ['X', 'O', nil].include?(value)
    @board[x-1][y-1]=value
  end

  def each_line
    if block_given?
      @board.each { |line| yield line }
    else
      @board.each
    end
  end

  def each_column
    cols =
    (1..3).map do |c|
      (1..3).map do |l|
         self[l,c]
      end
    end

    if block_given?
      cols.each { |col| yield col }
    else
      cols.each
    end
  end
end
