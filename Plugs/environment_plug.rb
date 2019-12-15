# frozen_string_literal: true

require_relative File.expand_path('../lib/Sento.rb')
require 'os'

class EnvironmentPlugin < Plugin
  def get(arguments); end

  def set(arguments); end

  def add(arguments); end

  def platform_switch; end
end
