class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :between_dates, -> (value, initial_date, final_date) {
    where "('#{value}' BETWEEN #{initial_date} AND #{final_date})"
   }
end
