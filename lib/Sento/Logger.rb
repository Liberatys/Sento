# frozen_string_literal: true

require_relative './LogType'

class Logger
  def initialize; end

  # ? Log Format
  # ? Date Categorie Entity Message
  def format(entity, message, type)
    if LogType.get_type_as_string(type) == false
      raise 'Unexpected type for format method'
    end

    date_sequence = DateTime.now
    date_sequence = date_sequence.strftime('%Y-%m-%d %l:%M:%S')
    "#{date_sequence} #{LogType.get_type_as_string(type)} #{entity} #{message}"
  end

  # ! this method can now be overwriten and used for writing to a remote or a file
  def log(message)
    puts message
  end

  def pipe(entity, message, type)
    log(self.format(entity, message, type))
  end
end
