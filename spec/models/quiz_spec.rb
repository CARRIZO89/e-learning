require 'rails_helper'

describe Quiz do 
  describe 'validations' do    
    let(:quiz) { build :quiz }

    it 'fails if it does not have any question' do
      expect(quiz.valid?).to be false
    end
  end
end
