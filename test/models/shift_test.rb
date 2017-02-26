require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  
  def setup
    @shift = shifts(:one)
  end

  test "should be valid" do
    assert @shift.valid?
  end

  test "a set of worker_id, ymd, and time should be unique test1" do
    duplicate_shift = @shift.dup
    @shift.save
    assert_not duplicate_shift.valid?
  end
  
  test "the fact that two different workers at the same work should be allowed" do
    duplicate_shift = @shift.dup
    duplicate_shift.worker_id = 2
    @shift.save
    assert duplicate_shift.valid?
  end
  
  test "the fact that one worker has two shfits which are different in ymd should be allowed" do
    duplicate_shift = @shift.dup
    duplicate_shift.ymd = "20170214"
    @shift.save
    assert duplicate_shift.valid?
  end
  
  test "the fact that one worker has two shfits which are different in time should be allowed" do
    duplicate_shift = @shift.dup
    duplicate_shift.time = "1700200030"
    @shift.save
    assert duplicate_shift.valid?
  end
  
  test "lack of worker_id should not be allowed" do
    @shift.worker_id = nil
    assert_not @shift.valid?
  end
  
  test "lack of ymd should not be allowed" do
    @shift.ymd = nil
    assert_not @shift.valid?
  end
  
  test "lack of time should not be allowed" do
    @shift.time = nil
    assert_not @shift.valid?
  end
end
