require 'test_helper'

class WorkerTest < ActiveSupport::TestCase

  def setup
    @worker = workers(:one)
  end

  test "should be valid" do
    assert @worker.valid?
  end

  test "a set of work_id and user_id should be unique" do
    duplicate_worker = @worker.dup
    @worker.save
    assert_not duplicate_worker.valid?
  end

  test "the fact that two different workers at the same work should be allowed" do
    duplicate_worker = @worker.dup
    duplicate_worker.user_id = 2
    @worker.save
    assert duplicate_worker.valid?
  end
  
  test "the fact that one worker has two works should be allowed" do
    duplicate_worker = @worker.dup
    duplicate_worker.work_id = 2
    @worker.save
    assert duplicate_worker.valid?
  end

end
