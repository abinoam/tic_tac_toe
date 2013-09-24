require 'minitest/autorun'
require './ttt.rb'

class TestTTT < MiniTest::Unit::TestCase
  def setup
    @tttboard = TTTBoard.new [["X","X","X"],
                           ["O","O","O"],
                           [nil, nil, nil]]
  end
  
  def test_each_line_iterator
    assert_equal @tttboard.instance_variable_get(:@board), @tttboard.each_line.to_a
  end

  def test_each_column_iterator
    assert_equal [["X", "O", nil], ["X", "O", nil], ["X", "O", nil]], @tttboard.each_column.to_a
  end
  
  def test_each_diagonal_iterator
    assert_equal [["X", "O", nil], ["X", "O", nil]], @tttboard.each_diagonal.to_a
  end

  def test_that_it_will_throw_an_error_with_wrong_coords
    assert_raises ArgumentError do
      @tttboard[4,1]
    end
  end

  def test_that_it_will_throw_an_error_with_non_valid_value
    assert_raises ArgumentError do
      @tttboard[1,1]="non-valid value"
    end
  end

  def test_that_to_s_renders_board_correctly
    control_board =
      "\n" +
      "=============\n"   +
      "| X | X | X | 1\n" +
      "=============\n"   +
      "| O | O | O | 2\n" +
      "=============\n"   +
      "|   |   |   | 3\n" +
      "=============\n"   +
      "  1   2   3   \n"
    assert_equal control_board, @tttboard.to_s
  end
end
