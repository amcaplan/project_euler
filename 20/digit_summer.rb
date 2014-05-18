module DigitSummer
  def self.sum(num)
    num.to_s.split('').inject(0){|sum, num| sum + num.to_i}
  end
end