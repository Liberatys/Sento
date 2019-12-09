# frozen_string_literal: true

require_relative '../Plugin.rb'
require 'os'

class ChocoPlug < Plugin
  @@base_command = 'choco'

  def install(arguments)
    if supported_platform?([Platform::WINDOWS]) == false
      return 'The cocho plugin is only available on Windows'
    end
    if system('choco feature disable -n allowGlobalConfirmation').nil?
      return 'choco is not a known command'
    end

    progress_list = []
    arguments.each do |package|
      progress_list.push(install_package(package))
    end
    system('choco feature enable -n allowGlobalConfirmation')
    progress_list
  end

  def install_package(package)
    # TODO: implement argument escape for this system call
    result = system("#{@@base_command} install #{package} --yes")
    if result == true
      return "Successfully installed #{package}"
    elsif result == false
      return "Instllation of #{package} failed"
    end

    'Unknown command'
  end

  def update(arguments); end
end
