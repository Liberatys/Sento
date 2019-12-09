# frozen_string_literal: true

require_relative 'Sento.rb'
require 'os'

class BrewPlugin < Plugin
  @@base_command = 'brew'

  def install(arguments)
    if supported_platform?([Platform::MACOS]) == false
      return 'The brew plugin is only available on MacOs | OsX'
    end

    progress_list = []
    arguments.each do |package|
      progress_list.push(act_on_package(package, 'install'))
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

    progress_list = []
    arguments.each do |package|
      progress_list.push(act_on_package(package, 'upgrade'))
    end
    progress_list
  end

  # ! brew is a tool for mac and therefore should not work on any other platform
end
