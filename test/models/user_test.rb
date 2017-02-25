require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:testman)
  end

  test "should be valid" do
    assert @user.valid?
  end
  
  
  #名字validationのチェック
  test "first_name should not be too long" do
    @user.first_name = "a" * 51
    assert_not @user.valid?
  end
  
  test "last_name should not be too long" do
    @user.last_name = "a" * 51
    assert_not @user.valid?
  end


  #メールvalidationのチェック
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user1@example.com 
                         USER@foo.COM 
                         A_US-ER@foo.bar.org
                         first.last@foo.jp 
                         alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation shrould reject invalid addresses" do
    invalid_addresses = %w[user@example,com 
                           user_at_foo.org
                           user.name@example.
                           foo@bar_baz..com
                           foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
  
  
  #passwordのvalidationのチェック
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  
  #電話番号のvalidationのチェック
  test "phone should not be too short" do
    @user.phone = "1" * 8
    assert_not @user.valid?
  end
  
  test "phone should not be too long" do
    @user.phone = "1" * 12
    assert_not @user.valid?
  end
  
  test "phone length of 10 should be passed" do
    @user.phone = "1" * 10
    assert @user.valid?
  end
  
  test "phone length of 11 should be passed" do
    @user.phone = "1" * 11
    assert @user.valid?
  end
  
  test "phones should be unique" do
    another_user = @user.dup
    another_user.email = "abcdefg@example.com"
    @user.save
    assert_not another_user.valid?
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
