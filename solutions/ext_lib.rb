

require 'ap'
require 'date'


class Fiboacci
  attr_reader :val, :no
  attr :old_val

  def initialize
    @old_val = 0
    @val = 1
    @no = 1
  end

  def next
    @old_val, @val = @val, @old_val + @val
    @no += 1
    @val
  end
end


