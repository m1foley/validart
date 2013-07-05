class User < ActiveRecord::Base
  validates_presence_of :name
  validates_format_of :phone_number, :with => /\A\(\d{3}\) \d{3}-\d{4}\z/, :allow_blank => true
  validates_inclusion_of :status, :in => %w(archived), :allow_blank => true
end
