class Task

  def initialize(options = {})
    @complete = options[:completed]
    @size = options[:size]
  end

  def complete!
    @complete = true
  end

  def complete?
    @complete
  end

  def size
    @size
  end
end