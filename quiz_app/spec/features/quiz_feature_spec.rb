require 'spec_helper'

	def create_quiz(sometitle)
		Quiz.create(:title => sometitle)
	end

	describe 'the quizzes section' do

	before(:all) do
    	create_quiz 'Some quiz'
  	end

	describe '/quizzes' do
		it 'should display quizzes' do
		visit '/quizzes'
		expect(page).to have_content 'Some quiz'	
		end	
	end

	describe 'an individual quiz' do
		it 'has its own page' do
		visit '/quizzes'
		click_link 'Some quiz'
		expect(current_path).to eq '/quizzes/1'
		expect(page).to have_css 'h1', text: 'Some quiz'
		end
	end		

	describe 'new quiz form' do
    it 'creates a new quiz' do
      visit '/quizzes/new'

      within '.new_quiz' do
        fill_in 'Title', with: 'Brand new quiz'
        click_button "Create Quiz"
      end

      expect(current_url).to eq url_for(Quiz.last)
      expect(page).to have_content 'Brand new quiz'
    end
  end

end