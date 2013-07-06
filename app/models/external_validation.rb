class ExternalValidation
  include ActiveModel::Conversion # to_partial_path for jbuilder

  attr_accessor :klass
  def initialize(klass)
    self.klass = klass
  end

  delegate :name, :validators, :to => :klass
end
