require 'test_helper'

class ValidationlessObjectTest < ActiveSupport::TestCase
  test "validate fixture object" do
    assert validationless_objects(:one).valid?
  end
end
