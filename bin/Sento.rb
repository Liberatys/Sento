# frozen_string_literal: true

require_relative '../lib/Sento.rb'

def build_abyss
  abyss = Abyss.new(Heart.new)
  abyss.add_logger(Logger.new)
  abyss.add_logger(FileLogger.new('./testing.txt'))
  plugger = Plugger.new('root')
  abyss.add_plugger(plugger)
  abyss.add_plugin('root.brew', BrewPlugin.new('brew'))
  abyss
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

run_sento(read_command_line_arguments, build_abyss)
