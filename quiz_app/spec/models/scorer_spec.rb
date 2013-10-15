require 'spec_helper'

describe Scorer do

 context 'all answers are wrong' do

    it 'should return 0' do
      @quiz = double :quiz, correct_answer_ids: [1, 2]
      scorer = Scorer.new(@quiz)

      answer_ids = [3, 4]
      expect(scorer.total(answer_ids)).to eq(0)
    end

  end


 context 'some answers are right' do

    it 'should return 0' do
      @quiz = double :quiz, correct_answer_ids: [1, 2]
      scorer = Scorer.new(@quiz)

      answer_ids = [1, 4]
      expect(scorer.total(answer_ids)).to eq(1)
    end
    
  end

end