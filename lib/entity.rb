# Pulled from raidit, very handy
module Entity
  def self.included(base) #:nodoc:
    base.class_eval do
      extend  ActiveModel::Naming
      include ActiveModel::Validations
      include ActiveModel::Conversion
    end
  end

  attr_accessor :id

  def initialize(params={})
    params.each do |attr, value|
      self.public_send("#{attr}=", value)
    end if params
  end

  ##
  # Required activemodel API calls
  ##

  def persisted?
    !!self.id
  end
end
