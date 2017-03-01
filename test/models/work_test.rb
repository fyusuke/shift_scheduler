require 'test_helper'

class WorkTest < ActiveSupport::TestCase

  def setup
    @work = works(:testwork)
  end

  test "should be valid" do
    assert @work.valid?
  end
  
  #nameのvalidationのチェック
  test "name should not be too long" do
    @work.name = "a" * 51
    assert_not @work.valid?
  end

  test "organization name should be unique" do
    duplicate_work = @work.dup
    duplicate_work.phone = "1234567893"
    @work.save
    assert_not duplicate_work.valid?
  end

  #電話番号のvalidationのチェック
  test "phone should not be too short" do
    @work.phone = "1" * 8
    assert_not @work.valid?
  end
  
  test "phone should not be too long" do
    @work.phone = "1" * 12
    assert_not @work.valid?
  end
  
  test "phone length of 10 should be passed" do
    @work.phone = "1" * 10
    assert @work.valid?
  end
  
  test "phone length of 11 should be passed" do
    @work.phone = "1" * 11
    assert @work.valid?
  end
  
  test "phones should be unique" do
    another_work= @work.dup
    another_work.name = "カフェ　スタバ"
    @work.save
    assert_not another_work.valid?
  end

  
  #WorkとWorkerの連携
  test "relationships between work and worker should be destroyed" do
    @work.save
    assert_difference 'Worker.count', 1 do
      @work.workers.create!(user_id: 2)
    end
    assert_difference 'Worker.count', -1 do
      @work.destroy
    end
  end
  
  #WorkとIndivisualCheckの連携
  test "relationships between work and indivisual check should be destroyed" do
    @work.save
    @work.create_indivisual_check
    assert_difference 'IndivisualCheck.count', -1 do
      @work.destroy
    end
  end
  
  #WorkとOverallCheckの連携
  test "relationships between work and overall check should be destroyed" do
    @work.save
    @work.create_overall_check
    assert_difference 'OverallCheck.count', -1 do
      @work.destroy
    end
  end
  
  #WorkとShiftの連携
  test "relationships between work and shift should be destroyed" do
    @work.save
      worker = @work.workers.create!(user_id: 1)
    assert_difference 'Shift.count', 1 do
      Shift.create!(worker_id: worker.id, start_datetime:"2012-09-22 00:00:00", end_datetime:"2012-09-22 10:00:00", rest_sec: 2400)
    end
    assert_difference 'Shift.count', -1 do
      @work.destroy
    end
  end
  
end

