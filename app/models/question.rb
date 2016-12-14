class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers, inverse_of: :question 

  accepts_nested_attributes_for :answers

  validate :only_one_right_answer

  def only_one_right_answer
    if answers.to_a.count(&:right) != 1
      errors.add(:answers, "One answer must be right")
    end
  end
end
