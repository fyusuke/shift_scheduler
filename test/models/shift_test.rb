require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  
  def setup
    @shift = shifts(:one)
  end

  test "should be valid" do
    assert @shift.valid?
  end

  test "end_datetime must be set after start_datetime" do
    @shift.end_datetime = "2012-03-21 00:00:00"
    assert_not @shift.valid?
  end
  
  test "a worker should work at one or no place each time : test1" do
    duplicate_shift = @shift.dup
    duplicate_shift.start_datetime = "2012-03-21 23:59:59"
    duplicate_shift.end_datetime = "2012-03-22 05:00:00"
    @shift.save
    assert_not duplicate_shift.valid?
  end

  test "a worker should work at one or no place each time : test2" do
    duplicate_shift = @shift.dup
    duplicate_shift.start_datetime = "2012-03-22 05:00:00"
    duplicate_shift.end_datetime = "2012-03-22 10:00:01"
    @shift.save
    assert_not duplicate_shift.valid?
  end

  test "a worker should work at one or no place each time : test3" do
    duplicate_shift = @shift.dup
    duplicate_shift.start_datetime = "2012-03-21 23:59:59"
    duplicate_shift.end_datetime = "2012-03-22 10:00:01"
    @shift.save
    assert_not duplicate_shift.valid?
  end

  test "a worker should work at one or no place each time : test4" do
    duplicate_shift = @shift.dup
    duplicate_shift.start_datetime = "2012-03-21 10:00:00"
    duplicate_shift.end_datetime = "2012-03-21 23:59:59"
    @shift.save
    assert duplicate_shift.valid?
  end
  
  test "a worker should work at one or no place each time : test5" do
    duplicate_shift = @shift.dup
    duplicate_shift.start_datetime = "2012-03-22 10:00:01"
    duplicate_shift.end_datetime = "2012-03-22 23:00:00"
    @shift.save
    assert duplicate_shift.valid?
  end
  
  test "working minutes should be caliculated properly" do
    working_minutes = ((@shift.end_datetime - @shift.start_datetime) - @shift.rest_sec ) / 60
    i = 10*60-40
    assert_equal i, working_minutes
  end

  test "the fact that two different workers at the same work should be allowed" do
    duplicate_shift = @shift.dup
    duplicate_shift.worker_id = 2
    @shift.save
    assert duplicate_shift.valid?
  end
  
  test "lack of worker_id should not be allowed" do
    @shift.worker_id = nil
    assert_not @shift.valid?
  end
  
  test "lack of start_datetime should not be allowed" do
    @shift.start_datetime = nil
    assert_not @shift.valid?
  end
  
  test "lack of end_datetime should not be allowed" do
    @shift.end_datetime = nil
    assert_not @shift.valid?
  end
  
  test "lack of rest_sec should not be allowed" do
    @shift.rest_sec = nil
    assert_not @shift.valid?
  end
end
