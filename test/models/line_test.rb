require 'test_helper'

class LineTest < ActiveSupport::TestCase

  def setup
    @line = lines(:one)
  end

  test "line should be valid" do
    assert @line.valid?
  end
  
  test "line_token should be unique" do
    duplicate_line = @line.dup
    @line.save
    assert_not duplicate_line.valid?
  end

end
