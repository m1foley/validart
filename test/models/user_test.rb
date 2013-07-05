require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "validates correctly formatted user" do
    assert users(:one).valid?
  end

  test "invalidates blank name" do
    user = User.new(:name => '')
    assert !user.valid?
    assert user.errors[:name].present?
  end

  test "validates blank phone_number" do
    user = User.new
    user.valid?
    assert user.errors[:phone_number].blank?
  end

  test "invalidates invalid phone_number format" do
    user = User.new(:phone_number => '123 123-1234')
    assert !user.valid?
    assert user.errors[:phone_number].present?
  end

  test "invalidates invalid status" do
    user = User.new(:status => 'not_in_list')
    assert !user.valid?
    assert user.errors[:status].present?
  end

  test "validates valid statuses" do
    [ nil, 'archived' ].each do |status|
      user = User.new(:status => status)
      user.valid?
      assert user.errors[:status].blank?
    end
  end
end
