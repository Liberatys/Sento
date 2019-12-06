# frozen_string_literal: true
require_relative "./Plugger.rb"
class Plugin < Plugger
  def initializes; end


  def install(args)
    p args
  end
end
