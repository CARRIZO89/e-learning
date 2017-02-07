FactoryGirl.define do
  factory :answer, aliases: [:right_answer] do
    right true

    factory :wrong_answer do
      right false
    end
  end
end