# frozen_string_literal: true
#
require_relative File.expand_path('../lib/Sento.rb')
require 'os'

class PacmanPlugin < Plugin
  #! all pacman operations need to be executed as root
  @@base_command = 'sudo pacman'

  def completeUpdate()
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
