# frozen_string_literal: true

require_relative File.expand_path('../lib/Sento.rb')
require 'os'

class BrewPlugin < Plugin
  @@base_command = 'brew'

  def install(arguments)
    if supported_platform?([Platform::MACOS]) == false
      return 'The brew plugin is only available on MacOs | OsX'
    end
    progress_list = []
    arguments.each do |package|
      result = act_on_package(package, 'install')
      if result == "Unknown command"
        return result
      else
        progress_list.push(result)
      end
    end
    progress_list
  end

  def act_on_package(package, operation)
    result = system("#{@@base_command} #{operation} #{package}")
    if result == true
      return "Successfully #{operation} #{package}"
    elsif result == false
      return "#{operation.capitalize} of #{package} failed"
    end

    'Unknown command'
  end

  def upgrade(arguments)
    if supported_platform?([Platform::MACOS]) == false
      return 'The brew plugin is only available on MacOs | OsX'
    end
      result = act_on_package(package, 'upgrade')
      if result == "Unknown command"
        return result
      else
        progress_list.push(result)
      end
    progress_list
  end

  # ! brew is a tool for mac and therefore should not work on any other platform
end
