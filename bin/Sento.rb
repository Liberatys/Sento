# frozen_string_literal: true

require_relative '../lib/Sento.rb'


def setup_abyss
  abyss = Abyss.new(Heart.new)
  abyss.add_logger(Logger.new)
  logger_file_path = 'log.txt'
  if @reader.get_flag_value_for_key('-o').nil? == false
    logger_file_path = @reader.get_flag_value_for_key('-o').get_values[0]
  end
  abyss.add_logger(FileLogger.new(logger_file_path))
  # ! add plugger
  plugger = Plugger.new('root')
  abyss.add_plugger(plugger)
  abyss
end

def print_help
  help_flag = @reader.get_flag_value_for_key('-h')
  if help_flag.nil? == false

  end
end


def build_abyss
  abyss = setup_abyss
  #! if -p flag is set, load from file
  if @reader.get_flag_value_for_key('-p').nil? == false
    abyss = load_by_file(@reader.get_flag_value_for_key('-p').get_values[0], abyss)
  else
    raise "Please include a plugin loader file with -p file_path"
  end
  #! if -v is set, print all loaded plugins
  if @reader.get_flag_value_for_key('-v').nil? == false
    abyss.print_plugins
  end
  abyss
end

def read_command_line_args
  input_file_flag = @reader.get_flag_value_for_key('-i')
  raise 'no configuration was provided | set -i flag' if input_file_flag.nil?
  return input_file_flag.get_values[0]
end

def read_command_line_arguments
  input_args = ARGV
  if input_args.empty?
    raise 'Insufficient commandline arguments | No filepath specified'
  end
  file_path, *arguments = ARGV
  raise "Invalid filepath #{file_path}" unless File.file?(file_path)
  File.expand_path(file_path)
end

@reader = ArgumentReader.new(ARGV)
@reader.parse_arguments(['-i', '-o', '-p', '-h','-v'])

run_sento(read_command_line_args, build_abyss)
