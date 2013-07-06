require 'test_helper'

class ExternalValidationTest < ActiveSupport::TestCase
  MyKlass = Class.new do
    include ActiveModel::Validations
    validates_presence_of :something
  end

  test "name should equal class name" do
    assert_equal MyKlass.name, ExternalValidation.new(MyKlass).name
  end

  test "validators should equal class validators" do
    assert_equal MyKlass.validators, ExternalValidation.new(MyKlass).validators
  end
end
