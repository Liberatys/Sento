class Logger
  def initialize
  end

  #TODO implement functionality for the logger, so that the application can output well formated errors and information messages
  #! your std.err is someones input

  def format(message, type)
  end

  def log(message)
    puts message
  end

  def pipe(message, type)
    if !type.is_a?(LogType)
      raise "Type for loging pipe has to be a LogType | given was #{type}"
    end
    self.log(self.format(message))
  end
end
