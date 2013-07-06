class ExternalValidationsController < ApplicationController
  VALIDATION_KLASSES = [ User, ValidationlessObject ]

  def index
    @external_validations = VALIDATION_KLASSES.
      map{ |klass| ExternalValidation.new(klass) }
  end
end
