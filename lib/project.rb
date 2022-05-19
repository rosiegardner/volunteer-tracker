class Project
  attr_reader :id, :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
    
  end

end