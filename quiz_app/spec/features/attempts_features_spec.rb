require 'spec_helper'

describe 'Attempt' do
before(:each) do 
	@quiz = Quiz.create(title: 'My Quiz')
	question1 = Question.create query: 'What is the capital of the UK?',
								answers: [Answer.create(response: 'London', correctness: true),
										  Answer.create(response: 'Paris', correctness: false)]
	question2 = Question.create query: 'What is the capital of Australia?',
								answers: [Answer.create(response: 'Sydney', correctness: false),
											Answer.create(response: 'Canberra', correctness: true)]

	@quiz.questions += [question1, question2]
end 

describe 'taking a quiz' do 
	it 'gives the score' do
		visit new_quiz_attempt_path(@quiz)

		choose 'London'
		choose 'Sydney'

		click_button 'Submit'
		expect(page).to have_content '50%'
	end
end

end