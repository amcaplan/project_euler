require 'chronic'

class SundayFinder
  def initialize(date1, date2)
    @date1 = Chronic.parse(date1).to_date
    @date2 = Chronic.parse(date2).to_date
  end

  def num_month_beginning_sundays
    (@date1...@date2).count do |date|
      date.sunday? && date.day == 1
    end
  end
end