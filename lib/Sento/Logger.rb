class Logger
  def initialize
  end

  #TODO implement functionality for the logger, so that the application can output well formated errors and information messages
  #! your std.err is someones input

  def format(message, type)
    return message
  end

  def log(message)
    puts message
  end

  def pipe(message, type)
    log(self.format(message, type))
  end
end
