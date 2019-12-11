class Flag
  def initialize(key)
    @key = key
    @values = []
  end

  def get_key
    return @key
  end

  def add_value(value)
    @values.push(value)
  end

  def get_values
    return @values
  end
end
