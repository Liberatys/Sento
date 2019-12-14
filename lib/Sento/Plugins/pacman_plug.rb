# frozen_string_literal: true

require_relative '../Plugin.rb'
require 'os'

class PacmanPlugin < Plugin
  @@base_command = 'pacman'

  def completeUpdate(arguments)
    act_on_package("","-Syu")
  end


  def install(arguments)
    if supported_platform?([Platform::UNIX]) == false
      return 'The pacman plugin is only available on Linux | Linux'
    end

    progress_list = []
    arguments.each do |package|
      progress_list.push(act_on_package(package, '-S'))
    end
    progress_list
  end
  #TODO improve message for success or failure
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
    if supported_platform?([Platform::UNIX]) == false
      return 'The pacman plugin is only available on Linux | Unix'
    end
    progress_list = []
    arguments.each do |package|
      progress_list.push(act_on_package(package, '-S'))
    end
    progress_list
  end

end
