class Task

  def initialize
    @complete = false
  end

  def complete!
    @complete = true
  end

  def complete?
    @complete
  end
end