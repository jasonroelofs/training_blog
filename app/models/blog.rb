class Blog
  extend  ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :id, :title

  validates_presence_of :title

  def initialize(title = nil)
    @title = title
  end

  def persisted?
    !!self.id
  end

end
