require_relative "./flag.rb"

class ArgumentReader

  def initialize(_args)
    @arguments = _args
    @flag_sets = Hash.new
  end

 def parse_arguments(expected_flags)
    arguments = @arguments
    current_flag = nil
    arguments.each do |arg|
      #! can only be nil in first iteration
      if current_flag == nil and arg.start_with?("-")
        current_flag = Flag.new(arg)
        next
      end
      #! init for a flag
      if arg.start_with?("-")
        @flag_sets[current_flag.get_key] = current_flag
        if expected_flags.include?(arg) == false
          raise "Unexpected flag #{arg} was provided"
        end
        current_flag = Flag.new(arg)
      else
        if arg.empty? == false
          current_flag.add_value(arg)
        end
      end
    end
    @flag_sets[current_flag.get_key] = current_flag
    return @flag_sets
  end

  def get_flag_value_for_key(key)
    return @flag_sets[key]
  end


  def get_flag_set
    return @flag_sets
  end

  def flags_are_set?(flags)
    flags.each do |flag|
      if @flag_sets[flag].nil? or @flag_sets[flag].empty?
        return false
      end
    end
    return true
  end
end
