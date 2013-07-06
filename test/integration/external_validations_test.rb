require 'test_helper'

class ExternalValidationsTest < ActionDispatch::IntegrationTest
  test "index should return json of all external validations" do
    get '/external_validations.json'
    assert_response 200

    user_hash = { :name => "User", :validators => [
      { :class => "ActiveRecord::Validations::PresenceValidator",
        :attributes => ["name"],
        :options => {}
      },
      { :class => "ActiveModel::Validations::FormatValidator",
        :attributes => ["phone_number"],
        :options => User.validators_on(:phone_number)[0].options
      },
      { :class => "ActiveModel::Validations::InclusionValidator",
        :attributes => ["status"],
        :options => User.validators_on(:status)[0].options
      }
    ]}
    validationless_hash = { :name => "ValidationlessObject", :validators => [] }
    expected_hash = [ user_hash, validationless_hash ]

    assert_equal expected_hash.to_json, response.body
  end
end
