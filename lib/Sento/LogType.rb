module LogType
  WARNING = 1
  ERROR = 2
  INFORMATION = 3
  UPDATE = 4

  def self.get_type_as_string(type)
    case type
    when WARNING
      return "WARNING"
    when ERROR
      return "ERROR"
    when INFORMATION
      return "INFORMATION"
    when UPDATE
      return "UPDATE"
    else
      false
    end
  end
end
