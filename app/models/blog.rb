class Blog
  extend  ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :id, :title

  def initialize(title = nil)
    @title = title
  end

  def persisted?
    !!self.id
  end

end
