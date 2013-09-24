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
end
