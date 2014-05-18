class TriangleNumberGenerator
  attr_accessor :i, :current_number

  def self.all
    generator = self.new
    Enumerator.new do |y|
      loop do
        y << generator.next
      end
    end
  end

  def initialize
    @i = 0
    @current_number = 0
  end

  def next
    self.i += 1
    self.current_number += self.i
  end
end