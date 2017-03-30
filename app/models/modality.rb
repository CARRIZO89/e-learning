class Modality < ApplicationRecord
  has_many :courses

  def multiple_choice?
    name.underscore.inquiry.multiple_choice?
  end
end
