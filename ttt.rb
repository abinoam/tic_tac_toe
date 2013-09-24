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
end
