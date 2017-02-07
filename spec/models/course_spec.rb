require 'rails_helper'

describe Course do
  describe 'validations' do
    let (:course) { build :course }

    it 'fails if it has no course module' do
      expect(course.valid?).to be false
    end
  end
end