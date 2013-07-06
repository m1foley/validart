require 'test_helper'

class ExternalValidationsTest < ActionDispatch::IntegrationTest
  test "index should return json of all external validations" do
    get '/external_validations.json'
    assert_response 200

    expected_hash = [{:name => "User"}, {:name => "ValidationlessObject"}]
      #TODO:
      # :class => "ActiveRecord::Validations::PresenceValidator"}]}
    assert_equal expected_hash.to_json, response.body
  end
end
