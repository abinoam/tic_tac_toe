#!/usr/bin/env

# TTT is TicTacToe Game

# First thing we need is a board
class TTTBoard
  def initialize(board=nil)
    @board = [[nil, nil, nil],
              [nil, nil, nil],
              [nil, nil, nil]]
    if board
      board.each_with_index do |line, l_ix|
        line.each_with_index do |cell, c_ix|
          self[l_ix+1, c_ix+1] = cell
        end
      end
    end
  end

  def [](x,y)
    validate_coords(x,y)
    @board[x-1][y-1]
  end

  def []=(x,y, value)
    validate_coords(x,y)
    validate_value(value)
    @board[x-1][y-1]=value
  end

  def each_line(&block)
    each_for @board, &block
  end

  def each_column(&block)
    cols = @board.transpose
    each_for cols, &block
  end

  def each_diagonal(&block)
    diags_coords = [[[1,1], [2,2], [3,3]],
                   [[1,3], [2,2], [3,1]]]
    diags = diags_coords.map do |diag_coords|
      diag_coords.map do |l, c|
        self[l,c]
      end
    end

    each_for diags
  end

  def to_s
    "\n" +
    self.each_line.with_index.map do |line, l_ix|
       l = line.map {|e| e.nil? ? " " : e }
       "=============\n" +
       "| #{l[0]} | #{l[1]} | #{l[2]} | #{l_ix+1}\n"
    end.join +
    "=============\n" +
    "  1   2   3   \n"
  end

  private

  def each_for(elements)
    if block_given?
      elements.each { |element| yield element }
    else
      elements.each
    end
  end

  def validate_coords(x,y)
    raise ArgumentError, "x should fall under the 1-3 limit but it is #{x}" unless (1..3).include?(x)
    raise ArgumentError, "y should fall under the 1-3 limit but it is #{y}" unless (1..3).include?(y)
  end

  def validate_value(value)
    raise ArgumentError, "value should be 'X' or 'O' or nil but it is #{value}" unless ['X', 'O', nil].include?(value)
  end
end
