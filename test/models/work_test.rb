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

  
  # #UserWorkRelationshipモデルとの連携
  # test "associated user_work_relationships should be destroyed" do
  #   @user.save
  #   @user.user_work_relationships.create!(work_id: 2)
  #   assert_difference 'UserWorkRelationship.count', -1 do
  #     @user.destroy
  #   end
  # end
  
  # #Workerモデルとの連携
  # test "associated Workers should be destroyed" do
  #   @user.save
  #   @user.workers.create!(work_id: 1)
  #   assert_difference 'Worker.count', -1 do
  #     @user.destroy
  #   end
  # end
end

