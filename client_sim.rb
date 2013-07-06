#!/usr/bin/env ruby
# Description:
# Client simulator that reads a server's published validations.
# Parses them and prints out their descriptions.
require 'json'

MyObject = Struct.new(:name, :validators) do
  def to_s
    "Validations for #{name}:\n#{validators.empty? ? "  N/A" : validators.map(&:to_s).join("\n")}"
  end
end

MyValidator = Struct.new(:class, :attributes, :options) do
  def to_s
    case self.class
    when /PresenceValidator/
      to_s_presence
    when /FormatValidator/
      to_s_format
    when /InclusionValidator/
      to_s_inclusion
    else
      to_s_unknown
    end
  end

  def joined_attributes
    attributes.join(',')
  end

  def to_s_presence
    "  - Validate presence of #{joined_attributes}"
  end

  def to_s_format
    "  - Validate format of #{joined_attributes}\n    with: /#{options["with"]}/\n    allow_blank: #{!!options["allow_blank"]}"
  end

  def to_s_inclusion
    "  - Validate inclusion of #{joined_attributes}\n    in: #{options["in"]}\n    allow_blank: #{!!options["allow_blank"]}"
  end

  def to_s_unknown
    "  - Unknown validator type: #{self.class}"
  end
end

validations = %x(curl http://localhost:3000/external_validations) || fail("server isn't running?")

objects = JSON.parse(validations).map do |class_validation|
  my_validators = class_validation["validators"].
    map{ |v| MyValidator.new(*v.values) }
  MyObject.new(class_validation['name'], my_validators)
end

puts "\n#{objects.map(&:to_s).join("\n\n")}"
